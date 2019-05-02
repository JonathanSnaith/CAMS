Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class EVENT_MANAGEMENT_flt_EM_FT_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_FT_ID.Value = Request.QueryString("FT_ID")
        Me.lbl_Event.Text = Request.QueryString("E_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Session("J_E_ID") = lbl_Event.Text
        Session("FT_ID") = HF_FT_ID.Value
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        GetData()
        GetFTDAll(HF_J_ID.Value)
        GetInfo()
        Session("J_ID") = lbl_Job.Text
        Apply_Permissions()
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
        Dim ThisID As String = HF_FT_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "EM - Timesheets - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
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
                        Case "Refresh_Grid"
                            Dim valuepassed As String = eventArgument
                            Me.RadGrid1.Rebind()
                            WhichRowSelectedFT()
                            SelectCorrectRecordFT()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub WhichRowSelectedFT()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid1.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("FTD_ID").Text)
            count = count + 1
            If item.Selected Then
                HF_PageFTD.Value = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecordFT()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid1.Items
            Dim FTIDCell As TableCell = item("FTD_ID")
            Dim FTID = FTIDCell.Text
            count = count + 1
            If Session("FTD_ID") = "null" Then Session("FTD_ID") = "0"

            If Session("FTD_ID") = FTID Then
                item.Selected = True
            End If
        Next
    End Sub
    Sub GetInfo()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetEventJobInfoFromJob(lbl_Job.Text)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lbl_Event.Text = drvSql("J_E_ID").ToString()
            Me.HF_ET_ID.value = drvSql("E_ET_ID").ToString()
            Me.lbl_JT.Text = drvSql("JobType").ToString()
            If IsDBNull(drvSql("E_Planned_Start_Date")) = False Then
                Me.lbl_Date_Start.Text = DateTime.Parse(drvSql("E_Planned_Start_Date")).ToString("dd/MM/yyyy HH:mm")
            End If
            If HF_ET_ID.Value = 621 And IsDBNull(drvSql("E_Planned_Start_Date")) = False Then
                Me.lbl_Date_Start.Text = DateTime.Parse(drvSql("E_Date_Started")).ToString("dd/MM/yyyy HH:mm")
            End If
            If IsDBNull(drvSql("E_Date_Ended")) = False Then
                Me.lbl_Date_End.Text = DateTime.Parse(drvSql("E_Date_Ended")).ToString("dd/MM/yyyy HH:mm")
            End If
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.EM_FT_RG_SELECT_RW_SP(HF_FT_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lbl_Job.Text = drvSql("FT_J_ID").ToString()
            Me.HF_J_ID.value = drvSql("FT_J_ID").ToString()
            Dim IsFitter As String
            IsFitter = drvSql("Event_Manager").ToString()
            If IsFitter <> "" Then
                Me.lbl_Fitter.Visible = True
                Me.lbl_Fitter_Text.Visible = True
                Me.lbl_Fitter.Text = drvSql("PER_Fullname").ToString()
            End If
            Me.RadCB_Status.SelectedValue = drvSql("FT_Status").ToString()
            Me.RadTxt_Notes.Text = drvSql("FT_Notes").ToString()
            Me.RadTxt_Issues_Notes.Text = drvSql("FT_Issues_Notes").ToString()
            Me.RadTxt_Tests_Notes.Text = drvSql("FT_Tests_Notes").ToString()
        End If
    End Sub

#Region "Internal Methods"
    Private Sub GetFTDAll(ByVal J_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetFTDAll(J_ID)
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadGrid1.DataSource = dtMain1
        RadGrid1.DataBind()
    End Sub
#End Region
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveFT(Me.HF_FT_ID.Value _
                        , lbl_Job.Text _
                        , RadCB_Status.SelectedValue _
                        , RadTxt_Notes.Text _
                        , RadTxt_Issues_Notes.Text _
                        , RadTxt_Tests_Notes.Text _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("J_E_ID") = lbl_Event.Text
        Session("J_ID") = lbl_Job.Text
        Session("FT_ID") = HF_FT_ID.Value
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_6_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_6_RW.Value = 1 Then
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