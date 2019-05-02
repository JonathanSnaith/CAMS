Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class EVENT_MANAGEMENT_flt_EM_EVENT_PLUS_VIEW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        'Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        'Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        'Get_Session_Info(SESSION_ID, 133)
        Me.lblWhoIsIt.Text = "Jonathan Snaith"
        Me.HF_Username.Value = "Jonathan Snaith"
        Me.HF_PQQ_Permission.Value = 5
        Me.RadGrid_Active_Jobs.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        GetSYS()
        Me.RadCB_Customer.SelectedValue = ""
        Me.RadCB_Asset.SelectedValue = ""
        Me.RadCB_EventType.SelectedValue = ""
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
                                    Case 134
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_6_R.Value = 1 'Event Management R
                                        End If
                                    Case 145
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_6_RW.Value = 1 'Event Management RW
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
            lblPageName.Text = "EM - Event Plus View"
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
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Protected Sub RadGrid_Archive_Events_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Archive_Events.ItemDataBound
        For Each item As GridDataItem In RadGrid_Archive_Events.Items
            Dim myTotalCell4 As TableCell = item("E_Status")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                Dim ThisTotal4 = myTotalCell4.Text
                If ThisTotal4 = "*New" Then
                    item.BackColor = Drawing.Color.LightBlue
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Complete" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Cancelled" Then
                    item.BackColor = Drawing.Color.LightSalmon
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
    Protected Sub RadGrid_Active_Jobs_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_Jobs.ItemDataBound
        For Each item As GridDataItem In RadGrid_Active_Jobs.Items
            Dim myTotalCell4 As TableCell = item("J_Status")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                Dim ThisTotal4 = myTotalCell4.Text
                If ThisTotal4 = "Open" Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Complete" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Cancelled" Then
                    item.BackColor = Drawing.Color.LightSalmon
                    item.ForeColor = Drawing.Color.Black
                End If

            End If
        Next
    End Sub
    Protected Sub RadGrid_Active_FT_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_FT.ItemDataBound
        For Each item As GridDataItem In RadGrid_Active_FT.Items
            Dim myTotalCell4 As TableCell = item("FT_Status")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                Dim ThisTotal4 = myTotalCell4.Text
                If ThisTotal4 = "Open" Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Complete" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Cancelled" Then
                    item.BackColor = Drawing.Color.LightSalmon
                    item.ForeColor = Drawing.Color.Black
                End If

            End If
        Next
    End Sub
    Protected Sub RadGrid_Archive_Events_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadGrid_Archive_Events.SelectedIndexChanged
        Me.lbl_Job_Text.Visible = True
        'Apply_Permissions()
        Me.RadGrid_Active_Jobs.Visible = True
        Me.lbl_FT_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
    End Sub
    Protected Sub RadGrid_Active_Jobs_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadGrid_Active_Jobs.SelectedIndexChanged
        Me.lbl_FT_Text.Visible = True
        Me.RadGrid_Active_FT.Visible = True
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Me.HF_Customer.Value = Me.RadCB_Customer.SelectedValue
        Me.HF_A_ID.Value = ""
        Me.RadCB_Asset.SelectedValue = ""
        Me.HF_ET_ID.Value = ""
        Me.RadCB_EventType.SelectedValue = ""
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.Table101.Visible = False
        Me.lbl_EventSMUPlus250.Visible = False
        Me.lbl_LatestSMU.Visible = False
        Me.lbl_Hours.Visible = False
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Me.HF_A_ID.Value = Me.RadCB_Asset.SelectedValue
        Me.HF_ET_ID.Value = ""
        Me.RadCB_EventType.SelectedValue = ""
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.Table101.Visible = False
        Me.lbl_EventSMUPlus250.Visible = False
        Me.lbl_LatestSMU.Visible = False
        Me.lbl_Hours.Visible = False
    End Sub
    Protected Sub RadCB_EventType_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_EventType.SelectedIndexChanged
        Me.HF_ET_ID.Value = Me.RadCB_EventType.SelectedValue
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.Table101.Visible = True
        Me.lbl_EventSMUPlus250.Visible = True
        Me.lbl_LatestSMU.Visible = True
        Me.lbl_Hours.Visible = True
        Box1()
    End Sub
    Protected Sub btn_Refresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Refresh.Click
        Me.HF_Customer.Value = ""
        Me.HF_A_ID.Value = ""
        Me.HF_ET_ID.Value = ""
        Me.RadCB_Customer.SelectedValue = ""
        Me.RadCB_Asset.SelectedValue = ""
        Me.RadCB_EventType.SelectedValue = ""
        Me.RadGrid_Archive_Events.DataBind()
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.Table101.Visible = False
        Me.lbl_EventSMUPlus250.Visible = False
        Me.lbl_LatestSMU.Visible = False
        Me.lbl_Hours.Visible = False
    End Sub
    Sub Box1()
        Dim CountI As String = "0"
        Dim Count2I As String = "0"
        Dim Count3I As String = "0"
        Dim Count4I As String = "0"
        Dim Count5I As String = "0"
        'Dim LWCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box1.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
            Count2I = drvSql("SMU").ToString()
            Count3I = drvSql("Hours").ToString()
            Count4I = drvSql("EventSMUPlusHours").ToString()
            Count5I = drvSql("LatestSMU").ToString()
        Next
        Me.lblCount_1.Text = CountI
        Me.lblSMU.Text = Count2I
        Me.lbl_EventSMUPlus250.Text = "Event SMU + 250: " + Count4I
        Me.lbl_LatestSMU.Text = "Latest SMU: " + Count5I
        Me.lbl_Hours.Text = "Total Hours for the events below: " + Count3I
    End Sub
End Class