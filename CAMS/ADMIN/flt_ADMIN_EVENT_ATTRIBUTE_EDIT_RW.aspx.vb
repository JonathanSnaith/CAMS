Imports System.Data
Imports System.Data.SqlClient
Partial Class ADMIN_flt_ADMIN_EVENT_ATTRIBUTE_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lbl_Table.Text = Request.QueryString("ATT_TABLE")
        Me.HF_ATT_ID.Value = Request.QueryString("ATT_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Select Case lbl_Table.Text
            Case "EVENT_Type"
                lbl_Table_English.Text = "Event Type"
            Case "EVENT_Task_Status"
                lbl_Table_English.Text = "Event Task Status"
            Case "JOB_Type"
                lbl_Table_English.Text = "Job Type"
            Case "DEFECT_Type"
                lbl_Table_English.Text = "Defect Type"
            Case "DEFECT_Issue"
                lbl_Table_English.Text = "Defect Issue"
            Case "DEFECT_Position"
                lbl_Table_English.Text = "Defect Position"
        End Select
        GetData()
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
            HF_PageName.Value = "Admin - Events - Edit Attribute"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            Setup_Defect_Type_Combo()
            Setup_Job_Type_Combo()
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.ADMIN_EVENT_RG_ATTRIBUTES_SELECT_RW_SP(HF_ATT_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadTxt_Name.Text = drvSql("ATT_Name").ToString()
            Me.RadTxt_Description.Text = drvSql("ATT_Description").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("ATT_Status").ToString()
            If Me.lbl_Table.Text = "JOB_Type" Then
                Me.lbl_Lookup.Visible = True
                Me.lbl_Lookup.Text = "Cost Code:"
                Me.RadCB_JT.Visible = True
                Me.RadCB_JT.SelectedValue = drvSql("ATT_LOOKUP_ID_JT").ToString()
                Me.lbl_Flag.Visible = True
                Me.lbl_Flag.Text = "Requires SMU"
                Me.RadCB_Flag.Visible = True
                Me.RadCB_Flag.SelectedValue = drvSql("ATT_FLAG").ToString()
            End If
            If Me.lbl_Table.Text = "EVENT_Type" Then
                Me.lbl_Flag.Visible = True
                Me.lbl_Flag.Text = "Requires SMU"
                Me.RadCB_Flag.Visible = True
                Me.RadCB_Flag.SelectedValue = drvSql("ATT_FLAG").ToString()
            End If
            If Me.lbl_Table.Text = "DEFECT_Type" Then
                Me.lbl_Lookup.Visible = True
                Me.lbl_Lookup.Text = "Change Out Group:"
                Me.RadCB_DT.Visible = True
                Me.RadCB_DT.SelectedValue = drvSql("ATT_LOOKUP_ID_DT").ToString()
            End If
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Defect_Type_Combo()
        Dim Setup As New Setup.Combo
        RadCB_DT = Setup.Populate_AttributeDropdown(RadCB_DT, False, "Change_Out_Group")
    End Sub

    Private Sub Setup_Job_Type_Combo()
        Dim Setup As New Setup.Combo
        RadCB_JT = Setup.Populate_AttributeDropdown(RadCB_JT, False, "Cost_Code")
    End Sub
#End Region
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveAttributesEvents(Me.HF_ATT_ID.Value _
                        , RadTxt_Name.Text _
                        , RadTxt_Description.Text _
                        , RadCB_Flag.SelectedValue _
                        , RadCB_Status.Text _
                        , RadCB_DT.SelectedValue _
                        , RadCB_JT.SelectedValue _
                        , lbl_Table.Text _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
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