Imports Telerik.Web.UI
Imports System.Data

Imports System.Data.SqlClient
Partial Class DASHBOARDS_flt_D_ENGINEER_REPORT
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        Setup_Site_Combo()
        Me.RadCB_Site.SelectedValue = -1
        Setup_Engineers_Combo()
        Me.HF_Engineer.Value = "-1,"
        GetSYS()
        Me.Table101.Visible = True
        Me.Table102.Visible = True
        Me.Table103.Visible = True
        Me.Table104.Visible = True
    End Sub
    Sub GetSYS()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GET_SYS_SP()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        End If
    End Sub
    Sub Get_Session_Info(ByVal SESSION_ID As Integer, ByVal CLIENT_APP_ID As Integer)
        Me.HF_Session_ID.Value = SESSION_ID
        Me.HF_Client_APP_ID.Value = CLIENT_APP_ID
        If HttpContext.Current.Request.IsLocal Then
            Me.HF_Username.Value = "Jonathan Snaith"
            Me.HF_PQQ_Permission.Value = "5"
            Me.HF_EMP_ID.Value = "595"
        Else
            Try
                Dim Qry As New Banks_Security.Security
                Qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ICT_CENTRALConnectionString").ConnectionString
                'xxx GET PERMISSIONS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
                Dim mPermissions As DataTable
                Qry.Session_ID = SESSION_ID
                Qry.Application_ID = CLIENT_APP_ID
                Qry.Execute_Get_Permissions()
                mPermissions = Qry.Permissions
                Dim dr As DataRow
                For Each dr In mPermissions.Rows
                    'Fields available : APPLICATION_ID, EMPLOYEE_ID, Is_Exception, EXCEPTION_ID, PERMISSION_ID, Value, SESSION_ID, Application_Title
                    If dr("APPLICATION_ID").ToString() = CLIENT_APP_ID Then
                        Select Case dr("Is_Exception").ToString()
                            Case 0 'APPLICATION PERMISSIONS
                                Me.HF_Username.Value = dr("Fullname").ToString()
                                Me.HF_PQQ_Permission.Value = dr("Value")
                                Me.HF_EMP_ID.Value = dr("EMPLOYEE_ID").ToString()
                            Case 1 ' APPLICATION EXCEPTIONS

                            Case Else
                        End Select
                    End If
                Next
                'xxx GET SETTINGS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                'Dim mSettings As DataTable
                'Qry.Execute_Get_Settings()
                'mSettings = Qry.Settings
                ''----
                'Dim drs As DataRow
                'For Each drs In mSettings.Rows
                '    Select Case drs("Category").ToString()
                '        Case "????"
                '            '
                '        Case Else
                '    End Select
                'Next
                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            Catch ex As Exception
                MsgBox(Err.Number & " " & Err.Description)
            End Try
        End If
        'End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "Dashboards - Engineer"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        ResetStuff()
        Widgets()
    End Sub
    Sub ResetStuff()
        Dim GetFromYear As Integer
        Dim GetToYear As Integer
        Dim GetMonth As Integer
        Dim BuildFromDate As String
        Dim BuildToDate As String
        GetFromYear = DatePart(DateInterval.Year, DateTime.Now)
        GetToYear = DatePart(DateInterval.Year, DateTime.Now)
        GetMonth = DatePart(DateInterval.Month, DateTime.Now)
        If GetMonth < 10 Then GetFromYear = GetFromYear - 1
        If GetMonth >= 10 Then GetToYear = GetToYear + 1
        BuildFromDate = CStr(GetFromYear) + "-10-01"
        BuildToDate = CStr(GetToYear) + "-10-01"
        HF_From.Value = BuildFromDate
        HF_To.Value = BuildToDate
        RadDP_From.SelectedDate = HF_From.Value
        Me.HF_From.Value = DateTime.Parse(RadDP_From.SelectedDate).ToString("yyyy-MM-dd")
        RadDP_To.SelectedDate = HF_To.Value
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        GetEngineerJobsGridData(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, "-1,", RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        GetEngineerJobTypeChartData(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, "-1,", RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        GetEngineerMachineTypeChartData(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, "-1,", RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        GetEngineerSkillsChartData(RadCB_Customer.SelectedValue, "-1,", RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        Widgets()
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames_EventManagement(RadCB_Customer, True, 3)
    End Sub
    Private Sub Setup_Site_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Site = Setup.Populate_SiteNames_EventManagement(RadCB_Site, RadCB_Customer.SelectedValue, True, 3)
    End Sub
    Private Sub Setup_Engineers_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers_EventManagement(RadCB_Engineer, -1, RadCB_Site.SelectedValue, False, 3)
    End Sub
    Private Sub GetEngineerJobsGridData(ByVal CUS_ID As Integer, SITE_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetEngineerJobsGridData(CUS_ID, SITE_ID, PER_EMP_ID, DateFrom, DateTo)
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        Dim ds2 As DataSet = qry.GetEngineerJobsGridDetailData(CUS_ID, SITE_ID, PER_EMP_ID, DateFrom, DateTo)
        Dim dtSub1 As DataTable
        dtSub1 = ds2.Tables(0)
        RadGrid1.MasterTableView.DataSource = dtMain1
        RadGrid1.MasterTableView.DetailTables(0).DataSource = dtSub1
        RadGrid1.EnableGroupsExpandAll = True
        RadGrid1.EnableHierarchyExpandAll = True
        RadGrid1.RetainExpandStateOnRebind = True
        RadGrid1.DataBind()

    End Sub
    Private Sub GetEngineerJobTypeChartData(ByVal CUS_ID As Integer, SITE_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetEngineerJobTypeChartData(CUS_ID, SITE_ID, PER_EMP_ID, DateFrom, DateTo)
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadHtmlChart1.DataSource = dtMain1
        RadHtmlChart1.DataBind()
    End Sub
    Private Sub GetEngineerMachineTypeChartData(ByVal CUS_ID As Integer, SITE_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetEngineerMachineTypeChartData(CUS_ID, SITE_ID, PER_EMP_ID, DateFrom, DateTo)
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadHtmlChart2.DataSource = dtMain1
        RadHtmlChart2.DataBind()
    End Sub
    Private Sub GetEngineerSkillsChartData(ByVal CUS_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetEngineerSkillsChartData(CUS_ID, PER_EMP_ID, DateFrom, DateTo)
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadarLineChart.DataSource = dtMain1
        RadarLineChart.DataBind()
    End Sub
#End Region
    Protected Sub RadBtn_Reset_Click(sender As Object, e As EventArgs) Handles RadBtn_Reset.Click
        Me.RadCB_Engineer.ClearCheckedItems()
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        Setup_Site_Combo()
        Me.RadCB_Site.SelectedValue = -1
        Setup_Engineers_Combo()
        Me.HF_Engineer.Value = "-1,"
        ResetStuff()
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Me.RadCB_Engineer.ClearCheckedItems()
        Setup_Site_Combo()
        Me.RadCB_Site.SelectedValue = -1
        Setup_Engineers_Combo()
        Me.RadCB_Engineer.SelectedValue = -1
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Me.RadCB_Engineer.ClearCheckedItems()
        Setup_Engineers_Combo()
        Me.RadCB_Engineer.SelectedValue = -1
    End Sub
    Private Shared Sub ShowCheckedItems(ByVal comboBox As RadComboBox, ByVal HF_Engineer As HiddenField)
        Dim sb As New StringBuilder()
        Dim collection As IList(Of RadComboBoxItem) = comboBox.CheckedItems
        If (collection.Count <> 0) Then
            'sb.Append("<ul class=""results"">")
            For Each item As RadComboBoxItem In collection
                sb.Append(item.Value + ",")
            Next
            'sb.Append("</ul>")
            HF_Engineer.Value = sb.ToString()
        Else
        End If
    End Sub
    Protected Sub RadDP_From_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_From.SelectedDateChanged
        Dim ThisMonth As Date
        ThisMonth = RadDP_From.SelectedDate.ToString()
        Me.HF_From.Value = RadDP_From.SelectedDate.ToString()
        Me.HF_From.Value = DateTime.Parse(RadDP_From.SelectedDate).ToString("yyyy-MM-dd")
        RadDP_To.SelectedDate = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        Me.HF_To.Value = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        Me.RadCB_Engineer.ClearCheckedItems()
        Setup_Engineers_Combo()
        Me.RadCB_Engineer.SelectedValue = -1
    End Sub
    Protected Sub RadDP_To_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDP_To.SelectedDateChanged
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        Me.RadCB_Engineer.ClearCheckedItems()
        Setup_Engineers_Combo()
        Me.RadCB_Engineer.SelectedValue = -1
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RadButton1.Click
        ShowCheckedItems(RadCB_Engineer, HF_Engineer)
        GetEngineerJobsGridData(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, HF_Engineer.Value, RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        GetEngineerJobTypeChartData(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, HF_Engineer.Value, RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        GetEngineerMachineTypeChartData(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, HF_Engineer.Value, RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        GetEngineerSkillsChartData(RadCB_Customer.SelectedValue, HF_Engineer.Value, RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        Widgets()
    End Sub
    Sub GridFormatting()
        For Each item As GridDataItem In RadGrid1.Items
            If item.OwnerTableView.Name = "Jobs" Then
                Dim TimeDiff As TableCell = item("J_Time_Diff")
                Dim TimeDiffMins As TableCell = item("J_Time_Diff_Minutes")
                Dim TimeDiffMinsText = TimeDiffMins.Text
                Select Case TimeDiffMinsText
                    Case <= 0
                        TimeDiff.ForeColor = Drawing.Color.FromName("#9bd562")
                        TimeDiff.Font.Bold = True
                    Case > 0
                        TimeDiff.ForeColor = Drawing.Color.Tomato
                        TimeDiff.Font.Bold = True
                End Select
            End If
        Next
    End Sub
    Private Sub RadGrid1_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid1.ItemDataBound
        GridFormatting()
    End Sub
    Sub Widgets()
        Dim TimeDiffMins As Double
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetEngineerJobsGridData_Widgets(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, HF_Engineer.Value, RadDP_From.SelectedDate, RadDP_To.SelectedDate)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lblCount_1.Text = drvSql("AvgJobHrs").ToString()
            TimeDiffMins = drvSql("J_Time_Diff_Minutes").ToString()
            Me.lblCount_2.Text = drvSql("AvgTimeDiff").ToString()
            Me.lblCount_3.Text = Format(drvSql("AvgCostJob"), "£#,##0.00")
            Me.lblCount_4.Text = drvSql("AvgUtil").ToString() + "%"
        End If
        If TimeDiffMins <= 0 Then
            lblCount_2.ForeColor = Drawing.Color.FromName("#9bd562")
        Else
            lblCount_2.ForeColor = Drawing.Color.Tomato
        End If
    End Sub
End Class