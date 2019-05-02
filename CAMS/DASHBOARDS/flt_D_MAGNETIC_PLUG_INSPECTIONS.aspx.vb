Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class DASHBOARDS_flt_D_MAGNETIC_PLUG_INSPECTIONS
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
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
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        Setup_Asset_Combo()
        Setup_Compartment_Combo()
        Me.RadCB_Compartment.SelectedValue = -1
        Me.RadCB_Asset.Visible = True
        RadChart_MagPlug_Asset.Visible = False
        Me.Button1.Visible = False
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
            HF_PageName.Value = "Dashboards - Magnetic Plug Inspections"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
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
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames_EventManagement(RadCB_Customer, True, 7)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames_EventManagement(RadCB_Asset, RadCB_Customer.SelectedValue, -1, True, 6)
    End Sub
    Private Sub Setup_Compartment_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Compartment = Setup.Populate_CompartmentNames(RadCB_Compartment, -1, False)
    End Sub
    'Private Sub GetMagPlugsData(ByVal Customer As Integer, Asset As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime, Compartment As Integer)
    '    Dim qry As New Database.Queries
    '    qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
    '    Dim ds1 As DataSet = qry.GetMagPlugIns_SummaryReport_Asset(Customer, Asset, DateFrom, DateTo, Compartment)
    '    Dim dtMain1 As DataTable
    '    dtMain1 = ds1.Tables(0)
    '    RadGrid2.DataSource = dtMain1
    '    RadGrid2.DataBind()
    '    RadChart_MagPlug_Asset.DataSource = dtMain1
    '    RadChart_MagPlug_Asset.DataBind()
    'End Sub
#End Region
    Protected Sub RadBtn_Reset_Click(sender As Object, e As EventArgs) Handles RadBtn_Reset.Click
        Setup_Customer_Combo()
        Me.RadCB_Customer.SelectedValue = -1
        RadCB_Asset.ClearCheckedItems()
        Setup_Asset_Combo()
        Me.RadCB_Asset.SelectedValue = -1
        RadCB_Asset.Visible = True
        Setup_Compartment_Combo()
        Me.HF_Compartment.Value = "-1,"
        Me.Button1.Visible = False
        Me.RadGrid2.Visible = False
        RadChart_MagPlug_Asset.Visible = False
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
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Setup_Asset_Combo()
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_Compartment.ClearCheckedItems()
        Setup_Compartment_Combo()
        Me.HF_Compartment.Value = "-1,"
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged

        If RadCB_Asset.SelectedValue = -1 Or HF_Compartment.Value = "" Then
            Me.Button1.Visible = False
        Else
            Me.Button1.Visible = True
        End If
    End Sub
    Protected Sub RadCB_Compartment_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Compartment.SelectedIndexChanged
        Me.HF_Compartment.Value = Me.RadCB_Compartment.SelectedValue
        ShowCheckedItems(RadCB_Compartment, HF_Compartment)
        If RadCB_Asset.SelectedValue = -1 Or HF_Compartment.Value = "" Then
            Me.Button1.Visible = False
        Else
            Me.Button1.Visible = True
        End If
    End Sub

    Private Shared Sub ShowCheckedItems(ByVal comboBox As RadComboBox, ByVal HF_Compartment As HiddenField)
        Dim sb As New StringBuilder()
        Dim collection As IList(Of RadComboBoxItem) = comboBox.CheckedItems
        If (collection.Count <> 0) Then
            For Each item As RadComboBoxItem In collection
                sb.Append(item.Value + ",")
            Next
            HF_Compartment.Value = sb.ToString()
        Else
        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        ShowCheckedItems(RadCB_Compartment, HF_Compartment)
        ' GetMagPlugsData(RadCB_Customer.SelectedValue, HF_Asset.Value, HF_From.Value, HF_To.Value, RadCB_Compartment.SelectedValue)
        GetData()
        Me.RadGrid2.Visible = True
        RadChart_MagPlug_Asset.Visible = True
    End Sub
    Sub GetData()
        Dim dvSql As DataView = DirectCast(SqlDataSource4.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            '    Dim qry As New Database.Queries
            'qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            'Dim dt As DataTable = qry.GetMagPlugDataTable(RadCB_Customer.SelectedValue, HF_Asset.Value, HF_From.Value, HF_To.Value, RadCB_Compartment.SelectedValue)
            'If dt.Rows.Count > 0 Then
            '    Dim drvSql As DataRow = dt.Rows(0)
            Dim Compartment1Val As String
            Dim Compartment2Val As String
            Dim Compartment3Val As String
            Dim Compartment4Val As String
            Dim Compartment5Val As String
            Compartment1Val = drvSql("Compartment1").ToString()
            Compartment2Val = drvSql("Compartment2").ToString()
            Compartment3Val = drvSql("Compartment3").ToString()
            Compartment4Val = drvSql("Compartment4").ToString()
            Compartment5Val = drvSql("Compartment5").ToString()
            Me.RadChart_MagPlug_Asset.PlotArea.Series.Item(0).Name = Compartment1Val
            Me.RadChart_MagPlug_Asset.PlotArea.Series.Item(1).Name = Compartment2Val
            Me.RadChart_MagPlug_Asset.PlotArea.Series.Item(2).Name = Compartment3Val
            Me.RadChart_MagPlug_Asset.PlotArea.Series.Item(3).Name = Compartment4Val
            Me.RadChart_MagPlug_Asset.PlotArea.Series.Item(4).Name = Compartment5Val
            If Compartment1Val <> Nothing Then
                Me.RadGrid2.MasterTableView.GetColumn("Compartment1_Rating").HeaderText = Compartment1Val + " : Rating"
            Else
                Me.RadGrid2.MasterTableView.GetColumn("Compartment1_Rating").Display = "False"
            End If
            If Compartment2Val <> Nothing Then
                Me.RadGrid2.MasterTableView.GetColumn("Compartment2_Rating").HeaderText = Compartment2Val + " : Rating"
            Else
                Me.RadGrid2.MasterTableView.GetColumn("Compartment2_Rating").Display = "False"
            End If
            If Compartment3Val <> Nothing Then
                Me.RadGrid2.MasterTableView.GetColumn("Compartment3_Rating").HeaderText = Compartment3Val + " : Rating"
            Else
                Me.RadGrid2.MasterTableView.GetColumn("Compartment3_Rating").Display = "False"
            End If
            If Compartment4Val <> Nothing Then
                Me.RadGrid2.MasterTableView.GetColumn("Compartment4_Rating").HeaderText = Compartment4Val + " : Rating"
            Else
                Me.RadGrid2.MasterTableView.GetColumn("Compartment4_Rating").Display = "False"
            End If
            If Compartment5Val <> Nothing Then
                Me.RadGrid2.MasterTableView.GetColumn("Compartment5_Rating").HeaderText = Compartment5Val + " : Rating"
            Else
                Me.RadGrid2.MasterTableView.GetColumn("Compartment5_Rating").Display = "False"
            End If
            'End If
        Next
    End Sub
    Private Sub RadChart_MagPlug_Asset_DataBound(sender As Object, e As EventArgs) Handles RadChart_MagPlug_Asset.DataBound
        GetData()
    End Sub
    Private Sub RadGrid2_PreRender(sender As Object, e As EventArgs) Handles RadGrid2.PreRender
        GetData()
        Me.RadGrid2.Rebind()
    End Sub
    Private Sub RadGrid2_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid2.ItemDataBound
        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            Dim Compartment1Rating As TableCell = dataItem("Compartment1_Rating")
            Dim Compartment2Rating As TableCell = dataItem("Compartment2_Rating")
            Dim Compartment3Rating As TableCell = dataItem("Compartment3_Rating")
            Dim Compartment4Rating As TableCell = dataItem("Compartment4_Rating")
            Dim Compartment5Rating As TableCell = dataItem("Compartment5_Rating")
            If Compartment1Rating.Text = "5" Then
                Compartment1Rating.BackColor = Drawing.Color.Tomato
            ElseIf Compartment1Rating.Text = "4" Then
                Compartment1Rating.BackColor = Drawing.Color.OrangeRed
            Else
                Compartment1Rating.BackColor = Drawing.Color.Empty
            End If
            If Compartment2Rating.Text = "5" Then
                Compartment2Rating.BackColor = Drawing.Color.Tomato
            ElseIf Compartment2Rating.Text = "4" Then
                Compartment2Rating.BackColor = Drawing.Color.OrangeRed
            Else
                Compartment2Rating.BackColor = Drawing.Color.Empty
            End If
            If Compartment3Rating.Text = "5" Then
                Compartment3Rating.BackColor = Drawing.Color.Tomato
            ElseIf Compartment3Rating.Text = "4" Then
                Compartment3Rating.BackColor = Drawing.Color.OrangeRed
            Else
                Compartment3Rating.BackColor = Drawing.Color.Empty
            End If
            If Compartment4Rating.Text = "5" Then
                Compartment4Rating.BackColor = Drawing.Color.Tomato
            ElseIf Compartment4Rating.Text = "4" Then
                Compartment4Rating.BackColor = Drawing.Color.OrangeRed
            Else
                Compartment4Rating.BackColor = Drawing.Color.Empty
            End If
            If Compartment5Rating.Text = "5" Then
                Compartment5Rating.BackColor = Drawing.Color.Tomato
            ElseIf Compartment5Rating.Text = "4" Then
                Compartment5Rating.BackColor = Drawing.Color.OrangeRed
            Else
                Compartment5Rating.BackColor = Drawing.Color.Empty
            End If
        End If
    End Sub
End Class