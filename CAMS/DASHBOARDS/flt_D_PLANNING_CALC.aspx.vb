Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class DASHBOARDS_flt_D_PLANNING_CALC
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        RadCB_Model.SelectedValue = "%"
        Me.HF_A_ID.Value = "%"
        RadCB_Level3.SelectedValue = "%"
        RadCB_Repair_Code.SelectedValue = "%"
        RadCB_Status.SelectedValue = "%"
        Me.RadNumTxt_New_Hours.Text = ""
        Me.RadNumTxt_New_Hours.Visible = False
        Me.lblNewHours.Visible = False
        Me.RadNumTxt_New_Trend.Text = ""
        Me.RadNumTxt_New_Trend.Visible = False
        Me.lblNewTrend.Visible = False
        Me.RadNumTxt_New_Trend_Period.Text = ""
        Me.RadCB_Asset.DataBind()
        For Each itm As RadComboBoxItem In RadCB_Asset.Items
            itm.Checked = True
        Next
        GetDefaultDates()
        GetSYS()
    End Sub
    Sub GetSYS()
        Dim dvSql As DataView = DirectCast(SqlDS_SYS.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        Next
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
        Dim seriesName As String = RadChart1.PlotArea.XAxis.Name

        If seriesName = "Year" Then
            Year = Integer.Parse(e.Argument)
            SqlDS_RadGrid_PLANNING_CHART_QUARTER.SelectParameters(0).DefaultValue = Year.ToString()
            RadChart1.PlotArea.XAxis.Name = "Quarter"
            RadChart1.PlotArea.XAxis.DataLabelsField = "QuarterLabel"
            RadChart1.PlotArea.XAxis.LabelsAppearance.RotationAngle = "0"
            RadChart1.PlotArea.XAxis.EnableBaseUnitStepAuto = False
            RadChart1.PlotArea.CommonTooltipsAppearance.ClientTemplate = "#=dataItem.QuarterLabel#"
            RadChart1.PlotArea.XAxis.Type = HtmlChart.AxisType.Auto
            RadChart1.PlotArea.XAxis.BaseUnit = HtmlChart.DateTimeBaseUnit.Auto
            RadChart1.DataSourceID = "SqlDS_RadGrid_PLANNING_CHART_QUARTER"
            RadChart1.ChartTitle.Text = "Current vs Projected Spend - (Quarterly for FY" + Year.ToString() + ")"
        Else
            If seriesName = "Quarter" Then
                RadChart1.PlotArea.XAxis.Name = "Month"
                RadChart1.PlotArea.XAxis.DataLabelsField = "OverallDate"
                RadChart1.PlotArea.XAxis.LabelsAppearance.RotationAngle = "90"
                RadChart1.PlotArea.XAxis.EnableBaseUnitStepAuto = False
                RadChart1.PlotArea.CommonTooltipsAppearance.ClientTemplate = "#=dataItem.OverallDateTest#"
                RadChart1.PlotArea.XAxis.Type = HtmlChart.AxisType.Auto
                RadChart1.PlotArea.XAxis.BaseUnit = HtmlChart.DateTimeBaseUnit.Auto
                RadChart1.DataSourceID = "SqlDS_RadGrid_PLANNING_CHART_MONTH"
                RadChart1.ChartTitle.Text = "Current vs Projected Spend - (Monthly)"
            End If
        End If
    End Sub
    Private Sub btn_ResetChart_Click(sender As Object, e As EventArgs) Handles btn_ResetChart.Click
        RadChart1.PlotArea.XAxis.Name = "Year"
        RadChart1.PlotArea.XAxis.DataLabelsField = "YearSort"
        RadChart1.PlotArea.XAxis.LabelsAppearance.RotationAngle = "0"
        RadChart1.PlotArea.XAxis.EnableBaseUnitStepAuto = False
        RadChart1.PlotArea.CommonTooltipsAppearance.ClientTemplate = "#=dataItem.YearSort#"
        RadChart1.PlotArea.XAxis.Type = HtmlChart.AxisType.Auto
        RadChart1.PlotArea.XAxis.BaseUnit = HtmlChart.DateTimeBaseUnit.Auto
        RadChart1.DataSourceID = "SqlDS_RadGrid_PLANNING_CHART_YEAR"
        RadChart1.ChartTitle.Text = "Current vs Projected Spend - (Financial Year)"
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
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Dashboards - Planning - Calculator"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Sub GetDefaultDates()
        Dim GetFromYear As Integer
        Dim GetToYear As Integer
        Dim GetMonth As Integer
        Dim BuildFromDate As String
        Dim BuildToDate As String
        If DateFrom.SelectedDate Is Nothing Then
            GetFromYear = DatePart(DateInterval.Year, DateTime.Now)
            GetToYear = DatePart(DateInterval.Year, DateTime.Now)
            GetMonth = DatePart(DateInterval.Month, DateTime.Now)
            GetFromYear = GetFromYear - 1
            GetToYear = GetToYear + 5
            BuildFromDate = CStr(GetFromYear) + "-10-01"
            BuildToDate = CStr(GetToYear) + "-10-01"
            HF_From.Value = BuildFromDate
            HF_To.Value = BuildToDate
            DateFrom.SelectedDate = HF_From.Value
            DateTo.SelectedDate = HF_To.Value
        Else
        End If
    End Sub
    Protected Sub btn_Refresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Refresh.Click
        RadCB_Model.SelectedValue = "%"
        RadCB_Level3.SelectedValue = "%"
        RadCB_Repair_Code.SelectedValue = "%"
        RadCB_Status.SelectedValue = "%"
        Me.RadNumTxt_New_Hours.Text = ""
        Me.RadNumTxt_New_Hours.Visible = False
        Me.lblNewHours.Visible = False
        Me.RadNumTxt_New_Trend.Text = ""
        Me.RadNumTxt_New_Trend.Visible = False
        Me.lblNewTrend.Visible = False
        Me.RadNumTxt_New_Trend_Period.Text = ""
        Me.DateFrom.SelectedDate = Nothing
        Me.DateTo.SelectedDate = Nothing
        Me.btn_ResetChart.Visible = False
        Me.HF_A_ID.Value = "%"
        Me.RadCB_Asset.DataBind()
        Me.HF_MOD_ID.Value = "%"
        Me.HF_Level3.Value = "%"
        Me.HF_Repair_Code.Value = "%"
        Me.HF_New_Hours.Value = 0
        Me.HF_New_Trend.Value = 0
        Me.HF_New_Trend_Period.Value = 0
        Me.HF_From.Value = "1900-01-01"
        Me.HF_To.Value = "2100-01-01"
        GetDefaultDates()
        Me.RadGrid_PLANNING.Rebind()
        RadChart1.PlotArea.XAxis.Name = "Year"
        RadChart1.PlotArea.XAxis.DataLabelsField = "YearSort"
        RadChart1.PlotArea.XAxis.LabelsAppearance.RotationAngle = "0"
        RadChart1.PlotArea.XAxis.EnableBaseUnitStepAuto = False
        RadChart1.PlotArea.CommonTooltipsAppearance.ClientTemplate = "#=dataItem.YearSort#"
        RadChart1.PlotArea.XAxis.Type = HtmlChart.AxisType.Auto
        RadChart1.PlotArea.XAxis.BaseUnit = HtmlChart.DateTimeBaseUnit.Auto
        RadChart1.DataSourceID = "SqlDS_RadGrid_PLANNING_CHART_YEAR"
        RadChart1.ChartTitle.Text = "Current vs Project Spend - (Financial Year)"
        Me.RadChart1.Visible = False
        ParameterBasedFormatting()

    End Sub
    Protected Sub RadCB_Model_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Model.SelectedIndexChanged
        Me.HF_MOD_ID.Value = RadCB_Model.SelectedValue
        RadCB_Level3.SelectedValue = "%"
        RadCB_Repair_Code.SelectedValue = "%"
        RadCB_Status.SelectedValue = "%"
        Me.RadNumTxt_New_Hours.Text = ""
        Me.RadNumTxt_New_Hours.Visible = False
        Me.lblNewHours.Visible = False
        Me.RadNumTxt_New_Trend.Text = ""
        Me.RadNumTxt_New_Trend.Visible = False
        Me.lblNewTrend.Visible = False
        Me.RadNumTxt_New_Trend_Period.Text = ""
        Me.btn_ResetChart.Visible = True
        Me.HF_A_ID.Value = "%"
        Me.HF_Level3.Value = "%"
        Me.HF_Repair_Code.Value = "%"
        Me.HF_New_Hours.Value = 0
        Me.HF_New_Trend.Value = 0
        Me.HF_New_Trend_Period.Value = 0
        RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Private Shared Sub ShowCheckedItems(ByVal comboBox As RadComboBox, ByVal HF_A_ID As HiddenField)
        Dim sb As New StringBuilder()
        Dim collection As IList(Of RadComboBoxItem) = comboBox.CheckedItems
        If (collection.Count <> 0) Then
            'sb.Append("<ul class=""results"">")
            For Each item As RadComboBoxItem In collection
                sb.Append(item.Value + ",")
            Next
            'sb.Append("</ul>")
            HF_A_ID.Value = sb.ToString()
        Else
        End If
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        ShowCheckedItems(RadCB_Asset, HF_A_ID)
        RadCB_Level3.SelectedValue = "%"
        RadCB_Repair_Code.SelectedValue = "%"
        RadCB_Status.SelectedValue = "%"
        Me.RadNumTxt_New_Hours.Text = ""
        Me.RadNumTxt_New_Trend.Text = ""
        Me.RadNumTxt_New_Trend_Period.Text = ""
        Me.HF_Level3.Value = "%"
        Me.HF_Repair_Code.Value = "%"
        Me.HF_New_Hours.Value = 0
        Me.HF_New_Trend.Value = 0
        Me.HF_New_Trend_Period.Value = 0
        Me.btn_ResetChart.Visible = True
        If HF_A_ID.Value = "%" Then
            Me.RadNumTxt_New_Hours.Visible = False
            Me.lblNewHours.Visible = False
            Me.RadNumTxt_New_Trend.Visible = False
            Me.lblNewTrend.Visible = False
        Else
            Me.RadNumTxt_New_Hours.Visible = False
            Me.lblNewHours.Visible = False
            If Me.RadNumTxt_New_Trend_Period.Text <> "" Then
                Me.RadNumTxt_New_Trend.Visible = False
                Me.lblNewTrend.Visible = False
            Else
                Me.RadNumTxt_New_Trend.Visible = True
                Me.lblNewTrend.Visible = True
            End If
        End If

        RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Protected Sub RadCB_Level3_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level3.SelectedIndexChanged
        Me.HF_Level3.Value = RadCB_Level3.SelectedValue
        Me.btn_ResetChart.Visible = True
        RadCB_Repair_Code.SelectedValue = "%"
        Me.HF_Repair_Code.Value = "%"
        RadCB_Status.SelectedValue = "%"
        If RadCB_Level3.SelectedValue = "%" Then
            If HF_A_ID.Value = "%" Then
                Me.RadNumTxt_New_Hours.Visible = False
                Me.lblNewHours.Visible = False
                Me.RadNumTxt_New_Trend.Visible = False
                Me.lblNewTrend.Visible = False
            Else
                Me.RadNumTxt_New_Hours.Visible = False
                Me.lblNewHours.Visible = False
                Me.RadNumTxt_New_Trend.Visible = True
                Me.lblNewTrend.Visible = True
            End If
        Else
            If HF_A_ID.Value = "%" Then
                Me.RadNumTxt_New_Hours.Visible = True
                Me.lblNewHours.Visible = True
                Me.RadNumTxt_New_Trend.Visible = False
                Me.lblNewTrend.Visible = False
            Else
                Me.RadNumTxt_New_Hours.Visible = True
                Me.lblNewHours.Visible = True
                Me.RadNumTxt_New_Trend.Visible = True
                Me.lblNewTrend.Visible = True
            End If
        End If
        RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Protected Sub RadCB_Repair_Code_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Repair_Code.SelectedIndexChanged
        Me.HF_Repair_Code.Value = RadCB_Repair_Code.SelectedValue
        Me.btn_ResetChart.Visible = True
        RadCB_Level3.SelectedValue = "%"
        Me.HF_Level3.Value = "%"
        RadCB_Status.SelectedValue = "%"
        If RadCB_Repair_Code.SelectedValue = "%" Then
            If HF_A_ID.Value = "%" Then
                Me.RadNumTxt_New_Hours.Visible = False
                Me.lblNewHours.Visible = False
                Me.RadNumTxt_New_Trend.Visible = False
                Me.lblNewTrend.Visible = False
            Else
                Me.RadNumTxt_New_Hours.Visible = False
                Me.lblNewHours.Visible = False
                Me.RadNumTxt_New_Trend.Visible = True
                Me.lblNewTrend.Visible = True
            End If
        Else
            If HF_A_ID.Value = "%" Then
                Me.RadNumTxt_New_Hours.Visible = True
                Me.lblNewHours.Visible = True
                Me.RadNumTxt_New_Trend.Visible = False
                Me.lblNewTrend.Visible = False
            Else
                Me.RadNumTxt_New_Hours.Visible = True
                Me.lblNewHours.Visible = True
                Me.RadNumTxt_New_Trend.Visible = True
                Me.lblNewTrend.Visible = True
            End If
        End If
        RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        Me.HF_Status.Value = RadCB_Status.SelectedValue
        Me.btn_ResetChart.Visible = True
        Me.RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Protected Sub RadNumTxt_New_Hours_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_New_Hours.TextChanged
        Me.HF_New_Hours.Value = Me.RadNumTxt_New_Hours.Text
        Me.btn_ResetChart.Visible = True
        Me.RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Protected Sub RadNumTxt_New_Trend_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_New_Trend.TextChanged
        Me.HF_New_Trend.Value = Me.RadNumTxt_New_Trend.Text
        Me.btn_ResetChart.Visible = True
        Me.RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Protected Sub RadNumTxt_New_Trend_Period_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_New_Trend_Period.TextChanged
        RadChart1.Dispose()
        Me.btn_ResetChart.Visible = True
        Me.HF_New_Trend_Period.Value = Me.RadNumTxt_New_Trend_Period.Text
        Me.RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Protected Sub DateFrom_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles DateFrom.SelectedDateChanged
        Me.HF_From.Value = DateFrom.SelectedDate.ToString()
        Dim ThisMonth As Date
        ThisMonth = DateFrom.SelectedDate
        Me.HF_From.Value = DateTime.Parse(DateFrom.SelectedDate).ToString("yyyy-MM-dd")
        'DateTo.SelectedDate = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        'Me.HF_To.Value = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        'Me.HF_To.Value = DateTime.Parse(DateTo.SelectedDate).ToString("yyyy-MM-dd")
        RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.btn_ResetChart.Visible = True
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Protected Sub DateTo_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles DateTo.SelectedDateChanged
        HF_To.Value = DateTo.SelectedDate.ToString()
        Me.HF_To.Value = DateTime.Parse(DateTo.SelectedDate).ToString("yyyy-MM-dd")
        RadGrid_PLANNING.DataBind()
        Me.RadChart1.DataBind()
        Me.btn_ResetChart.Visible = True
        Me.RadChart1.Visible = True
        ParameterBasedFormatting()
    End Sub
    Protected Sub RadGrid_Planning_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_PLANNING.ItemDataBound
        For Each item As GridDataItem In RadGrid_PLANNING.Items
            Dim myTotalCell2 As TableCell = item("STM_SMU_Value")
            If InStr(myTotalCell2.Text, "&nbsp;") Then
            Else
            End If
            Dim myTotalCell4 As TableCell = item("STM_Planning_Status")
            Dim ThisTotal4 = myTotalCell4.Text
            Dim myTotalCell5 As TableCell = item("STM_Date_Estimate")
            Dim ThisTotal5 = myTotalCell5.Text
            Dim myTotalCell3 As TableCell = item("ChangeDue")
            Dim ThisTotal3 = myTotalCell3.Text
            If InStr(myTotalCell3.Text, "&nbsp;") Then
            Else
                If ThisTotal4 <> "Monitoring" And ThisTotal3 < 0 Then
                    item("ChangeDue").ForeColor = Drawing.Color.Red
                Else
                End If
            End If
        Next
        ParameterBasedFormatting()
    End Sub
    Sub ParameterBasedFormatting()
        For Each item As GridDataItem In RadGrid_PLANNING.Items
            Dim Asset As TableCell = item("Asset")
            Dim AssetValue = Asset.Text
            Dim Model As TableCell = item("Model")
            Dim ModelValue = Model.Text
            Dim L3 As TableCell = item("Level3")
            Dim L3Value = L3.Text
            Dim Status As TableCell = item("STM_Planning_Status")
            Dim StatusValue = Status.Text
            Dim Trend As TableCell = item("Trend_Current")
            Dim TrendTotal = Trend.Text
            Dim TrendCustom As TableCell = item("Trend_Custom")
            Dim TrendCustomTotal = TrendCustom.Text
            Dim Freq As TableCell = item("STM_Frequency")
            Dim FreqTotal = Freq.Text
            Dim FreqCustom As TableCell = item("STM_Frequency_Custom")
            Dim FreqCustomTotal = FreqCustom.Text
            Dim DateOriginal As TableCell = item("STM_Date_Estimate")
            Dim DateCustom As TableCell = item("STM_Date_Estimate_Custom")
            Dim EstimateDiff As TableCell = item("EstimateDiff")

            If AssetValue <> "%" Then
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Asset").Display = True
            Else
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Asset").Display = False
            End If
            If ModelValue <> "%" Then
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Model").Display = True
            Else
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Model").Display = False
            End If
            If L3Value <> "%" Then
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Level3").Display = True
            Else
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Level3").Display = False
            End If
            If StatusValue <> "%" Then
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Planning_Status").Display = True
            Else
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Planning_Status").Display = False
            End If
            If RadNumTxt_New_Hours.Text <> "" Or RadNumTxt_New_Trend_Period.Text <> "" Then
                Freq.BackColor = Drawing.Color.FromName("#fbc295")
                Trend.BackColor = Drawing.Color.FromName("#fbc295")
                DateOriginal.BackColor = Drawing.Color.FromName("#fbc295")
                FreqCustom.BackColor = Drawing.Color.FromName("#95caff")
                TrendCustom.BackColor = Drawing.Color.FromName("#95caff")
                DateCustom.BackColor = Drawing.Color.FromName("#95caff")
                EstimateDiff.BackColor = Drawing.Color.FromName("#d3a8ff")
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Asset").Display = True
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Frequency_Custom").Display = True
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Trend_Custom").Display = True
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Date_Estimate_Custom").Display = True
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("EstimateDiff").Display = True
            End If
            If RadNumTxt_New_Trend.Text <> "" And RadCB_Asset.SelectedValue <> "%" And TrendTotal <> TrendCustomTotal Then
                Freq.BackColor = Drawing.Color.Empty
                Trend.BackColor = Drawing.Color.FromName("#fbc295")
                DateOriginal.BackColor = Drawing.Color.FromName("#fbc295")
                FreqCustom.BackColor = Drawing.Color.Empty
                TrendCustom.BackColor = Drawing.Color.FromName("#95caff")
                DateCustom.BackColor = Drawing.Color.FromName("#95caff")
                EstimateDiff.BackColor = Drawing.Color.FromName("#d3a8ff")
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Asset").Display = False
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Frequency_Custom").Display = False
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Trend_Custom").Display = True
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Date_Estimate_Custom").Display = True
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("EstimateDiff").Display = True
            End If
            If RadNumTxt_New_Hours.Text = "" And RadNumTxt_New_Trend.Text = "" And RadNumTxt_New_Trend_Period.Text = "" Then
                Freq.BackColor = Drawing.Color.Empty
                Trend.BackColor = Drawing.Color.Empty
                DateOriginal.BackColor = Drawing.Color.Empty
                FreqCustom.BackColor = Drawing.Color.Empty
                TrendCustom.BackColor = Drawing.Color.Empty
                DateCustom.BackColor = Drawing.Color.Empty
                EstimateDiff.BackColor = Drawing.Color.Empty
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Asset").Display = True
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Frequency_Custom").Display = False
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Trend_Custom").Display = False
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Date_Estimate_Custom").Display = False
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("EstimateDiff").Display = False
            End If
            If RadNumTxt_New_Hours.Visible = False Then
                Freq.BackColor = Drawing.Color.Empty
                FreqCustom.BackColor = Drawing.Color.Empty
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Frequency_Custom").Display = False
            End If
            If TrendTotal = TrendCustomTotal Then
                Trend.BackColor = Drawing.Color.Empty
                TrendCustom.BackColor = Drawing.Color.Empty
                RadGrid_PLANNING.MasterTableView.GetColumnSafe("Trend_Custom").Display = False
            End If
        Next
    End Sub
End Class