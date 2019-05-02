Imports System.Data
Imports System.Data.SqlClient
Partial Class ADMIN_flt_ADMIN_ENGINEER_DETAIL_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Me.HF_ENGD_ID.Value = Request.QueryString("ENGD_ID")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        GetData()
        If HF_ENGD_ID.Value = 0 Then
            HF_ENG_Flag.Value = 0
            RadDP_From.SelectedDate = DateTime.Now
        Else
            HF_ENG_Flag.value = 1
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
                                    Case 139
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_11_R.Value = 1 'Admin R
                                        End If
                                    Case 149
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_11_RW.Value = 1 'Admin RW
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
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "Admin - Engineer Detail - Add/Edit"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            Setup_Engineer_Combo()
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.ENGINEER_DETAILS_SELECT_RW_SP(HF_ENGD_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            RadCB_Engineer.SelectedValue = drvSql("ENGD_ENG_ID").ToString()
            RadNumTxt_Rate.Text = drvSql("ENGD_Rate").ToString()
            RadNumTxt_Off_Peak_Rate.Text = drvSql("ENGD_Off_Peak_Rate").ToString()
            RadNumTxt_Mileage_Rate.Text = drvSql("ENGD_Mileage_Rate").ToString()
            RadDP_From.SelectedDate = drvSql("ENGD_Date_From").ToString()
            If drvSql("ENGD_Date_To").ToString() = "" Then

            Else
                RadDP_To.SelectedDate = drvSql("ENGD_Date_To").ToString()
            End If
            HF_Current.Value = drvSql("ENGD_Current").ToString()
            RadCB_Status.SelectedValue = drvSql("ENGD_Status").ToString()
            ShowHide()
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Engineer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers(RadCB_Engineer, False, HF_ENG_Flag.Value)
    End Sub
#End Region
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveEngineerDetail(Me.HF_ENGD_ID.Value _
                        , RadCB_Engineer.SelectedValue _
                        , RadNumTxt_Rate.Text _
                        , RadNumTxt_Off_Peak_Rate.Text _
                        , RadNumTxt_Mileage_Rate.Text _
                        , If(IsNothing(RadDP_From.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_From.SelectedDate) _
                        , If(IsNothing(RadDP_To.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_To.SelectedDate) _
                        , HF_Current.Value _
                        , RadCB_Status.Text _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("ENGD_ID") = Me.HF_ENGD_ID.Value
    End Sub
    Protected Sub RadCB_Engineer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Engineer.SelectedIndexChanged
        ShowHide()
    End Sub
    Protected Sub RadNumTxt_Rate_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Rate.TextChanged
        ShowHide()
    End Sub
    Protected Sub RadNumTxt_Off_Peak_Rate_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Off_Peak_Rate.TextChanged
        ShowHide()
    End Sub
    Protected Sub RadNumTxt_Mileage_Rate_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Mileage_Rate.TextChanged
        ShowHide()
    End Sub
    Protected Sub RadDP_From_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_From.SelectedDateChanged
        ShowHide()
    End Sub
    Protected Sub RadDP_To_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_To.SelectedDateChanged
        ShowHide()
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        ShowHide()
    End Sub
    Sub ShowHide()
        If RadCB_Status.SelectedValue = "Archive" Then
            HF_Current.Value = 0
            lbl_To.Visible = True
            RadDP_To.Visible = True
            If RadDP_To.IsEmpty Then
                Me.Btn_Save.Visible = False
            Else
                CheckSave()
            End If
        Else
            lbl_To.Visible = False
            RadDP_To.Visible = False
        End If
        If RadCB_Status.SelectedValue = "Active" Then
            HF_Current.Value = 1
            lbl_To.Visible = False
            RadDP_To.Visible = False
            CheckSave()
        End If
    End Sub
    Sub CheckSave()
        If RadCB_Engineer.SelectedValue = Nothing Or RadNumTxt_Rate.Text = "" Or RadNumTxt_Off_Peak_Rate.Text = "" Or RadNumTxt_Mileage_Rate.Text = "" Or RadDP_From.IsEmpty Then
            Me.Btn_Save.Visible = False
        Else
            Me.Btn_Save.Visible = True
        End If
        Apply_Permissions()
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_11_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_11_RW.Value = 1 Then
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