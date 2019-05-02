Imports System.Data
Imports System.Data.SqlClient
Partial Class ADMIN_flt_ADMIN_ASSET_ATTRIBUTE_EDIT_RW
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
            Case "ASSET_Secondary"
                lbl_Table_English.Text = "Secondary Group"
                Me.lbl_Lookup.Visible = True
                Me.lbl_Lookup.Text = "Primary Group:"
                Me.RadCB_SecondaryGroup.Visible = True
            Case "ASSET_Model"
                lbl_Table_English.Text = "Model Code"
                Me.lbl_Lookup.Visible = True
                Me.lbl_Lookup.Text = "Secondary Group:"
                Me.RadCB_Model.Visible = True
            Case "ASSET_Primary"
                lbl_Table_English.Text = "Primary Group"
            Case "ASSET_Company"
                lbl_Table_English.Text = "Company"
                Me.lbl_Flag.Visible = True
                Me.lbl_Flag.Text = "Section Name:"
                Me.RadTxt_Flag.Visible = True
            Case "ASSET_Hire_Company"
                lbl_Table_English.Text = "Hire Company"
            Case "ASSET_Category"
                lbl_Table_English.Text = "Category"
            Case "ASSET_Type"
                lbl_Table_English.Text = "Type"
            Case "PART_Secondary"
                lbl_Table_English.Text = "Part Type"
            Case "PART_Quality"
                lbl_Table_English.Text = "Part Quality"
                Me.lbl_Flag.Visible = True
                Me.lbl_Flag.Text = "Section Name:"
                Me.RadTxt_Flag.Visible = True
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
            HF_PageName.Value = "Admin - Asset - Edit Attribute"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            Setup_Secondary_Group_Combo()
            Setup_Model_Combo()
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.ADMIN_ASSET_RG_ATTRIBUTES_SELECT_RW_SP(HF_ATT_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadTxt_Name.Text = drvSql("ATT_Name").ToString()
            Me.RadTxt_Description.Text = drvSql("ATT_Description").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("ATT_Status").ToString()
            If Me.lbl_Table.Text = "ASSET_Secondary" Then
                Me.lbl_Lookup.Visible = True
                Me.lbl_Lookup.Text = "Primary Group:"
                Me.RadCB_SecondaryGroup.Visible = True
                Me.RadCB_Model.Visible = False
                Me.RadCB_SecondaryGroup.SelectedValue = drvSql("ATT_LOOKUP_ID_Secondary").ToString()
            End If
            If Me.lbl_Table.Text = "ASSET_Model" Then
                Me.lbl_Lookup.Visible = True
                Me.lbl_Lookup.Text = "Secondary Group:"
                Me.RadCB_SecondaryGroup.Visible = False
                Me.RadCB_Model.Visible = True
                Me.RadCB_Model.SelectedValue = drvSql("ATT_LOOKUP_ID_Model").ToString()
            End If
            If Me.lbl_Table.Text = "ASSET_Company" Then
                Me.lbl_Flag.Visible = True
                Me.lbl_Flag.Text = "Section Name:"
                Me.RadTxt_Flag.Visible = True
                Me.RadTxt_Flag.Text = drvSql("ATT_FLAG").ToString()
            End If
            If Me.lbl_Table.Text = "PART_Quality" Then
                Me.lbl_Flag.Visible = True
                Me.lbl_Flag.Text = "Section Name:"
                Me.RadTxt_Flag.Visible = True
                Me.RadTxt_Flag.Text = drvSql("ATT_FLAG").ToString()
            End If
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Secondary_Group_Combo()
        Dim Setup As New Setup.Combo
        RadCB_SecondaryGroup = Setup.Populate_AttributeDropdown(RadCB_SecondaryGroup, False, "ASSET_Primary")
    End Sub

    Private Sub Setup_Model_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Model = Setup.Populate_AttributeDropdown(RadCB_Model, False, "ASSET_Secondary")
    End Sub
#End Region
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveAttributesAssetParts(Me.HF_ATT_ID.Value _
                        , RadTxt_Name.Text _
                        , RadTxt_Description.Text _
                        , RadTxt_Flag.Text _
                        , RadCB_Status.Text _
                        , RadCB_SecondaryGroup.SelectedValue _
                        , RadCB_Model.SelectedValue _
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