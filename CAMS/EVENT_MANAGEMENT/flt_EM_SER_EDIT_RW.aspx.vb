Imports System.Data
Imports System.Data.SqlClient
Partial Class EVENT_MANAGEMENT_flt_EM_SER_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_SER_ID.Value = Request.QueryString("SER_ID")
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.LblPreviousPage.Text = Request.QueryString("PreviousPage")
        'Me.lblWhoIsIt.Text = "Jonathan Snaith"
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        GetData()
        Session("SER_ID") = Me.HF_SER_ID.Value
        Apply_Permissions()
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
                                    Case 79
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_8_R.Value = 1 'Event Dashboard R
                                        End If
                                    Case 90
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
        Dim ThisID As String = HF_SER_ID.Value
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "EM - Servicing - Edit" & " (" & ThisID & ")"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Sub GetData()
        Dim dvSql As DataView = DirectCast(SqlDS_Select.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lbl_Modified.Text = DateTime.Parse(drvSql("SER_Modified")).ToString("dd MMM yyyy HH:mm")
            Me.lbl_Modified_By.Text = drvSql("SER_Modified_By").ToString()
            Me.lbl_Model.Text = drvSql("Model").ToString()
            Me.lbl_Asset.Text = drvSql("Asset").ToString()
            Me.HF_Asset_ID.Value = drvSql("SER_A_ID").ToString()
            GetLocation()
            If IsDBNull(drvSql("SER_Latest_SMU_Date")) = False Then
                Me.lbl_Latest_SMU_Date.Text = DateTime.Parse(drvSql("SER_Latest_SMU_Date")).ToString("dd MMM yyyy")
            End If
            Me.RadNumTxt_Counter.Text = drvSql("SER_SMU_Counter").ToString()
            Me.lbl_Left.Text = drvSql("SER_SMU_Left").ToString()
            'Me.lbl_Cycle.Text = drvSql("SER_Cycle").ToString()
            Me.RadNumTxt_Cycle.Text = drvSql("SER_Cycle").ToString()
            Me.lbl_Trend.Text = drvSql("SER_Trend").ToString()
            If lbl_Trend.Text = "168" Then
                Me.lbl_TrueTrend.visible = True
                GetTrueTrend()
            Else
                Me.lbl_TrueTrend.visible = False
            End If
            Me.RadNumTxt_Trend_Override.Text = drvSql("SER_Trend_Override").ToString()
            Me.RadCB_Trigger.SelectedValue = drvSql("SER_Trigger").ToString()
            Me.RadCB_Sample.SelectedValue = drvSql("SER_Sample_ID").ToString()
            Me.RadCB_External.SelectedValue = drvSql("SER_External_ID").ToString()
            Me.RadCB_ServiceMode.SelectedValue = drvSql("SER_Mode").ToString()
            Me.RadCB_ServiceType.SelectedValue = drvSql("SER_SERD_ID").ToString()
            Me.lbl_ServiceType.Text = drvSql("SER_SERT_ID").ToString()
            Me.RadCB_ServiceType.Visible = True
            Me.lbl_ST.Visible = False
            Me.RadCB_Status.SelectedValue = drvSql("SER_Status_ID").ToString()
            Me.HF_Status.Value = drvSql("SER_Status_ID").ToString()
            Me.RadCB_Cal_Status.SelectedValue = drvSql("SER_Cal_Status_ID").ToString()
            Me.HF_Cal_Status.Value = drvSql("SER_Cal_Status_ID").ToString()
            Me.RadCB_Fire_Status.SelectedValue = drvSql("SER_Fire_Status_ID").ToString()
            Me.HF_Fire_Status.Value = drvSql("SER_Fire_Status_ID").ToString()
            Me.RadCB_Exam_Status.SelectedValue = drvSql("SER_Exam_Status_ID").ToString()
            Me.HF_Exam_Status.Value = drvSql("SER_Exam_Status_ID").ToString()
            If Me.RadCB_Status.SelectedValue = 1037 Or Me.RadCB_Cal_Status.SelectedValue = 1037 Or Me.RadCB_Fire_Status.SelectedValue = 1037 Or Me.RadCB_Exam_Status.SelectedValue = 1037 Then
                Me.lbl_CloseMessage.Text = "Asset is currently being serviced"
                Me.lbl_CloseMessage.Visible = True
            Else
            End If
            Me.RadTxt_Notes.Text = drvSql("SER_Notes").ToString()
            If IsDBNull(drvSql("SER_Cal_Date_Due")) = False Then
                Me.RadDP_Due_Date.SelectedDate = DateTime.Parse(drvSql("SER_Cal_Date_Due")).ToString("dd MMM yyyy")
            End If
            Me.RadCB_Cal_Event_Type.SelectedValue = drvSql("SER_Cal_Event_Type").ToString()
            Me.RadCB_Fire.SelectedValue = drvSql("SER_Fire").ToString()
            Me.RadCB_Fire_Cycle.SelectedValue = drvSql("SER_Fire_Cycle").ToString()
            If IsDBNull(drvSql("SER_Fire_Date")) = False Then
                Me.RadDP_Fire_Date.SelectedDate = DateTime.Parse(drvSql("SER_Fire_Date")).ToString("dd MMM yyyy")
            End If
            Me.RadCB_Exam.SelectedValue = drvSql("SER_Exam").ToString()
            Me.RadCB_Exam_Cycle.SelectedValue = drvSql("SER_Exam_Cycle").ToString()
            If IsDBNull(drvSql("SER_Exam_Date")) = False Then
                Me.RadDP_Exam_Date.SelectedDate = DateTime.Parse(drvSql("SER_Exam_Date")).ToString("dd MMM yyyy")
            End If
            If Me.RadCB_Trigger.SelectedValue = "Calendar" Then
                '---SMU TABLE---
                Me.lbl_Sample_Text.Visible = True
                Me.RadCB_Sample.Visible = True
                Me.lbl_Latest_SMU_Date_Text.Visible = False
                Me.lbl_Latest_SMU_Date.Visible = False
                Me.lbl_Cycle_Text.Visible = False
                'Me.lbl_Cycle.Visible = False
                Me.RadNumTxt_Cycle.Visible = False
                Me.lbl_Counter_Text.Visible = False
                Me.RadNumTxt_Counter.Visible = False
                Me.RadNumTxt_Trend_Override.Visible = False
                Me.lbl_Mode_Text.Visible = False
                Me.RadCB_ServiceMode.Visible = False
                Me.lbl_SMU_Override_Text.Visible = False
                Me.RadCB_Override_SMU.Visible = False
                Me.lbl_Status.Visible = False
                Me.RadCB_Status.Visible = False
                Me.lbl_Left_Text.Visible = False
                Me.lbl_Left.Visible = False
                Me.lbl_Trend_Text.Visible = False
                Me.lbl_Trend.Visible = False
                Me.lbl_Trend_Override_Text.Visible = False
                Me.lbl_ServiceType_Text.Visible = False
                Me.RadCB_ServiceType.Visible = False
                Me.lbl_ST.Visible = False
                '---CALENDAR TABLE---
                Me.RadCB_Cal_Event_Type.Visible = True
                Me.RadDP_Due_Date.Visible = True
                Me.RadCB_Cal_Status.Visible = True
                Me.RadCB_Override_Cal.Visible = True
                Me.RadCB_Fire.Visible = True
                Me.RadCB_Exam.Visible = True
                Me.lbl_Cal_Event_Type_Text.Visible = True
                Me.lbl_Cal_Cycle_Text.Visible = True
                Me.lbl_Cal_Due_Date_Text.Visible = True
                Me.lbl_Cal_Override_Text.Visible = True
                Me.lbl_Cal_Status.Visible = True
            End If
            If Me.RadCB_Trigger.SelectedValue = "SMU and Calendar" Then
                '---SMU TABLE---
                Me.lbl_Sample_Text.Visible = True
                Me.RadCB_Sample.Visible = True
                Me.lbl_Latest_SMU_Date_Text.Visible = True
                Me.lbl_Latest_SMU_Date.Visible = True
                Me.lbl_Cycle_Text.Visible = True
                'Me.lbl_Cycle.Visible = True
                Me.RadNumTxt_Cycle.Visible = True
                Me.lbl_Counter_Text.Visible = True
                Me.RadNumTxt_Counter.Visible = True
                Me.RadNumTxt_Trend_Override.Visible = True
                Me.lbl_Mode_Text.Visible = True
                Me.RadCB_ServiceMode.Visible = True
                Me.lbl_SMU_Override_Text.Visible = True
                Me.RadCB_Override_SMU.Visible = True
                Me.lbl_Status.Visible = True
                Me.RadCB_Status.Visible = True
                Me.lbl_Left_Text.Visible = True
                Me.lbl_Left.Visible = True
                Me.lbl_Trend_Text.Visible = True
                Me.lbl_Trend_Override_Text.Visible = True
                Me.lbl_Trend.Visible = True
                '---CALENDAR TABLE---
                Me.RadCB_Cal_Event_Type.Visible = True
                Me.RadDP_Due_Date.Visible = True
                Me.RadCB_Cal_Status.Visible = True
                Me.RadCB_Override_Cal.Visible = True
                Me.RadCB_Fire.Visible = True
                Me.RadCB_Exam.Visible = True
                Me.lbl_Cal_Event_Type_Text.Visible = True
                Me.lbl_Cal_Cycle_Text.Visible = True
                Me.lbl_Cal_Due_Date_Text.Visible = True
                Me.lbl_Cal_Override_Text.Visible = True
                Me.lbl_Cal_Status.Visible = True
            End If
            If Me.RadCB_Trigger.SelectedValue = "SMU" Then
                '---SMU TABLE---
                Me.lbl_Sample_Text.Visible = True
                Me.RadCB_Sample.Visible = True
                Me.lbl_Latest_SMU_Date_Text.Visible = True
                Me.lbl_Latest_SMU_Date.Visible = True
                Me.lbl_Cycle_Text.Visible = True
                'Me.lbl_Cycle.Visible = True
                Me.RadNumTxt_Cycle.Visible = True
                Me.lbl_Counter_Text.Visible = True
                Me.RadNumTxt_Counter.Visible = True
                Me.RadNumTxt_Trend_Override.Visible = True
                Me.lbl_Mode_Text.Visible = True
                Me.RadCB_ServiceMode.Visible = True
                Me.lbl_SMU_Override_Text.Visible = True
                Me.RadCB_Override_SMU.Visible = True
                Me.lbl_Status.Visible = True
                Me.RadCB_Status.Visible = True
                Me.lbl_Left_Text.Visible = True
                Me.lbl_Left.Visible = True
                Me.lbl_Trend_Text.Visible = True
                Me.lbl_Trend.Visible = True
                Me.lbl_Trend_Override_Text.Visible = True
                '---CALENDAR TABLE---
                Me.RadCB_Cal_Event_Type.Visible = False
                Me.RadDP_Due_Date.Visible = False
                Me.RadCB_Cal_Status.Visible = False
                Me.RadCB_Override_Cal.Visible = False
                Me.RadCB_Fire.Visible = False
                Me.RadCB_Exam.Visible = False
                Me.lbl_Cal_Event_Type_Text.Visible = False
                Me.lbl_Cal_Cycle_Text.Visible = False
                Me.lbl_Cal_Due_Date_Text.Visible = False
                Me.lbl_Cal_Override_Text.Visible = False
                Me.lbl_Cal_Status.Visible = False
            End If
            If Me.RadCB_Fire.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
                Me.RadCB_Fire_Cycle.Visible = True
                Me.RadDP_Fire_Date.Visible = True
                Me.RadCB_Fire_Status.Visible = True
                Me.RadCB_Override_Fire.Visible = True
            Else
                Me.RadCB_Fire_Cycle.Visible = False
                Me.RadDP_Fire_Date.Visible = False
                Me.RadCB_Fire_Status.Visible = False
                Me.RadCB_Override_Fire.Visible = False
            End If
            If Me.RadCB_Exam.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
                Me.RadCB_Exam_Cycle.Visible = True
                Me.RadDP_Exam_Date.Visible = True
                Me.RadCB_Exam_Status.Visible = True
                Me.RadCB_Override_Exam.Visible = True
            Else
                Me.RadCB_Exam_Cycle.Visible = False
                Me.RadDP_Exam_Date.Visible = False
                Me.RadCB_Exam_Status.Visible = False
                Me.RadCB_Override_Exam.Visible = False
            End If
            Select Case RadCB_Cal_Event_Type.SelectedValue
                Case "3-Monthly Service"
                    Me.lbl_Cal_Cycle.Text = "90 days"
                Case "4-Monthly Service"
                    Me.lbl_Cal_Cycle.Text = "120 days"
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
        Next
    End Sub
    Sub GetLocation()
        Dim dvSql As DataView = DirectCast(SqlDS_AssetLocation.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lbl_Site.Text = drvSql("SiteName").ToString()
        Next
    End Sub
    Protected Sub Btn_Save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btn_Save.Click
        If RadCB_Trigger.SelectedValue <> "Calendar" And RadCB_ServiceType.SelectedValue = "-1" Then
            Dim msgstrWarning As String = "Please choose a Service Type before continuing."
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrWarning & "');", True)
        Else
            SqlDS_Update.SelectParameters("SER_ID").DefaultValue = Me.HF_SER_ID.Value
            SqlDS_Update.SelectParameters("SER_A_ID").DefaultValue = 0
            SqlDS_Update.SelectParameters("SER_SMU_Counter").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Trend").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Trend_Override").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Mode").DefaultValue = 0
            SqlDS_Update.SelectParameters("SER_SERD_ID").DefaultValue = 0
            SqlDS_Update.SelectParameters("SER_SERT_ID").DefaultValue = 0
            SqlDS_Update.SelectParameters("SER_Status_ID").DefaultValue = 0
            SqlDS_Update.SelectParameters("SER_Cal_Status_ID").DefaultValue = 0
            SqlDS_Update.SelectParameters("SER_Fire_Status_ID").DefaultValue = 0
            SqlDS_Update.SelectParameters("SER_Exam_Status_ID").DefaultValue = 0
            SqlDS_Update.SelectParameters("SER_Trigger").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Sample").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_External").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Notes").DefaultValue = "abc"
            SqlDS_Update.SelectParameters("SER_Cal_Date_Due").DefaultValue = "1900-01-01"
            SqlDS_Update.SelectParameters("SER_Cal_Event_Type").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Fire").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Fire_Cycle").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Fire_Date").DefaultValue = "1900-01-01"
            SqlDS_Update.SelectParameters("SER_Exam").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Exam_Cycle").DefaultValue = "0"
            SqlDS_Update.SelectParameters("SER_Exam_Date").DefaultValue = "1900-01-01"
            SqlDS_Update.SelectParameters("SER_Modified_By").DefaultValue = Me.lblWhoIsIt.Text
            Me.SqlDS_Update.Select(DataSourceSelectArguments.Empty)
            If RadCB_Trigger.SelectedValue <> "SMU" And RadCB_Override_Cal.SelectedValue = 1 Then
                Me.SqlDS_Override_Cal.Select(DataSourceSelectArguments.Empty)
            End If
            If RadCB_Trigger.SelectedValue <> "Calendar" And RadCB_Override_SMU.SelectedValue = 1 Then
                Me.SqlDS_Override_SMU.Select(DataSourceSelectArguments.Empty)
            End If
            If RadCB_Trigger.SelectedValue <> "SMU" And RadCB_Override_Fire.SelectedValue = 1 Then
                Me.SqlDS_Override_Fire.Select(DataSourceSelectArguments.Empty)
            End If
            If RadCB_Trigger.SelectedValue <> "SMU" And RadCB_Override_Exam.SelectedValue = 1 Then
                Me.SqlDS_Override_Exam.Select(DataSourceSelectArguments.Empty)
            End If
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
            Session("SER_ID") = Me.HF_SER_ID.Value
        End If
    End Sub
    Protected Sub RadCB_Trigger_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Trigger.SelectedIndexChanged
        If Me.RadCB_Trigger.SelectedValue = "Calendar" Then
            '---SMU TABLE---
            Me.lbl_Sample_Text.Visible = True
            Me.RadCB_Sample.Visible = True
            Me.lbl_Latest_SMU_Date_Text.Visible = False
            Me.lbl_Latest_SMU_Date.Visible = False
            Me.lbl_Cycle_Text.Visible = False
            'Me.lbl_Cycle.Visible = False
            Me.RadNumTxt_Cycle.Visible = False
            Me.lbl_Counter_Text.Visible = False
            Me.RadNumTxt_Counter.Visible = False
            Me.RadNumTxt_Trend_Override.visible = False
            Me.lbl_Mode_Text.Visible = False
            Me.RadCB_ServiceMode.Visible = False
            Me.lbl_SMU_Override_Text.Visible = False
            Me.RadCB_Override_SMU.Visible = False
            Me.lbl_Status.Visible = False
            Me.RadCB_Status.Visible = False
            Me.lbl_Left_Text.Visible = False
            Me.lbl_Left.Visible = False
            Me.lbl_Trend_Text.Visible = False
            Me.lbl_Trend_Override_Text.Visible = False
            Me.lbl_Trend.Visible = False
            Me.lbl_ServiceType_Text.Visible = False
            Me.RadCB_ServiceType.Visible = False
            Me.lbl_ST.Visible = False
            '---CALENDAR TABLE---
            Me.RadCB_Cal_Event_Type.Visible = True
            Me.RadDP_Due_Date.Visible = True
            Me.RadCB_Cal_Status.Visible = True
            Me.RadCB_Override_Cal.Visible = True
            Me.RadCB_Fire.Visible = True
            Me.RadCB_Exam.Visible = True
            Me.lbl_Cal_Event_Type_Text.Visible = True
            Me.lbl_Cal_Cycle_Text.Visible = True
            Me.lbl_Cal_Due_Date_Text.Visible = True
            Me.lbl_Cal_Override_Text.Visible = True
            Me.lbl_Cal_Status.Visible = True
        End If
        If Me.RadCB_Trigger.SelectedValue = "SMU and Calendar" Then
            '---SMU TABLE---
            Me.lbl_Sample_Text.Visible = True
            Me.RadCB_Sample.Visible = True
            Me.lbl_Latest_SMU_Date_Text.Visible = True
            Me.lbl_Latest_SMU_Date.Visible = True
            Me.lbl_Cycle_Text.Visible = True
            'Me.lbl_Cycle.Visible = True
            Me.RadNumTxt_Cycle.Visible = True
            Me.lbl_Counter_Text.Visible = True
            Me.RadNumTxt_Trend_Override.visible = True
            Me.RadNumTxt_Counter.Visible = True
            Me.lbl_Mode_Text.Visible = True
            Me.RadCB_ServiceMode.Visible = True
            Me.lbl_SMU_Override_Text.Visible = True
            Me.RadCB_Override_SMU.Visible = True
            Me.lbl_Status.Visible = True
            Me.RadCB_Status.Visible = True
            Me.lbl_Left_Text.Visible = True
            Me.lbl_Left.Visible = True
            Me.lbl_Trend_Text.Visible = True
            Me.lbl_Trend_Override_Text.Visible = True
            Me.lbl_Trend.Visible = True
            '---CALENDAR TABLE---
            Me.RadCB_Cal_Event_Type.Visible = True
            Me.RadDP_Due_Date.Visible = True
            Me.RadCB_Cal_Status.Visible = True
            Me.RadCB_Override_Cal.Visible = True
            Me.RadCB_Fire.Visible = True
            Me.RadCB_Exam.Visible = True
            Me.lbl_Cal_Event_Type_Text.Visible = True
            Me.lbl_Cal_Cycle_Text.Visible = True
            Me.lbl_Cal_Due_Date_Text.Visible = True
            Me.lbl_Cal_Override_Text.Visible = True
            Me.lbl_Cal_Status.Visible = True
        End If
        If Me.RadCB_Trigger.SelectedValue = "SMU" Then
            '---SMU TABLE---
            Me.lbl_Sample_Text.Visible = True
            Me.RadCB_Sample.Visible = True
            Me.lbl_Latest_SMU_Date_Text.Visible = True
            Me.lbl_Latest_SMU_Date.Visible = True
            Me.lbl_Cycle_Text.Visible = True
            'Me.lbl_Cycle.Visible = True
            Me.RadNumTxt_Cycle.Visible = True
            Me.RadNumTxt_Trend_Override.visible = True
            Me.lbl_Counter_Text.Visible = True
            Me.RadNumTxt_Counter.Visible = True
            Me.lbl_Mode_Text.Visible = True
            Me.RadCB_ServiceMode.Visible = True
            Me.lbl_SMU_Override_Text.Visible = True
            Me.RadCB_Override_SMU.Visible = True
            Me.lbl_Status.Visible = True
            Me.RadCB_Status.Visible = True
            Me.lbl_Left_Text.Visible = True
            Me.lbl_Left.Visible = True
            Me.lbl_Trend_Text.Visible = True
            Me.lbl_Trend_Override_Text.Visible = True
            Me.lbl_Trend.Visible = True
            '---CALENDAR TABLE---
            Me.RadCB_Cal_Event_Type.Visible = False
            Me.RadDP_Due_Date.Visible = False
            Me.RadCB_Cal_Status.Visible = False
            Me.RadCB_Override_Cal.Visible = False
            Me.RadCB_Fire.Visible = False
            Me.RadCB_Exam.Visible = False
            Me.lbl_Cal_Event_Type_Text.Visible = False
            Me.lbl_Cal_Cycle_Text.Visible = False
            Me.lbl_Cal_Due_Date_Text.Visible = False
            Me.lbl_Cal_Override_Text.Visible = False
            Me.lbl_Cal_Status.Visible = False
        End If
        If Me.RadCB_Fire.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
            Me.RadCB_Fire_Cycle.Visible = True
            Me.RadDP_Fire_Date.Visible = True
            Me.RadCB_Fire_Status.Visible = True
            Me.RadCB_Override_Fire.Visible = True
        Else
            Me.RadCB_Fire_Cycle.Visible = False
            Me.RadDP_Fire_Date.Visible = False
            Me.RadCB_Fire_Status.Visible = False
            Me.RadCB_Override_Fire.Visible = False
        End If
        If Me.RadCB_Exam.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
            Me.RadCB_Exam_Cycle.Visible = True
            Me.RadDP_Exam_Date.Visible = True
            Me.RadCB_Exam_Status.Visible = True
            Me.RadCB_Override_Exam.Visible = True
        Else
            Me.RadCB_Exam_Cycle.Visible = False
            Me.RadDP_Exam_Date.Visible = False
            Me.RadCB_Exam_Status.Visible = False
            Me.RadCB_Override_Exam.Visible = False
        End If
    End Sub
    Protected Sub RadCB_Fire_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Fire.SelectedIndexChanged
        If Me.RadCB_Fire.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
            Me.RadCB_Fire_Cycle.Visible = True
            Me.RadDP_Fire_Date.Visible = True
            Me.RadCB_Fire_Status.Visible = True
            Me.RadCB_Override_Fire.Visible = True
        Else
            Me.RadCB_Fire_Cycle.Visible = False
            Me.RadDP_Fire_Date.Visible = False
            Me.RadCB_Fire_Status.Visible = False
            Me.RadCB_Override_Fire.Visible = False
        End If
    End Sub
    Protected Sub RadCB_Exam_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Exam.SelectedIndexChanged
        If Me.RadCB_Exam.SelectedValue = 1 And Me.RadCB_Trigger.SelectedValue <> "SMU" Then
            Me.RadCB_Exam_Cycle.Visible = True
            Me.RadDP_Exam_Date.Visible = True
            Me.RadCB_Exam_Status.Visible = True
            Me.RadCB_Override_Exam.Visible = True
        Else
            Me.RadCB_Exam_Cycle.Visible = False
            Me.RadDP_Exam_Date.Visible = False
            Me.RadCB_Exam_Status.Visible = False
            Me.RadCB_Override_Exam.Visible = False
        End If
    End Sub
    Protected Sub RadNumTxt_Cycle_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Cycle.TextChanged
        If RadNumTxt_Cycle.Text <> 250 And RadNumTxt_Cycle.Text <> 500 And RadNumTxt_Cycle.Text <> 0 Then
            Dim msgstrWarning As String = "Cycle must be 250 or 500. Please try again."
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrWarning & "');", True)
        End If
        If RadNumTxt_Cycle.Text = 250 Then
            Me.lbl_Left.Text = (250 - Me.RadNumTxt_Counter.Text)
            Me.RadCB_ServiceMode.SelectedValue = "1"
            Me.RadCB_ServiceType.SelectedValue = "*Please Select"
        End If
        If RadNumTxt_Cycle.Text = 500 Then
            Me.lbl_Left.Text = (500 - Me.RadNumTxt_Counter.Text)
            Me.RadCB_ServiceMode.SelectedValue = "3"
            Me.RadCB_ServiceType.SelectedValue = "*Please Select"
        End If
    End Sub
    Protected Sub RadNumTxt_Counter_TextChanged(sender As Object, e As System.EventArgs) Handles RadNumTxt_Counter.TextChanged
        Me.lbl_Left.Text = (Me.RadNumTxt_Cycle.Text - Me.RadNumTxt_Counter.Text)
    End Sub
    Sub GetTrueTrend()
        Dim dvSql As DataView = DirectCast(SqlDS_SER_Trend_True.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lbl_TrueTrend.Text = "(True: " + drvSql("TrueTrend").ToString() + ")"
        Next
    End Sub
    Protected Sub RadCB_ServiceType_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_ServiceType.SelectedIndexChanged
        Dim dvSql As DataView = DirectCast(SqlDS_ServiceTypeID.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lbl_ServiceType.Text = drvSql("ATT_ID").ToString()
        Next
    End Sub
    Protected Sub RadCB_ServiceMode_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_ServiceMode.SelectedIndexChanged
        Dim dvSql As DataView = DirectCast(SqlDS_ServiceType0.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.RadCB_ServiceType.SelectedValue = drvSql("SERD_ID").ToString()
            Me.lbl_ServiceType.Text = drvSql("ATT_ID").ToString()
        Next
    End Sub
    Protected Sub RadCB_Cal_Event_Type_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Cal_Event_Type.SelectedIndexChanged
        Select Case RadCB_Cal_Event_Type.SelectedValue
            Case "3-Monthly Service"
                Me.lbl_Cal_Cycle.Text = "90 days"
            Case "4-Monthly Service"
                Me.lbl_Cal_Cycle.Text = "120 days"
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
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        If Me.HF_Status.Value = 1039 And Me.RadCB_Status.SelectedValue = 1032 Then
            Me.RadCB_Cal_Status.SelectedValue = 1032
            Me.RadCB_Fire_Status.SelectedValue = 1032
            Me.RadCB_Exam_Status.SelectedValue = 1032
        End If
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_8_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_8_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                End If
            Case 4
                Me.Btn_Save.Visible = True
            Case 5
                Me.Btn_Save.Visible = True
            Case Else
                Me.Btn_Save.Visible = False
        End Select
    End Sub
End Class