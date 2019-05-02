Imports System.Data
Imports System.Data.SqlClient
Partial Class EVENT_MANAGEMENT_flt_EM_JOBS_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_J_ID.Value = Request.QueryString("J_ID")
        Me.lbl_J_ID.Text = Request.QueryString("J_ID")
        Me.HF_E_ID.Value = Request.QueryString("J_E_ID")
        Me.lbl_EventID.Text = Request.QueryString("J_E_ID")
        Session("J_ID") = lbl_J_ID.Text
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        GetData()
        If HF_Event_Status.Value = "Complete" Or HF_Event_Status.Value = "Cancelled" Then
            HF_LiveOrArchive.Value = 1
        Else
            HF_LiveOrArchive.Value = 0
        End If
        Setup_Event_Combo()
        If Me.RadCB_Event.SelectedValue = "" Then
            Me.RadCB_Event.SelectedValue = -1
        End If
        Me.RadCB_Event.SelectedValue = HF_E_ID.Value
        Session("J_E_ID") = HF_E_ID.Value


        If Me.HF_J_ID.Value = 0 Then
            lblTitle.Text = "ADD JOB"
            Me.Title = lblTitle.Text
            Me.lbl_Created.Visible = False
            Me.lbl_Created_By.Visible = False
            Me.lbl_Modified.Visible = False
            Me.lbl_Modified_By.Visible = False
            Me.HF_LiveOrArchive.Value = 0
            Me.lbl_J_ID.Visible = False
            Me.lbl_EventID.Visible = True
            RadCB_Event.Visible = False
            Setup_JobTypes_Combo()
            Setup_Level1_Combo()
            Me.RadCB_Level1.SelectedValue = 2661
            Setup_Level2_Combo()
            Me.RadCB_Level2.SelectedValue = 2662
            Setup_Level3_Combo()
            Me.RadCB_Level3.SelectedValue = 2663
            Setup_Inc_Code_Combo()
            Setup_Engineers_Combo()
            Me.lbl_Time_Diff_Text.Visible = False
            Me.lbl_Time_Diff.Visible = False
        Else
            lblTitle.Text = "EDIT JOB"
            Me.Title = lblTitle.Text
            Me.lbl_Created.Visible = True
            Me.lbl_Created_By.Visible = True
            Me.lbl_Modified.Visible = True
            Me.lbl_Modified_By.Visible = True
            Me.lbl_EventID.Visible = False

            If Me.RadCB_JobType.SelectedValue = 659 Then
                Me.RadCB_Event.Visible = False
                Me.lbl_EventID_SignOff.Visible = True
                Apply_Permissions()
            End If
            If Me.RadCB_JobType.SelectedValue = 660 Then
                Me.btnPrintJobCard.Visible = False
                Me.RadCB_Event.Visible = False
                Me.lbl_EventID_SignOff.Visible = True
            Else
                Me.btnPrintJobCard.Visible = True
            End If

            ShowHideCodesTable()
            'RequiresSMU()
            Me.lbl_Time_Diff_Text.Visible = True
            Me.lbl_Time_Diff.Visible = True
        End If
        ShowHideSave()
        ShowHideTime()
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
                                Select Case dr("EXCEPTION_ID").ToString()
                                    Case 134
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_6_R.Value = 1 'Event Dashboard R
                                        End If
                                    Case 145
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_6_RW.Value = 1 'Event Dashboard RW
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
    Sub ShowHideCodesTable()
        If RadCB_JobType.SelectedValue = 638 Or RadCB_JobType.SelectedValue = 648 Or RadCB_JobType.SelectedValue = 649 Or RadCB_JobType.SelectedValue = 655 Or RadCB_JobType.SelectedValue = 659 Or RadCB_JobType.SelectedValue = 660 Or RadCB_JobType.SelectedValue = 663 Or RadCB_JobType.SelectedValue = 1261 Or Me.HF_ET_ID.Value = 629 Then
            Me.Table_Codes.Visible = False
        Else
            Me.Table_Codes.Visible = True
        End If
    End Sub
    Sub ShowHideTime()
        If RadCB_JobType.SelectedValue <> "" Then
            If RadCB_JobType.SelectedValue = 660 Then
                Me.lbl_Estimated_Hours_Text.Visible = False
                Me.RadNumTxt_Estimated_Hours.Visible = False
                Me.RadNumTxt_Estimated_Mins.Visible = False
                Me.lbl_Actual_Hours_Text.Visible = False
                Me.lbl_Actual_Hours.Visible = False
                Me.lbl_Time_Diff_Text.Visible = False
                Me.lbl_Time_Diff.Visible = False
            Else
                Me.lbl_Estimated_Hours_Text.Visible = True
                Me.RadNumTxt_Estimated_Hours.Visible = True
                Me.RadNumTxt_Estimated_Mins.Visible = True
                Me.lbl_Actual_Hours_Text.Visible = True
                Me.lbl_Actual_Hours.Visible = True
                Me.lbl_Time_Diff_Text.Visible = True
                Me.lbl_Time_Diff.Visible = True
            End If
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim ThisID As String = HF_J_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "EM - Jobs - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        'If Not Me.IsPostBack Then
        '    If HF_J_ID.Value = 0 Then
        '    Else
        '        GetData()
        '    End If
        'End If
    End Sub
    'Sub RequiresSMU()
    '    Dim EventFlag As Integer
    '    Dim JobFlag As Integer
    '    Dim dvSql As DataView = DirectCast(SqlDS_RequiresSMU.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In dvSql
    '        EventFlag = drvSql("EventFlag").ToString()
    '        JobFlag = drvSql("JobFlag").ToString()
    '    Next
    '    If EventFlag = 1 Or JobFlag = 1 Then
    '        HF_RequiresSMU.Value = 1
    '    Else
    '        HF_RequiresSMU.Value = 0
    '    End If
    '    If JobFlag = 1 Then
    '        HF_RequiresSMUJob.value = 1
    '    End If
    '    If HF_RequiresSMUJob.Value = 1 Then
    '        Me.RadTxt_SMU.Visible = False
    '        Me.lbl_SMU.Visible = False
    '        Me.lbl_SMU_Prev.Visible = False
    '        Me.lblLastSMU.Visible = False
    '    End If
    'End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.EM_JOBS_RG_SELECT_RW_SP(HF_J_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lbl_Created.Text = "Created: " + DateTime.Parse(drvSql("J_Created")).ToString("dd MMM yyyy HH:mm")
            Me.lbl_Created_By.Text = drvSql("J_Created_By").ToString()
            Me.lbl_Modified.Text = "Modified: " + DateTime.Parse(drvSql("J_Modified")).ToString("dd MMM yyyy HH:mm")
            Me.lbl_Modified_By.Text = drvSql("J_Modified_By").ToString()
            Me.RadCB_Event.SelectedValue = drvSql("J_E_ID").ToString()
            Me.lbl_EventID_SignOff.Text = drvSql("J_E_ID").ToString()
            Me.HF_A_ID.Value = drvSql("E_A_ID").ToString()
            If HF_A_ID.Value = 0 Then
                GetAssetFromEvent()
            End If
            Me.HF_ET_ID.Value = drvSql("E_ET_ID").ToString()
            Me.HF_Site_ID.Value = drvSql("E_SITE_ID").ToString()
            Me.HF_MOD_ID.Value = drvSql("Model_ID").ToString()
            Me.lblModel.Text = drvSql("Model_Name").ToString()
            Setup_JobTypes_Combo()
            Me.RadCB_JobType.SelectedValue = drvSql("J_JT_ID").ToString()
            Setup_Level1_Combo()
            Me.RadCB_Level1.SelectedValue = drvSql("J_Code_Level_1").ToString()
            Setup_Level2_Combo()
            Me.RadCB_Level2.SelectedValue = drvSql("J_Code_Level_2").ToString()
            Setup_Level3_Combo()
            Me.RadCB_Level3.SelectedValue = drvSql("J_Code_Level_3").ToString()
            Setup_Inc_Code_Combo()
            Me.RadCB_INC_CODE.SelectedValue = drvSql("J_INC_CODE").ToString()
            Setup_Engineers_Combo()
            Me.RadCB_Engineer.SelectedValue = drvSql("J_Engineer_ID").ToString()
            Me.RadTxt_Instruction.Text = drvSql("J_Instruction").ToString()
            If IsDBNull(drvSql("J_Planned_Start_Date")) = False Then
                Me.RadDP_Planned_Start_Date.SelectedDate = DateTime.Parse(drvSql("J_Planned_Start_Date")).ToString("dd MMM yyyy")
            End If
            If IsDBNull(drvSql("E_Planned_Start_Date")) = False Then
                HF_E_Planned_Start_Date.Value = DateTime.Parse(drvSql("E_Planned_Start_Date")).ToString("yyyy-MM-dd")
            End If
            Me.RadCB_Status.SelectedValue = drvSql("J_Status").ToString()
            Me.HF_Event_Status.Value = drvSql("E_Status").ToString()
            Me.RadTxt_Notes.Text = drvSql("J_Notes").ToString()
            Me.RadNumTxt_Estimated_Hours.Text = drvSql("EstimatedHrs").ToString()
            Me.RadNumTxt_Estimated_Mins.Text = drvSql("EstimatedMins").ToString()
            lbl_Actual_Hours.Text = drvSql("J_FTD_Total_Time").ToString()
            lbl_Time_Diff.Text = drvSql("J_Time_Diff").ToString()
            lbl_Engineer_Rate.Text = Format(drvSql("J_Engineer_Rate"), "£#,##0.00")
            Dim DiffMins As Integer
            DiffMins = drvSql("J_Time_Diff_Minutes").ToString()
            Select Case DiffMins
                Case <= 0
                    lbl_Time_Diff.ForeColor = Drawing.Color.FromName("#9bd562")
                    lbl_Time_Diff.Font.Bold = True
                Case > 0
                    lbl_Time_Diff.ForeColor = Drawing.Color.Tomato
                    lbl_Time_Diff.Font.Bold = True
            End Select
            If Me.RadCB_Status.SelectedValue = "Complete" Or Me.RadCB_Status.SelectedValue = "Cancelled" Then
                Me.lbl_Closed.Visible = True
                Me.RadDP_Closed.Visible = True
                If RadCB_JobType.SelectedValue = 3290 Then
                    Me.lbl_Create_Event.Visible = True
                    Me.RadCB_Create_Event.Visible = True
                    Me.RadCB_Create_Event.SelectedValue = drvSql("J_QEF_Event_Flag").ToString()
                End If
                Me.lbl_SMU.Visible = True
                    Me.lbl_SMU_Prev.Visible = False
                    Me.lblLastSMU.Visible = False
                    Me.RadTxt_SMU.Visible = True
                If IsDBNull(drvSql("J_Date_Closed")) = False Then
                    Me.RadDP_Closed.SelectedDate = DateTime.Parse(drvSql("J_Date_Closed")).ToString("dd MMM yyyy HH:mm")
                End If
                Me.RadTxt_SMU.Text = drvSql("J_SMU").ToString()
                    Me.lblLastSMU.Text = drvSql("J_SMU").ToString()
                    Me.HF_SMU.Value = drvSql("J_SMU").ToString()
                    If Me.lblLastSMU.Text = "" Then
                        Me.lblLastSMU.Text = "0"
                    End If
                Else
                    Me.lbl_Closed.Visible = False
                Me.RadDP_Closed.Visible = False
                Me.lbl_Create_Event.Visible = False
                Me.RadCB_Create_Event.Visible = False
                Me.lbl_SMU.Visible = False
                Me.lbl_SMU_Prev.Visible = False
                Me.lblLastSMU.Visible = False
                Me.RadTxt_SMU.Visible = False
            End If
            If HF_J_ID.Value = 0 Then
                RadNumTxt_Estimated_Hours.Text = 0
                RadNumTxt_Estimated_Mins.Text = 0
            Else
                CalcEstTime()
            End If
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Event_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Event = Setup.Populate_Events_JobCard(RadCB_Event, HF_A_ID.Value, HF_LiveOrArchive.Value)
    End Sub
    Private Sub Setup_Engineers_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers(RadCB_Engineer, False, HF_J_ID.Value)
    End Sub
    Private Sub Setup_JobTypes_Combo()
        Dim Setup As New Setup.Combo
        RadCB_JobType = Setup.Populate_AttributeDropdown(RadCB_JobType, False, "Job_Type")
    End Sub
    Private Sub Setup_Level1_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Level1 = Setup.Populate_CodeLevelDropdown(RadCB_Level1, False, 1, 0)
    End Sub
    Private Sub Setup_Level2_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Level2 = Setup.Populate_CodeLevelDropdown(RadCB_Level2, False, 2, RadCB_Level1.SelectedValue)
    End Sub
    Private Sub Setup_Level3_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Level3 = Setup.Populate_CodeLevelDropdown(RadCB_Level3, False, 3, RadCB_Level2.SelectedValue)
    End Sub
    Private Sub Setup_Inc_Code_Combo()
        Dim Setup As New Setup.Combo
        RadCB_INC_CODE = Setup.Populate_AttributeDropdown(RadCB_INC_CODE, False, "Incident_Codes")
    End Sub
#End Region
    Sub GetAssetFromEvent()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetAssetFromEvent(HF_E_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_A_ID.Value = drvSql("E_A_ID").ToString()
        End If
    End Sub
    Sub GetJobSMU()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.EM_JOBS_SET_SMU(RadCB_Event.SelectedValue)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lblLastSMU.Text = drvSql("JobSMU").ToString()
            Me.HF_SMU.Value = drvSql("JobSMU").ToString()
        End If
        If Me.RadTxt_SMU.Text = "" Then
            Me.RadTxt_SMU.Text = 0
        End If
        If Me.lblLastSMU.Text = "" Then
            Me.lblLastSMU.Text = "0"
        End If
    End Sub
    Sub OKtoClose()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.EM_JOBS_CLOSE_STATUS(RadCB_Event.SelectedValue)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_Close.Value = drvSql("CloseStatus").ToString()
        End If
    End Sub
    Protected Sub RadCB_Event_SelectedIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Event.SelectedIndexChanged
        Me.HF_E_ID.Value = Me.RadCB_Event.SelectedValue
    End Sub
    Protected Sub RadCB_JobType_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_JobType.SelectedIndexChanged
        If Me.RadCB_JobType.SelectedValue = 660 Then
            OKtoClose()
            Me.btnPrintJobCard.Visible = False
        Else
            Me.btnPrintJobCard.Visible = True
        End If
        ShowHideCodesTable()
        ShowHideSave()
        If Me.RadCB_JobType.SelectedValue = 660 And Me.HF_Close.Value = 0 Then
            Me.Btn_Save.Visible = True
            Apply_Permissions()
        End If
        If Me.RadCB_JobType.SelectedValue = 659 And Me.HF_Close.Value = 0 Then
            Me.RadCB_Event.Visible = False
            Me.lbl_EventID_SignOff.Visible = True
            Apply_Permissions()
        End If
        If Me.RadCB_JobType.SelectedValue = 660 And Me.HF_Close.Value <> 0 And RadCB_Status.SelectedValue = "Complete" Then
            Me.Btn_Save.Visible = False
            Me.RadNotification1.Visible = True
        End If
        If Me.RadCB_JobType.SelectedValue = 660 And Me.HF_Close.Value <> 0 And RadCB_Status.SelectedValue <> "Complete" Then
            Me.Btn_Save.Visible = True
            Apply_Permissions()
            Me.RadNotification1.Visible = False
        End If
        ShowHideTime()
    End Sub
    Protected Sub RadCB_Level1_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level1.SelectedIndexChanged
        Me.RadCB_Level2.ClearSelection()
        If RadCB_Level2.SelectedValue = "" Then
            RadCB_Level2.SelectedValue = 2662
        End If

        Setup_Level2_Combo()

        Me.RadCB_Level3.ClearSelection()
        If RadCB_Level3.SelectedValue = "" Then
            RadCB_Level3.SelectedValue = 2663
        End If
        Setup_Level3_Combo()
    End Sub
    Protected Sub RadCB_Level2_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level2.SelectedIndexChanged
        Me.RadCB_Level3.ClearSelection()
        If RadCB_Level3.SelectedValue = "" Then
            RadCB_Level3.SelectedValue = 2663
        End If
        Setup_Level3_Combo()
    End Sub
    Protected Sub RadCB_Level3_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level3.SelectedIndexChanged
        If RadCB_Status.SelectedValue = "Complete" Then
            If RadCB_Level1.SelectedValue = 2661 Or RadCB_Level2.SelectedValue = 2662 Or RadCB_Level3.SelectedValue = 2663 And RadCB_Status.SelectedValue = "Complete" Then
                Dim msgstrEmptyWarning As String = "Please ensure all Component Code levels are set before continuing"
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrEmptyWarning & "');", True)
            Else
            End If
        End If
    End Sub
    Protected Sub RadCB_Engineer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Engineer.SelectedIndexChanged
        ShowHideSave()
    End Sub
    Protected Sub RadDP_Planned_Start_Date_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_Planned_Start_Date.SelectedDateChanged
        ShowHideSave()
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        If Me.RadCB_Status.SelectedValue = "Complete" Or Me.RadCB_Status.SelectedValue = "Cancelled" Then
            Me.lbl_Closed.Visible = True
            Me.RadDP_Closed.Visible = True
            If RadCB_JobType.SelectedValue = 3290 Then
                Me.lbl_Create_Event.Visible = True
                Me.RadCB_Create_Event.Visible = True
            End If
            Me.lblLastSMU.Visible = True
                Me.lbl_SMU.Visible = True
                Me.lbl_SMU_Prev.Visible = True
                Me.RadTxt_SMU.Visible = True
                GetJobSMU()
                Me.RadDP_Closed.SelectedDate = DateTime.Now
            Else
                Me.lbl_Closed.Visible = False
            Me.RadDP_Closed.Visible = False
            Me.lbl_Create_Event.Visible = False
            Me.RadCB_Create_Event.Visible = False
            Me.lbl_SMU.Visible = False
            Me.lbl_SMU_Prev.Visible = False
            Me.lblLastSMU.Visible = False
            Me.RadTxt_SMU.Visible = False
        End If
        ShowHideSave()
        ' SMUSaveRules()
        If RadCB_Status.SelectedValue = "Complete" And RadCB_JobType.SelectedValue <> 660 And RadCB_JobType.SelectedValue <> 659 And RadCB_JobType.SelectedValue <> 3290 Then
            If RadCB_Level1.SelectedValue = 2661 Or RadCB_Level2.SelectedValue = 2662 Or RadCB_Level3.SelectedValue = 2663 Then
                Dim msgstrEmptyWarning As String = "Please ensure all Component Code levels are set before continuing"
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrEmptyWarning & "');", True)
            Else
            End If
        End If
    End Sub
    Protected Sub RadTxt_SMU_TextChanged(sender As Object, e As EventArgs) Handles RadTxt_SMU.TextChanged
        Me.HF_SMU.Value = CInt(RadTxt_SMU.Text)
        Dim THISSMU As String = Me.RadTxt_SMU.Text
        If Me.RadTxt_SMU.Text < CInt(Me.lblLastSMU.Text) And Me.RadTxt_SMU.Text <> "1" Then
            Dim msgstrSMUWarning As String = "SMU value of " & THISSMU & " is lower than the previous recorded value. Click OK to continue."
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrSMUWarning & "');", True)
        ElseIf Me.RadTxt_SMU.Text = "1" Then
            Dim msgstrSMUWarning2 As String = "Please input the full SMU value before continuing."
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrSMUWarning2 & "');", True)
        End If
        'SMUSaveRules()
    End Sub
    'Sub SMUSaveRules()
    '    If HF_RequiresSMU.Value = 0 Then '0 = Required, 1 = Not Required
    '        If RadTxt_SMU.Text = "0" Then
    '            If Me.RadCB_Status.SelectedValue = "Trash" Or Me.RadCB_Status.SelectedValue = "Cancelled" Then
    '                Me.Btn_Save.Visible = True
    '                Me.btnPrintJobCard.Visible = True
    '                Apply_Permissions()
    '            Else
    '                Me.Btn_Save.Visible = False
    '                Me.btnPrintJobCard.Visible = False
    '            End If
    '        Else
    '            If RadTxt_SMU.Text <> "1" Then
    '                Me.Btn_Save.Visible = True
    '                Me.btnPrintJobCard.Visible = True
    '                Apply_Permissions()
    '            End If
    '        End If
    '    Else
    '        If RadTxt_SMU.Text <> "1" Then
    '            Me.Btn_Save.Visible = True
    '            Me.btnPrintJobCard.Visible = True
    '            Apply_Permissions()
    '        End If
    '    End If
    '    If HF_RequiresSMUJob.Value = 1 Then
    '        Me.RadTxt_SMU.Visible = False
    '        Me.lbl_SMU.Visible = False
    '        Me.lbl_SMU_Prev.Visible = False
    '        Me.lblLastSMU.Visible = False
    '    End If
    '    If RadTxt_SMU.Text = "1" Then
    '        Me.Btn_Save.Visible = False
    '        Me.btnPrintJobCard.Visible = False
    '    End If
    'End Sub
    Sub CalcEstTime()
        Dim Hrs As String
        Dim Mins As String
        If RadNumTxt_Estimated_Hours.Text = "" Then RadNumTxt_Estimated_Hours.Text = "0"
        If RadNumTxt_Estimated_Hours.Text = "0" Then
            Hrs = "00"
        End If
        If CDbl(RadNumTxt_Estimated_Hours.Text) > 0 And CDbl(RadNumTxt_Estimated_Hours.Text) < 10 Then
            Hrs = "0" + RadNumTxt_Estimated_Hours.Text
        Else
            Hrs = RadNumTxt_Estimated_Hours.Text
        End If
        If RadNumTxt_Estimated_Mins.Text = "" Then RadNumTxt_Estimated_Mins.Text = "0"
        If RadNumTxt_Estimated_Mins.Text = "0" Then
            Mins = "00"
        End If
        If CDbl(RadNumTxt_Estimated_Mins.Text) > 0 And CDbl(RadNumTxt_Estimated_Mins.Text) < 10 Then
            Mins = "0" + RadNumTxt_Estimated_Mins.Text
        Else
            Mins = RadNumTxt_Estimated_Mins.Text
        End If
        HF_Estimated_Time.Value = Hrs + ":" + Mins
    End Sub
    Protected Sub RadNumTxt_Estimated_Hours_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Estimated_Hours.TextChanged
        CalcEstTime()
    End Sub
    Protected Sub RadNumTxt_Estimated_Mins_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Estimated_Mins.TextChanged
        CalcEstTime()
    End Sub
    Protected Sub RadDP_Closed_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_Closed.SelectedDateChanged
        If HF_E_Planned_Start_Date.Value <> "" Then
            If RadDP_Closed.SelectedDate < Me.HF_E_Planned_Start_Date.Value Then
                Dim THISDC As Date = Me.RadDP_Closed.SelectedDate
                Dim THISPSD As Date = Me.HF_E_Planned_Start_Date.Value
                Dim msgstrSMUWarning As String = THISDC & " is lower than the Event Planned Start Date of " & THISPSD & ". Please rectify before continuing."
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrSMUWarning & "');", True)
            Else
            End If
        End If
    End Sub
    Sub ShowHideSave()
        If RadCB_JobType.SelectedValue = "" Or RadCB_Engineer.SelectedValue = "" Or RadDP_Planned_Start_Date.IsEmpty = True Then
            Me.Btn_Save.Visible = False
            Me.btnPrintJobCard.Visible = False
        Else
            Me.Btn_Save.Visible = True
            Me.btnPrintJobCard.Visible = True
            Apply_Permissions()
        End If
        If RadCB_JobType.SelectedValue = 660 Then
            If RadCB_Engineer.SelectedValue = "" Then
                Me.Btn_Save.Visible = False
                Me.btnPrintJobCard.Visible = False
            Else
                Me.Btn_Save.Visible = True
                Me.btnPrintJobCard.Visible = True
                Apply_Permissions()
            End If
        Else
        End If
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        SaveProcess()
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Me.HF_E_ID.Value = Session("J_E_ID")
    End Sub
    Protected Sub btnPrintJobCard_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintJobCard.Click
        SaveProcess()
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "fn_OpenJobCard();", True)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Me.HF_E_ID.Value = Session("J_E_ID")
    End Sub
    Protected Sub SaveProcess()
        If RadCB_JobType.SelectedValue = "" Then RadCB_JobType.SelectedValue = -1
        If RadCB_Level1.SelectedValue = "" Then RadCB_Level1.SelectedValue = 2661
        If RadCB_Level2.SelectedValue = "" Then RadCB_Level2.SelectedValue = 2662
        If RadCB_Level3.SelectedValue = "" Then RadCB_Level3.SelectedValue = 2663
        If RadCB_INC_CODE.SelectedValue = "" Then RadCB_INC_CODE.SelectedValue = 2660
        If RadCB_Engineer.SelectedValue = "" Then RadCB_Engineer.SelectedValue = 5672

        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveJob(Me.HF_J_ID.Value _
                        , HF_E_ID.Value _
                        , RadCB_JobType.SelectedValue _
                        , RadCB_Level1.SelectedValue _
                        , RadCB_Level2.SelectedValue _
                        , RadCB_Level3.SelectedValue _
                        , RadCB_INC_CODE.SelectedValue _
                        , If(IsNothing(RadDP_Planned_Start_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Planned_Start_Date.SelectedDate) _
                        , RadCB_Engineer.SelectedValue _
                        , If(IsNothing(RadDP_Closed.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Closed.SelectedDate) _
                        , RadTxt_SMU.Text _
                        , HF_Estimated_Time.Value _
                        , RadTxt_Instruction.Text _
                        , RadCB_Status.SelectedValue _
                        , RadTxt_Notes.Text _
                        , RadCB_Create_Event.SelectedValue _
                        , HF_Username.Value _
                        , HF_Username.Value)

        'If Me.RadCB_JobType.SelectedValue = 660 And HF_Event_Type.Value = "636" Then
        '    Me.SqlDS_UpdateServiceTrend.Select(DataSourceSelectArguments.Empty)
        'End If
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("JobType") = RadCB_JobType.SelectedValue
        Session("Status") = RadCB_Status.SelectedValue
        Session("J_ID") = HF_J_ID.Value
    End Sub

    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_6_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                    Me.btnPrintJobCard.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                    Me.btnPrintJobCard.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_6_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                    Me.btnPrintJobCard.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                    Me.btnPrintJobCard.Visible = False
                End If
            Case 4
                Me.Btn_Save.Visible = True
                Me.btnPrintJobCard.Visible = True
            Case 5
                Me.Btn_Save.Visible = True
                Me.btnPrintJobCard.Visible = True
            Case Else
                Me.Btn_Save.Visible = False
                Me.btnPrintJobCard.Visible = False
        End Select
    End Sub
End Class