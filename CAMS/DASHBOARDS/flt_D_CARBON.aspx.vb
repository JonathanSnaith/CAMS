Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class DASHBOARDS_flt_D_CARBON
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
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
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        RadCB_Site.SelectedValue = "%"
        RadChart_Carbon_LPH.Visible = True
        RadChart_Litres.Visible = True
        RadP_Gas.Visible = True
        RadP_Fuel.Visible = True
        Me.RadCB_Asset.Visible = False
        HF_Process.Value = "1"
        GetSYS()
    End Sub
    Sub GetSYS()
        Dim dvSql As DataView = DirectCast(SqlDS_SYS.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        Next
    End Sub
    Sub Get_Session_Info(ByVal SESSION_ID As Integer, ByVal CLIENT_APP_ID As Integer)
        Me.HF_Session_ID.Value = SESSION_ID
        Me.HF_Client_APP_ID.Value = CLIENT_APP_ID
        If HttpContext.Current.Request.IsLocal Then
            Me.HF_Username.Value = "Jonathan Snaith"
            Me.lblWhoIsIt.Text = "Jonathan Snaith"
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
                                Me.lblWhoIsIt.Text = dr("Fullname").ToString()
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
    Public Property Year() As Integer
        Get
            If ViewState("Year") = Nothing Then
                Return 2003
            End If
            Return DirectCast(ViewState("Year"), Integer)
        End Get
        Set(value As Integer)
            ViewState("Year") = value
        End Set
    End Property
    Protected Sub RadAjaxManager1_AjaxRequest(sender As Object, e As AjaxRequestEventArgs)
        Dim seriesName As String = RadChart_Carbon_LPH.PlotArea.XAxis.Name

        If seriesName = "Year" Then
            Year = Integer.Parse(e.Argument)
            SqlDS_Carbon_LPH.SelectParameters(0).DefaultValue = Year.ToString()
            RadChart_Carbon_LPH.PlotArea.XAxis.Name = "Month"
            RadChart_Carbon_LPH.PlotArea.XAxis.DataLabelsField = "SMU_Date"
            RadChart_Carbon_LPH.DataSourceID = "SqlDS_Carbon_LPH"
            RadChart_Carbon_LPH.ChartTitle.Text = "Litres/Hr vs Carbon (kg) - Month View"
        Else
            If seriesName = "Month" Then
                RadChart_Carbon_LPH.PlotArea.XAxis.Name = "Year"
                RadChart_Carbon_LPH.PlotArea.XAxis.DataLabelsField = "YearType"
                RadChart_Carbon_LPH.DataSourceID = "SqlDS_Carbon_LPH_Year"
                RadChart_Carbon_LPH.ChartTitle.Text = "Litres/Hr vs Carbon (kg) - Year View"
            End If
        End If

        Dim seriesName2 As String = RadChart_Litres.PlotArea.XAxis.Name

        If seriesName2 = "Year" Then
            Year = Integer.Parse(e.Argument)
            SqlDS_Carbon_LPH.SelectParameters(0).DefaultValue = Year.ToString()
            RadChart_Litres.PlotArea.XAxis.Name = "Month"
            RadChart_Litres.PlotArea.XAxis.DataLabelsField = "SMU_Date"
            RadChart_Litres.DataSourceID = "SqlDS_Carbon_LPH"
            RadChart_Litres.ChartTitle.Text = "Total Litres - Month View"
        Else
            If seriesName2 = "Month" Then
                RadChart_Litres.PlotArea.XAxis.Name = "Year"
                RadChart_Litres.PlotArea.XAxis.DataLabelsField = "YearType"
                RadChart_Litres.DataSourceID = "SqlDS_Carbon_LPH_Year"
                RadChart_Litres.ChartTitle.Text = "Total Litres - Year View"
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Dashboards - Plant Resource Efficiency"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
        'Dim GetFromYear As Integer
        'Dim GetToYear As Integer
        'Dim GetMonth As Integer
        'Dim BuildFromDate As String
        'Dim BuildToDate As String
        'GetFromYear = DatePart(DateInterval.Year, DateTime.Now)
        'GetToYear = DatePart(DateInterval.Year, DateTime.Now)
        'GetMonth = DatePart(DateInterval.Month, DateTime.Now)
        'If GetMonth < 4 Then GetFromYear = GetFromYear - 1
        'If GetMonth >= 4 Then GetToYear = GetToYear + 1
        'BuildFromDate = CStr(GetFromYear) + "-04-01"
        'BuildToDate = CStr(GetToYear) + "-04-01"
        'HF_From.Value = BuildFromDate
        'HF_To.Value = BuildToDate
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Me.HF_Site.Value = RadCB_Site.SelectedValue
        If RadCB_Site.SelectedValue = "%" Then
            Me.RadCB_Asset.ClearCheckedItems()
            Me.RadCB_Asset.Visible = False
            lbl_AssetText.Visible = True
            RadChart_Carbon_LPH.Visible = True
            RadChart_Litres.Visible = True
            RadP_Gas.Visible = True
            RadP_Fuel.Visible = True
        Else
            HF_Process.Value = "2"
            Me.RadCB_Asset.Visible = True
            lbl_AssetText.Visible = False
            RadChart_Carbon_LPH.Visible = True
            RadChart_Litres.Visible = True
            RadP_Gas.Visible = True
            RadP_Fuel.Visible = False
        End If
    End Sub
    Protected Sub RadDP_From_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_From.SelectedDateChanged
        Dim ThisMonth As Date
        ThisMonth = RadDP_From.SelectedDate
        Me.HF_From.Value = ThisMonth
        Me.HF_From.Value = DateTime.Parse(RadDP_From.SelectedDate).ToString("yyyy-MM-dd")
        Me.lbl_From.Text = ThisMonth
        lbl_From.Text = "[" + lbl_From.Text + "]"
        RadDP_To.SelectedDate = DateAdd(DateInterval.Year, 1, ThisMonth)
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
    Protected Sub RadBtn_Reset_Click(sender As Object, e As EventArgs) Handles RadBtn_Reset.Click
        HF_Process.Value = "1"
        RadCB_Site.SelectedValue = "%"
        RadCB_Asset.ClearCheckedItems()
        RadCB_Asset.Visible = False
        HF_Asset.Value = "%"
        lbl_AssetText.Visible = True
        RadChart_Carbon_LPH.DataBind()
        RadChart_Carbon_LPH.Visible = True
        RadChart_Litres.DataBind()
        RadChart_Litres.Visible = True
        RadP_Gas.DataBind()
        RadP_Gas.Visible = True
        RadP_Fuel.DataBind()
        RadP_Fuel.Visible = True

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
    Private Shared Sub ShowCheckedItems(ByVal comboBox As RadComboBox, ByVal HF_Asset As HiddenField)
        Dim sb As New StringBuilder()
        Dim collection As IList(Of RadComboBoxItem) = comboBox.CheckedItems
        If (collection.Count <> 0) Then
            'sb.Append("<ul class=""results"">")
            For Each item As RadComboBoxItem In collection
                sb.Append(item.Value + ",")
            Next
            'sb.Append("</ul>")
            HF_Asset.Value = sb.ToString()
        Else
        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        ShowCheckedItems(RadCB_Asset, HF_Asset)
        RadChart_Carbon_LPH.Visible = True
        RadChart_Litres.Visible = True
        HF_Process.Value = "3"
        RadChart_Carbon_LPH.Visible = True
        RadChart_Litres.Visible = True
        RadP_Gas.Visible = True
        RadP_Fuel.Visible = False
    End Sub
End Class