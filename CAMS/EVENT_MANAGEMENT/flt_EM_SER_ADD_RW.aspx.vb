Imports System.Data
Imports System.Data.SqlClient
Partial Class EVENT_MANAGEMENT_flt_EM_SER_ADD_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.LblPreviousPage.Text = Request.QueryString("PreviousPage")
        'Me.lblWhoIsIt.Text = "Jonathan Snaith"
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        'GetDate()
        Me.lbl_Status.Visible = True
        Me.RadCB_Status.Visible = True
        'Me.RadCB_Cal_Status.Visible = True
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
            lblPageName.Text = "EM - Servicing - Add"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Sub GetDate()
        Me.HF_GetDate.Value = DateTime.Now.ToString("dd MMM yyyy")
        'GetWeekEnding()
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        SqlDS_Insert.SelectParameters("SER_A_ID").DefaultValue = 0
        SqlDS_Insert.SelectParameters("SER_SMU_Counter").DefaultValue = 0
        SqlDS_Insert.SelectParameters("SER_Trend").DefaultValue = 1
        SqlDS_Insert.SelectParameters("SER_SMU_Left").DefaultValue = 0
        'SqlDS_Insert.SelectParameters("SER_Cycle").DefaultValue = 0
        SqlDS_Insert.SelectParameters("SER_SERT_ID").DefaultValue = 1006
        SqlDS_Insert.SelectParameters("SER_Status_ID").DefaultValue = "1032"
        SqlDS_Insert.SelectParameters("SER_Cal_Status_ID").DefaultValue = "1032"
        SqlDS_Insert.SelectParameters("SER_Fire_Status_ID").DefaultValue = "1032"
        SqlDS_Insert.SelectParameters("SER_Exam_Status_ID").DefaultValue = "1032"
        SqlDS_Insert.SelectParameters("SER_Trigger").DefaultValue = "0"
        SqlDS_Insert.SelectParameters("SER_Sample").DefaultValue = "0"
        SqlDS_Insert.SelectParameters("SER_External").DefaultValue = "0"
        SqlDS_Insert.SelectParameters("SER_Notes").DefaultValue = "abc"
        SqlDS_Insert.SelectParameters("SER_Cal_Date_Due").DefaultValue = "1900-01-01"
        SqlDS_Insert.SelectParameters("SER_Cal_Event_Type").DefaultValue = "0"
        SqlDS_Insert.SelectParameters("SER_Fire").DefaultValue = 0
        SqlDS_Insert.SelectParameters("SER_Fire_Cycle").DefaultValue = 0
        SqlDS_Insert.SelectParameters("SER_Fire_Date").DefaultValue = "1900-01-01"
        SqlDS_Insert.SelectParameters("SER_Exam").DefaultValue = 0
        SqlDS_Insert.SelectParameters("SER_Exam_Cycle").DefaultValue = 0
        SqlDS_Insert.SelectParameters("SER_Exam_Date").DefaultValue = "1900-01-01"
        SqlDS_Insert.SelectParameters("SER_Created_By").DefaultValue = Me.lblWhoIsIt.Text
        SqlDS_Insert.SelectParameters("SER_Modified_By").DefaultValue = Me.lblWhoIsIt.Text
        Me.SqlDS_Insert.Select(DataSourceSelectArguments.Empty)
        Me.SqlDS_SetMode.Select(DataSourceSelectArguments.Empty)
        Me.SqlDS_SetDetail.Select(DataSourceSelectArguments.Empty)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindowAdd();", True)
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Dim dvSql As DataView = DirectCast(SqlDS_AssetLocation.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lbl_Site.Text = drvSql("SiteName").ToString()
            Me.lbl_Cycle.Text = drvSql("ServiceType").ToString()
        Next
        If Me.lbl_Cycle.Text = "250" Then
            Me.RadNumTxt_Counter.Text = "0"
            Me.lbl_Left.Text = "250"
        ElseIf Me.lbl_Cycle.Text = "500" Then
            Me.RadNumTxt_Counter.Text = "0"
            Me.lbl_Left.Text = "500"
        ElseIf Me.lbl_Cycle.Text = "*Not Specified" Then
            Me.RadNumTxt_Counter.Text = "0"
            Me.lbl_Left.Text = "0"
            Me.lbl_Cycle.Text = "0"
        Else
        End If
    End Sub
    Protected Sub RadCB_Trigger_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Trigger.SelectedIndexChanged
        If Me.RadCB_Trigger.SelectedValue = "SMU" Then
            Me.lbl_Sample_Text.Visible = True
            Me.RadCB_Sample.Visible = True
            Me.lbl_Cycle_Text.Visible = True
            Me.lbl_Cycle.Visible = True
            Me.lbl_Counter_Text.Visible = True
            Me.RadNumTxt_Counter.Visible = True
            Me.lbl_Status.Visible = True
            Me.RadCB_Status.Visible = True
            Me.lbl_Left_Text.Visible = True
            Me.lbl_Left.Visible = True
            Me.lbl_Trend_Text.Visible = True
            Me.RadNumTxt_Trend.Visible = True
            Me.lbl_ServiceType_Text.Visible = True
            Me.RadCB_ServiceType.Visible = True
            '---CALENDAR TABLE---
            Me.RadCB_Cal_Event_Type.Visible = False
            Me.RadDP_Due_Date.Visible = False
            Me.RadCB_Cal_Status.Visible = False
            Me.RadCB_Fire.Visible = False
            Me.RadCB_Exam.Visible = False
        End If

        If Me.RadCB_Trigger.SelectedValue = "SMU and Calendar" Then
            '---SMU TABLE---
            Me.lbl_Sample_Text.Visible = True
            Me.RadCB_Sample.Visible = True
            Me.lbl_Cycle_Text.Visible = True
            Me.lbl_Cycle.Visible = True
            Me.lbl_Counter_Text.Visible = True
            Me.RadNumTxt_Counter.Visible = True
            Me.lbl_Status.Visible = True
            Me.RadCB_Status.Visible = True
            Me.lbl_Left_Text.Visible = True
            Me.lbl_Left.Visible = True
            Me.lbl_Trend_Text.Visible = True
            Me.RadNumTxt_Trend.Visible = True
            Me.lbl_ServiceType_Text.Visible = True
            Me.RadCB_ServiceType.Visible = True
            '---CALENDAR TABLE---
            Me.RadCB_Cal_Event_Type.Visible = True
            Me.RadDP_Due_Date.Visible = True
            Me.RadCB_Cal_Status.Visible = True
            Me.RadCB_Fire.Visible = True
            Me.RadCB_Exam.Visible = True
        End If
        If Me.RadCB_Trigger.SelectedValue = "Calendar" Then
            '---SMU TABLE---
            Me.lbl_Sample_Text.Visible = True
            Me.RadCB_Sample.Visible = True
            Me.lbl_Cycle_Text.Visible = False
            Me.lbl_Cycle.Visible = False
            Me.lbl_Counter_Text.Visible = False
            Me.RadNumTxt_Counter.Visible = False
            Me.lbl_Status.Visible = False
            Me.RadCB_Status.Visible = False
            Me.lbl_Left_Text.Visible = False
            Me.lbl_Left.Visible = False
            Me.lbl_Trend_Text.Visible = False
            Me.RadNumTxt_Trend.Visible = False
            Me.lbl_ServiceType_Text.Visible = False
            Me.RadCB_ServiceType.Visible = False
            '---CALENDAR TABLE---
            Me.RadCB_Cal_Event_Type.Visible = True
            Me.RadDP_Due_Date.Visible = True
            Me.RadCB_Cal_Status.Visible = True
            Me.RadCB_Fire.Visible = True
            Me.RadCB_Exam.Visible = True
        End If
        If Me.RadCB_Fire.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
            Me.RadCB_Fire_Cycle.Visible = True
            Me.RadDP_Fire_Date.Visible = True
            Me.RadCB_Fire_Status.Visible = True
        Else
            Me.RadCB_Fire_Cycle.Visible = False
            Me.RadDP_Fire_Date.Visible = False
            Me.RadCB_Fire_Status.Visible = False
        End If
        If Me.RadCB_Exam.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
            Me.RadCB_Exam_Cycle.Visible = True
            Me.RadDP_Exam_Date.Visible = True
            Me.RadCB_Exam_Status.Visible = True
        Else
            Me.RadCB_Exam_Cycle.Visible = False
            Me.RadDP_Exam_Date.Visible = False
            Me.RadCB_Exam_Status.Visible = False
        End If
    End Sub
    Protected Sub RadCB_Fire_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Fire.SelectedIndexChanged
        If Me.RadCB_Fire.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
            Me.RadCB_Fire_Cycle.Visible = True
            Me.RadCB_Fire_Cycle.SelectedValue = "12"
            Me.RadDP_Fire_Date.Visible = True
            Me.RadCB_Fire_Status.Visible = True
        Else
            Me.RadCB_Fire_Cycle.Visible = False
            Me.RadCB_Fire_Cycle.SelectedValue = ""
            Me.RadDP_Fire_Date.Visible = False
            Me.RadCB_Fire_Status.Visible = False
        End If
    End Sub
    Protected Sub RadCB_Exam_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Exam.SelectedIndexChanged
        If Me.RadCB_Exam.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
            Me.RadCB_Exam_Cycle.Visible = True
            Me.RadCB_Exam_Cycle.SelectedValue = "12"
            Me.RadDP_Exam_Date.Visible = True
            Me.RadCB_Exam_Status.Visible = True
        Else
            Me.RadCB_Exam_Cycle.Visible = False
            Me.RadCB_Exam_Cycle.SelectedValue = ""
            Me.RadDP_Exam_Date.Visible = False
            Me.RadCB_Exam_Status.Visible = False
        End If
    End Sub
    Protected Sub RadCB_Cal_Event_Type_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Cal_Event_Type.SelectedIndexChanged
        Select Case RadCB_Cal_Event_Type.SelectedValue
            Case "3-Monthly Service"
                Me.lbl_Cal_Cycle.Text = "90 days"
            Case "6 Monthly Service/TE"
                Me.lbl_Cal_Cycle.Text = "180 days"
            Case "Brake Test"
                Me.lbl_Cal_Cycle.Text = "6 wks"
            Case "6 Wk Inspection"
                Me.lbl_Cal_Cycle.Text = "6 wks"
            Case "6 Wk Inspection (Annual Service)"
                Me.lbl_Cal_Cycle.Text = "6 wks"
            Case "Quarterly Service"
                Me.lbl_Cal_Cycle.Text = "6 wks"
            Case "Service Events"
                Me.lbl_Cal_Cycle.Text = "6 wks"
            Case "Annual Service"
                Me.lbl_Cal_Cycle.Text = "1 year"
            Case Else
        End Select
    End Sub
End Class