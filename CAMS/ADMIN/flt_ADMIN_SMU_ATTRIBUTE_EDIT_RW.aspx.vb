Imports System.Data
Imports System.Data.SqlClient
Partial Class ADMIN_flt_ADMIN_SMU_ATTRIBUTE_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lbl_Table.Text = Request.QueryString("ATT_TABLE")
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
            Case "SMU_Trigger_Code"
                lbl_Table_English.Text = "SMU Job Code"
            Case "SMU_Trigger_Task_Code_Header"
                lbl_Table_English.Text = "Component Code"
            Case "INCIDENT_CODES"
                lbl_Table_English.Text = "Incident Code"
            Case "Production_Idle_Codes"
                lbl_Table_English.Text = "Production Idle Code"
            Case "Production_Tonnage_Below_Target_Reasons"
                lbl_Table_English.Text = "Production Tonnage Below Target Reason"
            Case "COMPONENT_CHANGEOUT_Reasons"
                lbl_Table_English.Text = "Component Changeout Planner Reason Code"
            Case "REPAIR_Codes"
                lbl_Table_English.Text = "Component Changeout Planner Repair Code"
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
            HF_PageName.Value = "Admin - SMU - Edit Attribute"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            Setup_TriggerCode_Combo()
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.ADMIN_SMU_RG_ATTRIBUTES_SELECT_RW_SP(HF_ATT_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadTxt_Name.Text = drvSql("ATT_Name").ToString()
            Me.RadTxt_Description.Text = drvSql("ATT_Description").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("ATT_Status").ToString()
            Me.RadCB_Level.SelectedValue = drvSql("ATT_FLAG").ToString()
            Me.lbl_Level_Value.Text = drvSql("ATT_FLAG").ToString()
            Me.lbl_Lookup_ID.Text = drvSql("ATT_LOOKUP_ID_Comp_Code").ToString()
            If Me.lbl_Table.Text = "SMU_Trigger_Code" Then
                Me.lbl_Lookup.Visible = True
                Me.lbl_Lookup.Text = "SMU Task Code Type:"
                Me.RadCB_TriggerCode.Visible = True
                Me.RadCB_TriggerCode.SelectedValue = drvSql("ATT_LOOKUP_ID_Trigger_Code").ToString()
            End If
            If Me.lbl_Table.Text = "INCIDENT_CODES" Then
                Me.lbl_Lookup.Visible = False
                Me.lbl_Lookup.Text = "Incident Code:"
                Me.RadCB_TriggerCode.Visible = False
            End If
            If Me.lbl_Table.Text = "Production_Idle_Codes" Then
                Me.lbl_Lookup.Visible = False
                Me.lbl_Lookup.Text = "Production Idle Code:"
                Me.RadCB_TriggerCode.Visible = False
            End If
            If Me.lbl_Table.Text = "Production_Tonnage_Below_Target_Reasons" Then
                Me.lbl_Lookup.Visible = False
                Me.lbl_Lookup.Text = "Production Tonnage Below Target Reason:"
                Me.RadCB_TriggerCode.Visible = False
            End If
            If Me.lbl_Table.Text = "COMPONENT_CHANGEOUT_Reasons" Then
                Me.lbl_Lookup.Visible = False
                Me.lbl_Lookup.Text = "Reason Code:"
                Me.RadCB_TriggerCode.Visible = False
            End If
            If Me.lbl_Table.Text = "REPAIR_Codes" Then
                Me.lbl_Lookup.Visible = False
                Me.lbl_Lookup.Text = "Repair Code:"
                Me.RadCB_TriggerCode.Visible = False
            End If
            If Me.lbl_Table.Text = "SMU_Trigger_Task_Code_Header" Then
                Me.lbl_Name.Visible = True
                Me.lbl_Desc.Visible = True
                Me.lbl_Level.Visible = True
                Me.RadCB_Level.Visible = True
                Me.lbl_Level_Value.Visible = True
                Me.lbl_Lookup_ID.Visible = True
                Me.lbl_Level1.Visible = True
                Me.RadCB_Level1.Visible = True
                If lbl_Level_Value.Text = "1" Then
                    Setup_Level1_Combo()
                    Me.RadCB_Level1.SelectedValue = drvSql("ATT_ID").ToString()
                ElseIf lbl_Level_Value.Text = "2" Then
                    Me.lbl_Level2.Visible = True
                    Me.RadCB_Level2.Visible = True
                    Setup_Level1_Combo()
                    Me.RadCB_Level1.SelectedValue = drvSql("ATT_LOOKUP_ID_Comp_Code").ToString()
                    Setup_Level2_Combo()
                    Me.RadCB_Level2.SelectedValue = drvSql("ATT_ID").ToString()
                ElseIf lbl_Level_Value.Text = "3" Then
                    Me.lbl_Level2.Visible = True
                    Me.RadCB_Level2.Visible = True
                    Me.lbl_Level3.Visible = True
                    Me.RadCB_Level3.Visible = True
                    Setup_Level1_Combo()
                    Me.RadCB_Level1.SelectedValue = drvSql("ATT_L1_ID").ToString()
                    Setup_Level2_Combo()
                    Me.RadCB_Level2.SelectedValue = drvSql("ATT_LOOKUP_ID_Comp_Code").ToString()
                    Setup_Level3_Combo()
                    Me.RadCB_Level3.SelectedValue = drvSql("ATT_ID").ToString()
                End If
            End If
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_TriggerCode_Combo()
        Dim Setup As New Setup.Combo
        RadCB_TriggerCode = Setup.Populate_AttributeDropdown(RadCB_TriggerCode, False, "SMU_Trigger_Task_Type")
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
#End Region
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveAttributesSMU(Me.HF_ATT_ID.Value _
                        , RadTxt_Name.Text _
                        , RadTxt_Description.Text _
                        , lbl_Level_Value.Text _
                        , RadCB_Status.Text _
                        , lbl_Lookup_ID.Text _
                        , RadCB_TriggerCode.SelectedValue _
                        , lbl_Table.Text _
                        , HF_Username.Value _
                        , HF_Username.Value)


        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
    End Sub
    Protected Sub RadCB_Level_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level.SelectedIndexChanged
        If RadCB_Level.SelectedValue = "1" Then
            Me.lbl_Level1.Visible = True
            Me.RadCB_Level1.Visible = True
            Me.lbl_Level2.Visible = False
            Me.RadCB_Level2.Visible = False
            Me.lbl_Level3.Visible = False
            Me.RadCB_Level3.Visible = False
            Setup_Level1_Combo()
            Me.RadCB_Level1.ClearSelection()
            Me.lbl_Level_Value.Text = Me.RadCB_Level.SelectedValue
            Me.lbl_Lookup_ID.Text = "0"
        ElseIf RadCB_Level.SelectedValue = "2" Then
            Me.lbl_Level1.Visible = True
            Me.RadCB_Level1.Visible = True
            Me.lbl_Level2.Visible = True
            Me.RadCB_Level2.Visible = True
            Me.lbl_Level3.Visible = False
            Me.RadCB_Level3.Visible = False
            Setup_Level2_Combo()
            Me.RadCB_Level2.ClearSelection()
            Me.lbl_Level_Value.Text = Me.RadCB_Level.SelectedValue
            Me.lbl_Lookup_ID.Text = "0"
        ElseIf RadCB_Level.SelectedValue = "3" Then
            Me.lbl_Level1.Visible = True
            Me.RadCB_Level1.Visible = True
            Me.lbl_Level2.Visible = True
            Me.RadCB_Level2.Visible = True
            Me.lbl_Level3.Visible = True
            Me.RadCB_Level3.Visible = True
            Setup_Level3_Combo()
            Me.RadCB_Level3.ClearSelection()
            Me.lbl_Level_Value.Text = Me.RadCB_Level.SelectedValue
            Me.lbl_Lookup_ID.Text = "0"
        End If
    End Sub
    Protected Sub RadCB_Level1_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level1.SelectedIndexChanged
        Me.lbl_Lookup_ID.Text = "0"
        If RadCB_Level.SelectedValue = "2" Then
            Me.RadCB_Level2.ClearSelection()
            Setup_Level2_Combo()
        End If
        If RadCB_Level.SelectedValue = "3" Then
            Me.RadCB_Level2.ClearSelection()
            Setup_Level2_Combo()
            Me.RadCB_Level3.ClearSelection()
            Setup_Level3_Combo()
        End If
    End Sub
    Protected Sub RadCB_Level2_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level2.SelectedIndexChanged
        If RadCB_Level.SelectedValue = "2" Then
            If RadCB_Level1.SelectedValue = "2661" Then
                Me.lbl_Lookup_ID.Text = "0"
            Else
                Me.lbl_Lookup_ID.Text = RadCB_Level1.SelectedValue
            End If
        Else
        End If
        If RadCB_Level.SelectedValue = "3" Then
            If RadCB_Level2.SelectedValue = "2662" Then
                Me.lbl_Lookup_ID.Text = "0"
            Else
                Me.lbl_Lookup_ID.Text = RadCB_Level2.SelectedValue
            End If
        End If
        Me.RadCB_Level3.ClearSelection()
    End Sub
    Protected Sub RadCB_Level3_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level3.SelectedIndexChanged
        If RadCB_Level.SelectedValue = "3" Then
            If RadCB_Level1.SelectedValue = "2661" Then
                Me.lbl_Lookup_ID.Text = "0"
            Else
                Me.lbl_Lookup_ID.Text = RadCB_Level1.SelectedValue
            End If
            If RadCB_Level2.SelectedValue = "2662" Then
                Me.lbl_Lookup_ID.Text = "0"
            Else
                Me.lbl_Lookup_ID.Text = RadCB_Level2.SelectedValue
            End If
        Else
        End If
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