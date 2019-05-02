Imports System.Data
Imports System.Data.SqlClient
Partial Class AM_PART_LIST_EDIT_REQUEST_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_PR_ID.Value = Request.QueryString("PR_ID")
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
        Session("PR_ID") = Me.HF_PR_ID.Value
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
            HF_PageName.Value = "Asset Management - Edit Part Request"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            If HF_PR_ID.Value = 0 Then
                RadTxt_Rejection_Notes.Visible = False
                lbl_Rejection_Notes_Text.Visible = False
                RadCB_Asset.Visible = True
                RadCB_Component.Visible = True
                RadCB_Customer.Visible = True
                RadTxt_Reason.Visible = True
                lbl_Asset.Visible = False
                lbl_Customer.Visible = False
                lbl_Level3.Visible = False
                lbl_Reason.Visible = False
                Setup_Level3_Combo()
                Setup_Customer_Combo()
            Else
                RadCB_Asset.Visible = False
                RadCB_Component.Visible = False
                RadCB_Customer.Visible = False
                RadTxt_Reason.Visible = False
                lbl_Asset.Visible = True
                lbl_Customer.Visible = True
                lbl_Level3.Visible = True
                lbl_Reason.Visible = True
                GetData()
            End If
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.AM_PART_LIST_RG_REQUEST_SELECT_RW_SP(HF_PR_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_A_ID.Value = drvSql("PR_A_ID").ToString()
            Me.lbl_Asset.Text = drvSql("Asset").ToString()
            Me.HF_MOD_ID.Value = drvSql("PR_MOD_ID").ToString()
            Me.lbl_Model.Text = drvSql("Model").ToString()
            Me.HF_Code_Level_3.Value = drvSql("PR_Code_Level_3").ToString()
            Me.lbl_Level3.Text = drvSql("Level3").ToString()
            Me.HF_Stock.Value = drvSql("PR_Stock").ToString()
            Me.lbl_Stock.Text = drvSql("Stock").ToString()
            Me.lbl_Reason.Text = drvSql("PR_Reason").ToString()
            If RadCB_Status.SelectedValue = "Rejected" Then
                Me.lbl_Rejection_Notes_Text.Visible = True
                Me.RadTxt_Rejection_Notes.Visible = True
            Else
                Me.lbl_Rejection_Notes_Text.Visible = False
                Me.RadTxt_Rejection_Notes.Visible = False
            End If
            Me.RadTxt_Rejection_Notes.Text = drvSql("PR_Rejection_Notes").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("PR_Status").ToString()
            Me.HF_Created_By.Value = drvSql("PR_Created_By").ToString()
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Level3_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Component = Setup.Populate_CodeLevel3Only(RadCB_Component)
    End Sub
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames(RadCB_Customer, False)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames(RadCB_Asset, RadCB_Customer.SelectedValue, -1)
    End Sub
#End Region
    Sub SaveProcess()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SavePartRequest(HF_PR_ID.Value _
                        , HF_A_ID.Value _
                        , HF_MOD_ID.Value _
                        , HF_Code_Level_3.Value _
                        , HF_Status.Value _
                        , RadTxt_Reason.Text _
                        , RadCB_Status.SelectedValue _
                        , RadTxt_Rejection_Notes.Text _
                        , HF_Username.Value _
                        , HF_Username.Value)
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Select Case RadCB_Status.SelectedValue
            Case "Open"
                SaveProcess()
                Me.SqlDS_Email.Select(DataSourceSelectArguments.Empty)
            Case "Approved"
                SaveProcess()
                Me.SqlDS_Approved.Select(DataSourceSelectArguments.Empty)
            Case "Rejected"
                SaveProcess()
                Me.SqlDS_Rejected.Select(DataSourceSelectArguments.Empty)
            Case Else
                SaveProcess()
        End Select
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Setup_Asset_Combo()
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Me.HF_A_ID.Value = RadCB_Asset.SelectedValue
        GetModel()
    End Sub
    Sub GetModel()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetModelfromAsset(HF_A_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_MOD_ID.Value = drvSql("A_MOD_ID").ToString()
        End If
    End Sub
    Protected Sub RadCB_Component_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Component.SelectedIndexChanged
        Me.HF_Code_Level_3.Value = RadCB_Component.SelectedValue
        If RadCB_Component.SelectedValue <> Nothing Then
            Me.Btn_Save.Visible = True
        Else
            Me.Btn_Save.Visible = False
        End If
        Dim dvSql As DataView = DirectCast(SqlDS_StockCheck.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.HF_Status.Value = drvSql("Status").ToString()
        Next
        If HF_Status.Value = 1 Then
            Me.lbl_StatusText.Visible = True
            Me.lbl_Stock.Visible = True
            Me.lbl_Stock.Text = "The part requested IS in stock. Click 'Submit' to send a message to the Plant Director to review this request."
        Else
            Me.lbl_StatusText.Visible = True
            Me.lbl_Stock.Visible = True
            Me.lbl_Stock.Text = "The part requested is NOT in stock. Click 'Submit' to send a message to the Plant Director to review this request."
        End If
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        If RadCB_Status.SelectedValue = "Rejected" Then
            Me.lbl_Rejection_Notes_Text.Visible = True
            Me.RadTxt_Rejection_Notes.Visible = True
        Else
            Me.lbl_Rejection_Notes_Text.Visible = False
            Me.RadTxt_Rejection_Notes.Visible = False
        End If
    End Sub
End Class