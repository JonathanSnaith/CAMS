Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class DASHBOARDS_flt_D_HOSES
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
        GetServiceData()
        RadChart_Service_Split.Visible = True
        RadChart_Ratio.Visible = True
        GetPlannedData()
        RadChart_Planned_Reasons.Visible = True
        GetUnplannedData()
        RadChart_Unplanned_Reasons.Visible = True
        RadPie_Service_Split.Visible = True
        RadPie_Ratio.Visible = True
        RadPie_Planned_Reasons.Visible = True
        RadPie_Unplanned_Reasons.Visible = True
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
    Sub GetServiceData()
        RadChart_Service_Split.PlotArea.Series.Clear()
        Dim tbl As New DataTable()
        tbl.Columns.Add(New DataColumn("HOS_Date", GetType(Date)))
        tbl.Columns.Add(New DataColumn("Month", GetType(String)))
        RadChart_Service_Split.DataSource = tbl
        Dim dvSql1 As DataView = DirectCast(SqlDS_Hoses_All.Select(DataSourceSelectArguments.Empty), DataView)
        Dim HOS_Date As Date
        Dim Month As String
        Dim ColName As String
        Dim PCT As String
        For Each drvSql As DataRowView In dvSql1
            HOS_Date = drvSql("HOS_Date").ToString()
            Month = drvSql("Month").ToString()
            tbl.Rows.Add(New Object() {HOS_Date, Month})
        Next
        For i As Integer = 2 To dvSql1.Table.Columns.Count - 1
            ColName = dvSql1.Table.Columns(i).Caption
            tbl.Columns.Add(ColName)
        Next
        For i As Integer = 2 To dvSql1.Table.Columns.Count - 1
            ColName = dvSql1.Table.Columns(i).Caption
            For j As Integer = 0 To tbl.Rows.Count - 1 'LOOP ROWS IN DATATABLE
                For k As Integer = 0 To dvSql1.Count - 1 'LOOP ROWS IN SQLTABLE
                    PCT = dvSql1(k).Item(ColName).ToString
                    If PCT = "" Then
                        PCT = 0
                    End If
                    If j = k Then 'IF DATATABLEROW = SQLTABLEROW
                        tbl.Rows(j)(ColName) = PCT
                    Else
                    End If
                Next
            Next
        Next
        For i As Integer = 2 To tbl.Columns.Count - 1
            Dim PlannedColSeries As ColumnSeries = New ColumnSeries()
            Dim PCT2 As String
            ColName = tbl.Columns(i).Caption
            PlannedColSeries.Name = ColName
            PCT = tbl.Columns(i).Caption
            'PlannedColSeries.DataFieldY = PCT
            PlannedColSeries.LabelsAppearance.Visible = False
            RadChart_Service_Split.PlotArea.Series.Add(PlannedColSeries)
            For j As Integer = 0 To tbl.Rows.Count - 1 'LOOP ROWS IN DATATABLE
                For k As Integer = 0 To dvSql1.Count - 1 'LOOP ROWS IN SQLTABLE
                    PCT2 = dvSql1(k).Item(ColName).ToString
                    If PCT2 = "" Then
                        PCT2 = 0
                    End If
                    If j = k Then 'IF DATATABLEROW = SQLTABLEROW
                        PlannedColSeries.SeriesItems.Add(y:=PCT2.ToString())
                        PlannedColSeries.TooltipsAppearance.DataFormatString = "{0:N1}%"
                        'PlannedColSeries.TooltipsAppearance.ClientTemplate = ColName + " (%) : #= kendo.format(\'{0:N1}\', " + PCT2 + ")#%"
                    Else
                    End If
                Next
            Next
        Next
    End Sub
    Sub GetPlannedData()
        RadChart_Planned_Reasons.PlotArea.Series.Clear()
        Dim tbl As New DataTable()
        tbl.Columns.Add(New DataColumn("HOS_Date", GetType(Date)))
        tbl.Columns.Add(New DataColumn("Month", GetType(String)))
        RadChart_Planned_Reasons.DataSource = tbl
        Dim dvSql1 As DataView = DirectCast(SqlDS_Hoses_Planned_Reasons.Select(DataSourceSelectArguments.Empty), DataView)
        Dim HOS_Date As Date
        Dim Month As String
        Dim ColName As String
        Dim PCT As String
        For Each drvSql As DataRowView In dvSql1
            HOS_Date = drvSql("HOS_Date").ToString()
            Month = drvSql("Month").ToString()
            tbl.Rows.Add(New Object() {HOS_Date, Month})
        Next
        For i As Integer = 2 To dvSql1.Table.Columns.Count - 1
            ColName = dvSql1.Table.Columns(i).Caption
            tbl.Columns.Add(ColName)
        Next
        For i As Integer = 2 To dvSql1.Table.Columns.Count - 1
            ColName = dvSql1.Table.Columns(i).Caption
            For j As Integer = 0 To tbl.Rows.Count - 1 'LOOP ROWS IN DATATABLE
                For k As Integer = 0 To dvSql1.Count - 1 'LOOP ROWS IN SQLTABLE
                    PCT = dvSql1(k).Item(ColName).ToString
                    If PCT = "" Then
                        PCT = 0
                    End If
                    If j = k Then 'IF DATATABLEROW = SQLTABLEROW
                        tbl.Rows(j)(ColName) = PCT
                    Else
                    End If
                Next
            Next
        Next
        For i As Integer = 2 To tbl.Columns.Count - 1
            Dim PlannedColSeries As ColumnSeries = New ColumnSeries()
            Dim PCT2 As String
            ColName = tbl.Columns(i).Caption
            PlannedColSeries.Name = ColName
            PCT = tbl.Columns(i).Caption
            'PlannedColSeries.DataFieldY = PCT
            PlannedColSeries.LabelsAppearance.Visible = False
            RadChart_Planned_Reasons.PlotArea.Series.Add(PlannedColSeries)
            For j As Integer = 0 To tbl.Rows.Count - 1 'LOOP ROWS IN DATATABLE
                For k As Integer = 0 To dvSql1.Count - 1 'LOOP ROWS IN SQLTABLE
                    PCT2 = dvSql1(k).Item(ColName).ToString
                    If PCT2 = "" Then
                        PCT2 = 0
                    End If
                    If j = k Then 'IF DATATABLEROW = SQLTABLEROW
                        PlannedColSeries.SeriesItems.Add(y:=PCT2.ToString())
                        PlannedColSeries.TooltipsAppearance.DataFormatString = "{0:N1}%"
                        'PlannedColSeries.TooltipsAppearance.ClientTemplate = ColName + " (%) : #= kendo.format(\'{0:N1}\', " + PCT2 + ")#%"
                    Else
                    End If
                Next
            Next
        Next
    End Sub
    Sub GetUnplannedData()
        RadChart_Unplanned_Reasons.PlotArea.Series.Clear()
        Dim tbl As New DataTable()
        tbl.Columns.Add(New DataColumn("HOS_Date", GetType(Date)))
        tbl.Columns.Add(New DataColumn("Month", GetType(String)))
        RadChart_Unplanned_Reasons.DataSource = tbl
        Dim dvSql1 As DataView = DirectCast(SqlDS_Hoses_Unplanned_Reasons.Select(DataSourceSelectArguments.Empty), DataView)
        Dim HOS_Date As Date
        Dim Month As String
        Dim ColName As String
        Dim PCT As String
        For Each drvSql As DataRowView In dvSql1
            HOS_Date = drvSql("HOS_Date").ToString()
            Month = drvSql("Month").ToString()
            tbl.Rows.Add(New Object() {HOS_Date, Month})
        Next
        For i As Integer = 2 To dvSql1.Table.Columns.Count - 1
            ColName = dvSql1.Table.Columns(i).Caption
            tbl.Columns.Add(ColName)
        Next
        For i As Integer = 2 To dvSql1.Table.Columns.Count - 1
            ColName = dvSql1.Table.Columns(i).Caption
            For j As Integer = 0 To tbl.Rows.Count - 1 'LOOP ROWS IN DATATABLE
                For k As Integer = 0 To dvSql1.Count - 1 'LOOP ROWS IN SQLTABLE
                    PCT = dvSql1(k).Item(ColName).ToString
                    If PCT = "" Then
                        PCT = 0
                    End If
                    If j = k Then 'IF DATATABLEROW = SQLTABLEROW
                        tbl.Rows(j)(ColName) = PCT
                    Else
                    End If
                Next
            Next
        Next
        For i As Integer = 2 To tbl.Columns.Count - 1
            Dim UnPlannedColSeries As ColumnSeries = New ColumnSeries()
            Dim PCT2 As String
            ColName = tbl.Columns(i).Caption
            UnPlannedColSeries.Name = ColName
            PCT = tbl.Columns(i).Caption
            'UnPlannedColSeries.DataFieldY = PCT
            UnPlannedColSeries.LabelsAppearance.Visible = False
            RadChart_Unplanned_Reasons.PlotArea.Series.Add(UnPlannedColSeries)
            For j As Integer = 0 To tbl.Rows.Count - 1 'LOOP ROWS IN DATATABLE
                For k As Integer = 0 To dvSql1.Count - 1 'LOOP ROWS IN SQLTABLE
                    PCT2 = dvSql1(k).Item(ColName).ToString
                    If PCT2 = "" Then
                        PCT2 = 0
                    End If
                    If j = k Then 'IF DATATABLEROW = SQLTABLEROW
                        UnPlannedColSeries.SeriesItems.Add(y:=PCT2.ToString())
                        UnPlannedColSeries.TooltipsAppearance.DataFormatString = "{0:N1}%"
                        'UnPlannedColSeries.TooltipsAppearance.ClientTemplate = ColName + " (%) : #= kendo.format(\'{0:N1}\', " + PCT2 + ")#%"
                    Else
                    End If
                Next
            Next
        Next
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Dashboards - Hoses"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Me.Timer.Dispose()
        If RadCB_Site.SelectedValue = "%" Then
            Me.RadCB_Asset.Visible = False
            lbl_AssetText.Visible = True
            RadChart_Service_Split.DataBind()
            RadChart_Service_Split.Visible = True
            RadChart_Ratio.DataBind()
            RadChart_Ratio.Visible = True
            GetPlannedData()
            RadChart_Planned_Reasons.DataBind()
            RadChart_Planned_Reasons.Visible = True
            GetUnplannedData()
            RadChart_Unplanned_Reasons.DataBind()
            RadChart_Unplanned_Reasons.Visible = True
            RadPie_Service_Split.DataBind()
            RadPie_Service_Split.Visible = True
            RadPie_Ratio.DataBind()
            RadPie_Ratio.Visible = True
            RadPie_Planned_Reasons.DataBind()
            RadPie_Planned_Reasons.Visible = True
            RadPie_Unplanned_Reasons.DataBind()
            RadPie_Unplanned_Reasons.Visible = True
        Else
            HF_Process.Value = "2"
            Me.RadCB_Asset.Visible = True
            lbl_AssetText.Visible = False
            RadChart_Service_Split.DataBind()
            RadChart_Service_Split.Visible = True
            RadChart_Ratio.DataBind()
            RadChart_Ratio.Visible = True
            GetPlannedData()
            RadChart_Planned_Reasons.DataBind()
            RadChart_Planned_Reasons.Visible = True
            GetUnplannedData()
            RadChart_Unplanned_Reasons.DataBind()
            RadChart_Unplanned_Reasons.Visible = True
            RadPie_Service_Split.DataBind()
            RadPie_Service_Split.Visible = True
            RadPie_Ratio.DataBind()
            RadPie_Ratio.Visible = True
            RadPie_Planned_Reasons.DataBind()
            RadPie_Planned_Reasons.Visible = True
            RadPie_Unplanned_Reasons.DataBind()
            RadPie_Unplanned_Reasons.Visible = True
        End If
        Me.RadCB_Asset.ClearCheckedItems()
        Me.Timer.DataBind()
    End Sub
    Protected Sub RadDP_From_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_From.SelectedDateChanged
        Me.Timer.Dispose()
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
        Me.Timer.DataBind()
    End Sub
    Protected Sub RadDP_To_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDP_To.SelectedDateChanged
        Me.Timer.Dispose()
        Dim ThisMonth As Date
        ThisMonth = RadDP_To.SelectedDate
        Me.HF_To.Value = ThisMonth
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        Me.lbl_To.Text = ThisMonth
        lbl_To.Text = "[" + lbl_To.Text + "]"
        Me.Timer.DataBind()
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Me.HF_Asset.Value = Me.RadCB_Asset.SelectedValue
    End Sub
    Protected Sub RadBtn_Reset_Click(sender As Object, e As EventArgs) Handles RadBtn_Reset.Click
        Me.Timer.Dispose()
        HF_Process.Value = "1"
        RadCB_Site.SelectedValue = "%"
        RadCB_Asset.ClearCheckedItems()
        RadCB_Asset.Visible = False
        HF_Asset.Value = "%"
        lbl_AssetText.Visible = True
        RadChart_Service_Split.DataBind()
        RadChart_Service_Split.Visible = True
        RadChart_Ratio.DataBind()
        RadChart_Ratio.Visible = True
        GetPlannedData()
        RadChart_Planned_Reasons.DataBind()
        RadChart_Planned_Reasons.Visible = True
        GetUnplannedData()
        RadChart_Unplanned_Reasons.DataBind()
        RadChart_Unplanned_Reasons.Visible = True
        RadPie_Service_Split.DataBind()
        RadPie_Service_Split.Visible = True
        RadPie_Ratio.DataBind()
        RadPie_Ratio.Visible = True
        RadPie_Planned_Reasons.DataBind()
        RadPie_Planned_Reasons.Visible = True
        RadPie_Unplanned_Reasons.DataBind()
        RadPie_Unplanned_Reasons.Visible = True

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

        Me.Timer.DataBind()
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
        Me.Timer.Dispose()
        ShowCheckedItems(RadCB_Asset, HF_Asset)
        RadChart_Service_Split.DataBind()
        RadChart_Service_Split.Visible = True
        RadChart_Ratio.DataBind()
        RadChart_Ratio.Visible = True
        GetPlannedData()
        RadChart_Planned_Reasons.DataBind()
        RadChart_Planned_Reasons.Visible = True
        GetUnplannedData()
        RadChart_Unplanned_Reasons.DataBind()
        RadChart_Unplanned_Reasons.Visible = True
        HF_Process.Value = "3"
        RadPie_Service_Split.DataBind()
        RadPie_Service_Split.Visible = True
        RadPie_Ratio.DataBind()
        RadPie_Ratio.Visible = True
        RadPie_Planned_Reasons.DataBind()
        RadPie_Planned_Reasons.Visible = True
        RadPie_Unplanned_Reasons.DataBind()
        RadPie_Unplanned_Reasons.Visible = True
        Me.Timer.DataBind()
    End Sub
    Protected Sub Timer_Tick(ByVal sender As Object, ByVal e As EventArgs)
        If HF_Process.Value = "1" Then
            RadChart_Service_Split.DataBind()
            RadChart_Ratio.DataBind()
            GetPlannedData()
            RadChart_Planned_Reasons.DataBind()
            GetUnplannedData()
            RadChart_Unplanned_Reasons.DataBind()
            RadPie_Service_Split.DataBind()
            RadPie_Ratio.DataBind()
            RadPie_Planned_Reasons.DataBind()
            RadPie_Unplanned_Reasons.DataBind()
        ElseIf HF_Process.Value = "2" Then
            RadChart_Service_Split.DataBind()
            RadChart_Ratio.DataBind()
            GetPlannedData()
            RadChart_Planned_Reasons.DataBind()
            GetUnplannedData()
            RadChart_Unplanned_Reasons.DataBind()
            RadPie_Service_Split.DataBind()
            RadPie_Ratio.DataBind()
            RadPie_Planned_Reasons.DataBind()
            RadPie_Unplanned_Reasons.DataBind()
        ElseIf HF_Process.Value = "3" Then
            RadChart_Service_Split.DataBind()
            RadChart_Ratio.DataBind()
            GetPlannedData()
            RadChart_Planned_Reasons.DataBind()
            GetUnplannedData()
            RadChart_Unplanned_Reasons.DataBind()
            RadPie_Service_Split.DataBind()
            RadPie_Ratio.DataBind()
            RadPie_Planned_Reasons.DataBind()
            RadPie_Unplanned_Reasons.DataBind()
        End If
    End Sub
End Class