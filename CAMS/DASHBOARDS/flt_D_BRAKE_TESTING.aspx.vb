Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class DASHBOARDS_flt_D_BRAKE_TESTING
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
        Dim GetFromYear As Integer
        Dim GetToYear As Integer
        Dim GetMonth As Integer
        Dim BuildFromDate As String
        Dim BuildToDate As String
        If RadDP_From.SelectedDate Is Nothing Then
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
            RadDP_To.SelectedDate = HF_To.Value
            lbl_From.Text = RadDP_From.SelectedDate
            lbl_From.Text = "[" + lbl_From.Text + "]"
            lbl_To.Text = RadDP_To.SelectedDate
            lbl_To.Text = "[" + lbl_To.Text + "]"
        Else
        End If
        Me.RadCB_Asset.Visible = True
        lbl_AssetText.Visible = False
        RadHtmlChart11.Visible = False
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        Setup_Asset_Combo()
        GetSYS()
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
            HF_PageName.Value = "Dashboards - Brake Testing"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
    End Sub
    Protected Sub RadBtn_Reset_Click(sender As Object, e As EventArgs) Handles RadBtn_Reset.Click
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        RadCB_Asset.ClearCheckedItems()
        Setup_Asset_Combo()
        Me.HF_Asset.Value = "-1,"
        RadCB_Asset.Visible = True
        lbl_AssetText.Visible = False
        Me.RadGrid2.Visible = False
        RadHtmlChart11.Visible = False
        RadHtmlChart1.Visible = False
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
        RadDP_To.SelectedDate = HF_To.Value
        lbl_From.Text = RadDP_From.SelectedDate
        lbl_To.Text = RadDP_To.SelectedDate
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames_EventManagement(RadCB_Customer, True, 6)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames_EventManagement(RadCB_Asset, RadCB_Customer.SelectedValue, -1, False, 5)
    End Sub
    Private Sub GetBrakeTestGridEfficiency(ByVal CUS_ID As Integer, Asset As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetBrakeTestGridEfficiency(CUS_ID, Asset, DateFrom, DateTo)
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadGrid2.DataSource = dtMain1
        RadGrid2.DataBind()
    End Sub
    Private Sub GetBrakeWearGridEfficiencyChartData(ByVal CUS_ID As Integer, Asset As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetBrakeWearGridEfficiencyChartData(CUS_ID, Asset, DateFrom, DateTo)
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadHtmlChart1.DataSource = dtMain1
        RadHtmlChart1.DataBind()
    End Sub
#End Region
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Me.RadCB_Asset.ClearCheckedItems()
        Setup_Asset_Combo()
        Me.HF_Asset.Value = "-1,"
    End Sub
    Protected Sub RadDP_From_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_From.SelectedDateChanged
        Dim ThisMonth As Date
        ThisMonth = RadDP_From.SelectedDate
        Me.HF_From.Value = ThisMonth
        Me.HF_From.Value = DateTime.Parse(RadDP_From.SelectedDate).ToString("yyyy-MM-dd")
        Me.lbl_From.Text = ThisMonth
        lbl_From.Text = "[" + lbl_From.Text + "]"
        RadDP_To.SelectedDate = DateAdd(DateInterval.Month, 1, ThisMonth)
        Me.HF_To.Value = RadDP_To.SelectedDate
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        Me.lbl_To.Text = RadDP_To.SelectedDate
        lbl_To.Text = "[" + lbl_To.Text + "]"
    End Sub
    Protected Sub RadDP_To_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDP_To.SelectedDateChanged
        Dim ThisMonth As Date
        ThisMonth = RadDP_To.SelectedDate
        Me.HF_To.Value = ThisMonth
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        Me.lbl_To.Text = ThisMonth
        lbl_To.Text = "[" + lbl_To.Text + "]"
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Me.HF_Asset.Value = Me.RadCB_Asset.SelectedValue
    End Sub
    Private Shared Sub ShowCheckedItems(ByVal comboBox As RadComboBox, ByVal HF_Asset As HiddenField)
        Dim sb As New StringBuilder()
        Dim collection As IList(Of RadComboBoxItem) = comboBox.CheckedItems
        If (collection.Count <> 0) Then
            For Each item As RadComboBoxItem In collection
                sb.Append(item.Value + ",")
            Next
            HF_Asset.Value = sb.ToString()
        Else
        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        ShowCheckedItems(RadCB_Asset, HF_Asset)
        Me.RadGrid2.Visible = True
        GetBrakeTestGridEfficiency(RadCB_Customer.SelectedValue, HF_Asset.Value, HF_From.Value, HF_To.Value)
        GetBrakeWearGridEfficiencyChartData(RadCB_Customer.SelectedValue, HF_Asset.Value, HF_From.Value, HF_To.Value)
        RadHtmlChart11.Visible = True
        'RadHtmlChart1.Visible = True
        'GetData2()
        'If HF_A_BWM.Value = "" Then
        RadHtmlChart1.Visible = False
        'End If
    End Sub
    'Sub GetData2()
    '    Dim dvSql As DataView = DirectCast(SqlDataSource5.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In dvSql
    '        RadHtmlChart1.ChartTitle.Text = "Brake Wear Measurements - " + drvSql("A_Asset_ID").ToString()
    '        HF_A_BWM.Value = drvSql("A_Asset_ID").ToString()
    '    Next
    'End Sub
    'Private Sub RadGrid2_PreRender(sender As Object, e As EventArgs) Handles RadGrid2.PreRender
    '    Me.RadGrid2.Rebind()
    'End Sub
End Class