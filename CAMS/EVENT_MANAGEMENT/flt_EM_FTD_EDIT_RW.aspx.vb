Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class EVENT_MANAGEMENT_flt_EM_FTD_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_FTD_ID.Value = Request.QueryString("FTD_ID")
        Me.HF_J_ID.Value = Request.QueryString("J_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Session("FTD_ID") = HF_FTD_ID.Value
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        GetData()
        Setup_Engineers_Combo()
        If HF_FTD_ID.Value = 0 Then
            RadDTP_Start_Time.SelectedDate = DateTime.Now
            RadDTP_Job_Start_Time.SelectedDate = DateTime.Now
            RadDTP_Job_End_Time.SelectedDate = DateTime.Now
            RadDTP_End_Time.SelectedDate = DateTime.Now
            RadNumTxt_Start_Mileage.Text = "0"
            RadNumTxt_End_Mileage.Text = "0"
            RadCB_Breaks.SelectedValue = "0"
            ShowHideSave()
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
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim ThisID As String = HF_FTD_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "EM - Timesheets Detail - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.EM_FTD_RG_SELECT_RW_SP(HF_FTD_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_J_ID.Value = drvSql("FTD_J_ID").ToString()
            Me.RadCB_Engineer.SelectedValue = drvSql("FTD_Engineer_ID").ToString()
            Me.RadTxt_Start_Location.Text = drvSql("FTD_Start_Location").ToString()
            If IsDBNull(drvSql("FTD_Start_Time")) = False Then
                Me.RadDTP_Start_Time.SelectedDate = DateTime.Parse(drvSql("FTD_Start_Time")).ToString("dd MMM yyyy HH:mm")
            End If
            If IsDBNull(drvSql("FTD_Job_Start_Time")) = False Then
                Me.RadDTP_Job_Start_Time.SelectedDate = DateTime.Parse(drvSql("FTD_Job_Start_Time")).ToString("dd MMM yyyy HH:mm")
            End If
            Me.RadNumTxt_Start_Mileage.Text = drvSql("FTD_Start_Mileage").ToString()
            If IsDBNull(drvSql("FTD_Job_End_Time")) = False Then
                Me.RadDTP_Job_End_Time.SelectedDate = DateTime.Parse(drvSql("FTD_Job_End_Time")).ToString("dd MMM yyyy HH:mm")
            End If
            If IsDBNull(drvSql("FTD_End_Time")) = False Then
                Me.RadDTP_End_Time.SelectedDate = DateTime.Parse(drvSql("FTD_End_Time")).ToString("dd MMM yyyy HH:mm")
            End If
            Me.RadCB_Breaks.SelectedValue = drvSql("FTD_Breaks").ToString()
            Me.RadNumTxt_End_Mileage.Text = drvSql("FTD_Return_Mileage").ToString()
            Me.RadTxt_End_Location.Text = drvSql("FTD_End_Location").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("FTD_Status").ToString()

            If HF_FTD_ID.Value <> 0 Then
                Me.lbl_Travel_To_Time.Text = drvSql("FTD_Travel_To_Time_Calc").ToString()
                Me.lbl_Job_Time.Text = drvSql("FTD_Job_Time_Calc").ToString()
                Me.lbl_Travel_From_Time.Text = drvSql("FTD_Travel_From_Time_Calc").ToString()
                Me.lbl_Breaks.Text = drvSql("FTD_Breaks_Calc").ToString()
                Me.lbl_Total_Time.Text = drvSql("FTD_Total_Time_Calc").ToString()
                Me.lbl_Peak_Time.Text = drvSql("FTD_Peak_Calc").ToString()
                Me.lbl_Off_Peak_Time.Text = drvSql("FTD_Off_Peak_Calc").ToString()
                Me.lbl_Total_Mileage.Text = drvSql("FTD_Total_Mileage").ToString()
            End If

        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Engineers_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers(RadCB_Engineer, False, HF_FTD_ID.Value)
    End Sub
#End Region
    Protected Sub RadCB_Engineer_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Engineer.SelectedIndexChanged
        ShowHideSave()
    End Sub
    Protected Sub RadDTP_Start_Time_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDTP_Start_Time.SelectedDateChanged
        ShowHideSave()
    End Sub
    Protected Sub RadDTP_Job_Start_Time_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDTP_Job_Start_Time.SelectedDateChanged
        ShowHideSave()
    End Sub
    Protected Sub RadDTP_Job_End_Time_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDTP_Job_End_Time.SelectedDateChanged
        ShowHideSave()
    End Sub
    Protected Sub RadDTP_End_Time_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDTP_End_Time.SelectedDateChanged
        ShowHideSave()
    End Sub
    Protected Sub RadNumTxt_Start_Mileage_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Start_Mileage.TextChanged
        If RadNumTxt_End_Mileage.Text = "" Or RadNumTxt_End_Mileage.Text = "0" Then
            RadNumTxt_End_Mileage = RadNumTxt_Start_Mileage
        End If
        ShowHideSave()
    End Sub
    Protected Sub RadNumTxt_End_Mileage_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_End_Mileage.TextChanged
        ShowHideSave()
    End Sub
    Sub ShowHideSave()
        If CDbl(RadNumTxt_Start_Mileage.Text) > CDbl(RadNumTxt_End_Mileage.Text) Then
            Me.Btn_Save.Visible = False
        Else
            Me.Btn_Save.Visible = True
        End If
        If RadCB_Engineer.SelectedValue = Nothing Or RadDTP_Start_Time.IsEmpty = True Or RadDTP_Job_Start_Time.IsEmpty = True Or RadDTP_Job_End_Time.IsEmpty = True Or RadDTP_End_Time.IsEmpty = True Then
            Me.Btn_Save.Visible = False
        Else
            Me.Btn_Save.Visible = True
        End If
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveFTD(Me.HF_FTD_ID.Value _
                        , HF_J_ID.Value _
                        , RadCB_Engineer.SelectedValue _
                        , RadTxt_Start_Location.Text _
                        , RadDTP_Start_Time.SelectedDate _
                        , RadNumTxt_Start_Mileage.Text _
                        , RadDTP_Job_Start_Time.SelectedDate _
                        , RadDTP_Job_End_Time.SelectedDate _
                        , RadNumTxt_End_Mileage.Text _
                        , RadDTP_End_Time.SelectedDate _
                        , RadCB_Breaks.SelectedValue _
                        , RadTxt_End_Location.Text _
                        , RadCB_Status.SelectedValue _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("FTD_ID") = HF_FTD_ID.Value
    End Sub

End Class