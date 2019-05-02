Imports Telerik.Web.UI
Imports System.Data
Imports Telerik.Web.UI.PersistenceFramework
Partial Class DASHBOARD_flt_D_SERVICING
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        'Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        'Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        'Get_Session_Info(SESSION_ID, 133)
        RadCB_Status.SelectedValue = "MONITORING"
        Me.RadCB_Asset_SMU.SelectedValue = "%"
        Me.RadCB_Asset_CAL.Visible = False
        Me.lbl_SMU_Header.Visible = False
        Me.RadGrid_SMU.Visible = False
        Dim abc As String = RadCB_Asset_SMU.SelectedValue
        Me.lbl_Asset.Text = abc
        RadGrid_Active_Events.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
        RadGrid_ARCHIVE.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
        RadGrid_Active_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
        RadGrid_Cal_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
        Me.lbl_SMU_Header.Visible = False
        Me.RadGrid_SMU.Visible = False
        Me.RadBtn_Edit_Archive.Visible = False
        Apply_Permissions()
        GetSYS()
        Me.Table101.Visible = False
        'Box1()
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
                                Select Case dr("EXCEPTION_ID").ToString()
                                    Case 136
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_8_R.Value = 1 'Event Dashboard R
                                        End If
                                    Case 147
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_8_RW.Value = 1 'Event Dashboard RW
                                        End If
                                End Select
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
        With Me.ID_1_A.Attributes
            .Add("onClick", "fn_1()")
        End With
        'With Me.ID_1_B.Attributes
        '    .Add("onClick", "fn_1()")
        'End With
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Dashboards - Servicing"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
        If Me.IsPostBack Then
            Dim eventTarget As String
            Dim eventArgument As String
            If (Me.Request("__EVENTTARGET") Is Nothing) Then
                eventTarget = String.Empty
            Else
                eventTarget = Me.Request("__EVENTTARGET")
                If (Me.Request("__EVENTARGUMENT") Is Nothing) Then
                    eventArgument = String.Empty
                Else
                    eventArgument = Me.Request("__EVENTARGUMENT")
                    ' Call your VB method here...
                    Select Case eventTarget
                        Case "Calculate"
                            Dim valuePassed As String = eventArgument
                            'Me.CalculateSheet()
                        Case "Show_Buttons"
                            Dim valuepassed As String = eventArgument
                            'ShowPage1_Buttons(valuepassed)
                        Case "Refresh_Grid"
                            Dim valuepassed As String = eventArgument
                            Me.RadGrid_Active_SER.Rebind()
                            Me.RadGrid_Cal_SER.Rebind()
                            WhichRowSelected()
                            SelectCorrectRecord()
                            WhichRowSelectedCal()
                            SelectCorrectRecordCal()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub WhichRowSelected()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Active_SER.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("SER_ID").Text)
            count = count + 1
            If item.Selected Then
                lbl_Test.Text = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecord()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Active_SER.Items
            Dim EventIDCell As TableCell = item("SER_ID")
            Dim EventID = EventIDCell.Text
            count = count + 1
            If Session("SER_ID") = "null" Then Session("SER_ID") = "0"

            If Session("SER_ID") = EventID Then
                item.Selected = True
            End If
        Next
    End Sub
    Sub WhichRowSelectedCal()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Cal_SER.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("SER_ID").Text)
            count = count + 1
            If item.Selected Then
                lbl_TestCal.Text = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecordCal()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Cal_SER.Items
            Dim EventIDCell As TableCell = item("SER_ID")
            Dim EventID = EventIDCell.Text
            count = count + 1
            If Session("SER_ID") = "null" Then Session("SER_ID") = "0"

            If Session("SER_ID") = EventID Then
                item.Selected = True
            End If
        Next
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Dim abc As String = RadCB_Site.SelectedValue
        Me.lbl_Site.Text = abc
        If abc = "%" Then
            RadGrid_Active_Events.MasterTableView.GetColumnSafe("SITE_Name").Display = True
            RadGrid_ARCHIVE.MasterTableView.GetColumnSafe("SITE_Name").Display = True
            RadGrid_Active_SER.MasterTableView.GetColumnSafe("SITE_Name").Display = True
            Exit Sub
        Else
            RadGrid_Active_Events.MasterTableView.GetColumnSafe("SITE_Name").Display = False
            RadGrid_ARCHIVE.MasterTableView.GetColumnSafe("SITE_Name").Display = False
            RadGrid_Active_SER.MasterTableView.GetColumnSafe("SITE_Name").Display = False
        End If
        '  Box1()
    End Sub
    Protected Sub RadCB_Asset_SMU_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset_SMU.SelectedIndexChanged
        Dim abc As String = RadCB_Asset_SMU.SelectedValue
        Me.lbl_Asset.Text = abc
        If abc = "%" Then
            RadGrid_Active_Events.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
            RadGrid_ARCHIVE.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
            RadGrid_Active_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
            RadGrid_Cal_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
            Me.lbl_SMU_Header.Visible = False
            Me.RadGrid_SMU.Visible = False
            Me.RadBtn_Edit_Archive.Visible = False
            RadGrid_Active_Events.DataBind()
            RadGrid_ARCHIVE.DataBind()
            RadGrid_Active_SER.DataBind()
            RadGrid_Cal_SER.DataBind()
            Exit Sub
        Else
            RadGrid_Active_Events.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = False
            RadGrid_ARCHIVE.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = False
            RadGrid_Active_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = False
            RadGrid_Cal_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = False
            Me.lbl_SMU_Header.Visible = True
            Me.RadGrid_SMU.Visible = True
            GetSERA()
            Me.RadBtn_Edit_Archive.Visible = True
            RadGrid_Active_Events.DataBind()
            RadGrid_ARCHIVE.DataBind()
            RadGrid_Active_SER.DataBind()
            RadGrid_Cal_SER.DataBind()
        End If
    End Sub
    Protected Sub RadCB_Asset_CAL_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset_CAL.SelectedIndexChanged
        Dim abc As String = RadCB_Asset_CAL.SelectedValue
        Me.lbl_Asset.Text = abc
        If abc = "%" Then
            RadGrid_Active_Events.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
            RadGrid_ARCHIVE.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
            RadGrid_Active_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
            RadGrid_Cal_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = True
            Me.lbl_SMU_Header.Visible = False
            Me.RadGrid_SMU.Visible = False
            Me.RadBtn_Edit_Archive.Visible = False
            RadGrid_Active_Events.DataBind()
            RadGrid_ARCHIVE.DataBind()
            RadGrid_Active_SER.DataBind()
            RadGrid_Cal_SER.DataBind()
            Exit Sub
        Else
            RadGrid_Active_Events.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = False
            RadGrid_ARCHIVE.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = False
            RadGrid_Active_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = False
            RadGrid_Cal_SER.MasterTableView.GetColumnSafe("Asset_TemplateColumn").Display = False
            Me.lbl_SMU_Header.Visible = True
            Me.RadGrid_SMU.Visible = True
            GetSERA()
            Me.RadBtn_Edit_Archive.Visible = True
            RadGrid_Active_Events.DataBind()
            RadGrid_ARCHIVE.DataBind()
            RadGrid_Active_SER.DataBind()
            RadGrid_Cal_SER.DataBind()
        End If
    End Sub
    Sub GetSERA()
        Dim dvSql As DataView = DirectCast(SqlDS_GetSERA.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.HF_SERA_ID.Value = drvSql("SERA_ID").ToString()
        Next
    End Sub
    Protected Sub RadGrid_Active_SER_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_SER.ItemDataBound
        For Each item As GridDataItem In RadGrid_Active_SER.Items
            Dim myTotalCell2 As TableCell = item("SER_Status_Flag")
            Dim myTotalCell4 As TableCell = item("SER_Service_Weeks")
            Dim myTotalCell5 As TableCell = item("SER_Confirm")
            Dim TrendOverride As TableCell = item("SER_Trend_Override")
            Dim Trend As TableCell = item("SER_Trend")
            Dim ThisTotal2 = myTotalCell2.Text
            Dim ThisTotal4 = myTotalCell4.Text
            Dim ThisTotal5 = myTotalCell5.Text
            Dim myTotalCell3 As TableCell = item("SER_Event_Status")
            If InStr(myTotalCell3.Text, "&nbsp;") Then
            Else
                Dim ThisTotal3 = myTotalCell3.Text

                If ThisTotal3 = "New (Cycle Change)" Then
                    item.BackColor = Drawing.Color.MediumBlue
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "New" Then
                    item.BackColor = Drawing.Color.LightBlue
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Service Cancelled" Then
                    item.BackColor = Drawing.Color.BurlyWood
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Service Overdue" Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "PSI planning" Then
                    item.BackColor = Drawing.Color.Orange
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Interim sample planning" Then
                    item.BackColor = Drawing.Color.Orange
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Service planning" Then
                    item.BackColor = Drawing.Color.Orange
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "PSI" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Interim sampling" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Servicing" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
            If TrendOverride.Text = "&nbsp;" Then
                Trend.ForeColor = Drawing.Color.Black
            Else
                Trend.ForeColor = Drawing.Color.MediumBlue
                Trend.Font.Bold = True
            End If
            If Trend.Text = "168" Then
                Trend.ForeColor = Drawing.Color.Red
                Trend.Font.Bold = True
            End If
            Dim lblassetid As RadLabel = DirectCast(item.FindControl("RadLbl_Asset_ID"), RadLabel)
            With lblassetid
                If IsNumeric(item("SER_A_ID").Text) Then
                    .Attributes.Add("onClick", "asset_details('" + item("SER_A_ID").Text + "');")
                    .ToolTip = "Open Asset Details"
                Else
                    .Visible = False
                End If
            End With
        Next


    End Sub
    Protected Sub RadGrid_Cal_SER_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Cal_SER.ItemDataBound
        For Each item As GridDataItem In RadGrid_Cal_SER.Items
            Dim myTotalCell2 As TableCell = item("SER_Status_Flag")
            Dim myTotalCell3 As TableCell = item("SER_Cal_Date_Due")
            Dim ThisTotal2 = myTotalCell2.Text
            If InStr(myTotalCell3.Text, "&nbsp;") Then
            Else
                Dim ThisTotal3 = myTotalCell3.Text
                If ThisTotal3 < Date.Today Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
            Dim myTotalCell4 As TableCell = item("SER_Cal_Event_Status")
            Dim myTotalCell10 As TableCell = item("SER_Fire_Event_Status")
            Dim myTotalCell11 As TableCell = item("SER_Exam_Event_Status")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                Dim ThisTotal4 = myTotalCell4.Text
                Dim ThisTotal10 = myTotalCell10.Text
                Dim ThisTotal11 = myTotalCell11.Text
                If ThisTotal4 = "Servicing" Or ThisTotal10 = "Servicing" Or ThisTotal11 = "Servicing" Then
                    item.BackColor = Drawing.Color.LightGreen
                Else
                End If
                If ThisTotal4 = "Service planning" Or ThisTotal10 = "Service planning" Or ThisTotal11 = "Service planning" Then
                    item.BackColor = Drawing.Color.Orange
                Else
                End If
                If ThisTotal4 = "Service Cancelled" Or ThisTotal10 = "Service Cancelled" Or ThisTotal11 = "Service Cancelled" Then
                    item.BackColor = Drawing.Color.BurlyWood
                Else
                End If

                If ThisTotal4 = "Service Overdue" Or ThisTotal10 = "Service Overdue" Or ThisTotal11 = "Service Overdue" Then
                    item.BackColor = Drawing.Color.Red
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal4 = "New" Or ThisTotal10 = "New" Or ThisTotal11 = "New" Then
                    item.BackColor = Drawing.Color.LightBlue
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If

            Dim myTotalCell5 As TableCell = item("SER_Fire_Date")
            If InStr(myTotalCell5.Text, "&nbsp;") Then
            Else
                Dim ThisTotal5 = myTotalCell5.Text
                If ThisTotal5 < Date.Today Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
            Dim myTotalCell6 As TableCell = item("SER_Exam_Date")
            If InStr(myTotalCell6.Text, "&nbsp;") Then
            Else
                Dim ThisTotal6 = myTotalCell6.Text
                If ThisTotal6 < Date.Today Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
            If InStr(myTotalCell3.Text, "&nbsp;") Then
            Else
                Dim ThisTotal3 = myTotalCell3.Text
                If ThisTotal2 = "NOT_IN_USE" And RadCB_Status.SelectedValue = "Not In Use" Then
                    item.BackColor = Drawing.Color.LightGray
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
            Dim lblassetid As RadLabel = DirectCast(item.FindControl("RadLbl_Asset_ID_Cal"), RadLabel)
            With lblassetid
                If IsNumeric(item("SER_A_ID").Text) Then
                    .Attributes.Add("onClick", "asset_details('" + item("SER_A_ID").Text + "');")
                    .ToolTip = "Open Asset Details"
                Else
                    .Visible = False
                End If
            End With
        Next
    End Sub
    Protected Sub RadGrid_Active_Events_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_Events.ItemDataBound
        For Each item As GridDataItem In RadGrid_Active_Events.Items
            Dim myTotalCell4 As TableCell = item("E_Status")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                Dim ThisTotal4 = myTotalCell4.Text
                If ThisTotal4 = "*New" Then
                    item.BackColor = Drawing.Color.LightBlue
                    item.ForeColor = Drawing.Color.Black
                End If
            End If
            Dim lblassetid As RadLabel = DirectCast(item.FindControl("RadLbl_Asset_ID_Event"), RadLabel)
            With lblassetid
                If IsNumeric(item("E_A_ID").Text) Then
                    .Attributes.Add("onClick", "asset_details('" + item("E_A_ID").Text + "');")
                    .ToolTip = "Open Asset Details"
                Else
                    .Visible = False
                End If
            End With
        Next
    End Sub
    'Sub Box1()
    '    Dim CountI As String = "0"
    '    Dim Count2I As String = "0"
    '    Dim dvSqlSession As DataView = DirectCast(SqlDS_Box1.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In dvSqlSession
    '        CountI = drvSql("Average").ToString()
    '        Count2I = drvSql("Count").ToString()
    '    Next
    '    Me.lblCount_1.Text = CountI
    '    Me.lblCount_2.Text = Count2I
    'End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        If Me.RadCB_Status.SelectedValue = "MONITORING" Then
            If Me.RadCB_Asset_CAL.SelectedValue = "%" Then
                Me.RadCB_Asset_SMU.SelectedValue = "%"
            End If
            Me.RadCB_Asset_SMU.Visible = True
            Me.RadCB_Asset_CAL.Visible = False
            RadGrid_Active_Events.Rebind()
            RadGrid_ARCHIVE.Rebind()
            RadGrid_Active_SER.Rebind()
            RadGrid_Cal_SER.Rebind()

        End If

        If Me.RadCB_Status.SelectedValue = "NOT_IN_USE" Then
            If Me.RadCB_Asset_SMU.SelectedValue = "%" Then
                Me.RadCB_Asset_CAL.SelectedValue = "%"
            End If
            Me.RadCB_Asset_SMU.Visible = False
            Me.RadCB_Asset_CAL.Visible = True
            RadGrid_Active_Events.Rebind()
            RadGrid_ARCHIVE.Rebind()
            RadGrid_Active_SER.Rebind()
            RadGrid_Cal_SER.Rebind()
        End If
    End Sub
    Protected Sub btn_Refresh_Click(sender As Object, e As EventArgs) Handles btn_Refresh.Click
        RadCB_Status.SelectedValue = "MONITORING"
        Me.RadCB_Site.SelectedValue = "%"
        Me.RadCB_Asset_SMU.Visible = True
        Me.RadCB_Asset_SMU.SelectedValue = "%"
        Me.RadCB_Asset_CAL.Visible = False
        Me.lbl_SMU_Header.Visible = False
        Me.RadGrid_SMU.Visible = False
        Dim abc As String = RadCB_Asset_SMU.SelectedValue
        Me.lbl_Asset.Text = abc
        RadGrid_Active_Events.MasterTableView.GetColumnSafe("Asset").Display = True
        RadGrid_ARCHIVE.MasterTableView.GetColumnSafe("Asset").Display = True
        RadGrid_Active_SER.MasterTableView.GetColumnSafe("Asset").Display = True
        RadGrid_Cal_SER.MasterTableView.GetColumnSafe("Asset").Display = True
        Me.RadGrid_SMU.Visible = False
        Me.RadBtn_Edit_Archive.Visible = False
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_8_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_8_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
            Case 4
                Me.T1.Visible = True
            Case 5
                Me.T1.Visible = True
            Case Else
                Me.T1.Visible = False
        End Select
    End Sub

    Private Sub RadGrid_ARCHIVE_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid_ARCHIVE.ItemDataBound
        For Each item As GridDataItem In RadGrid_ARCHIVE.Items
            Dim lblassetid As RadLabel = DirectCast(item.FindControl("RadLbl_Asset_ID_Archive"), RadLabel)
            With lblassetid
                If IsNumeric(item("SERA_A_ID").Text) Then
                    .Attributes.Add("onClick", "asset_details('" + item("SERA_A_ID").Text + "');")
                    .ToolTip = "Open Asset Details"
                Else
                    .Visible = False
                End If
            End With
        Next
    End Sub
End Class