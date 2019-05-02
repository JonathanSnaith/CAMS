Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI

Partial Class DATA_INPUT_flt_DATA_INPUT_BRK_EDIT_RW
    Inherits System.Web.UI.Page
    Private Sub DATA_INPUT_BRAKE_flt_DATA_NPUT_BRK_EDIT_Init(sender As Object, e As EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_BRK_ID.Value = Request.QueryString("BRK_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Session("BRK_ID") = Me.HF_BRK_ID.Value
        Apply_Permissions()

        If Me.HF_BRK_ID.Value = 0 Then
            lblTitle.Text = "ADD BRAKE TEST"
            Me.Title = lblTitle.Text
        Else
            lblTitle.Text = "EDIT BRAKE TEST"
            Me.Title = lblTitle.Text
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
                                    Case 135
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_7_R.Value = 1 'Data Input - R
                                        End If
                                    Case 146
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_7_RW.Value = 1 'Data Input - RW
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
        Dim ThisID As String = HF_BRK_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "Data Input - Brake Test - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            If HF_BRK_ID.Value = 0 Then
            Else
                GetData()
            End If
            Setup_Customer_Combo()
            Setup_Engineers_Combo()
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.DATA_INPUT_RG_BrakeTest_RW_SP(HF_BRK_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadDP_Date.SelectedDate = DateTime.Parse(drvSql("BRK_Date")).ToString("dd MMM yyyy")
            RadCB_Customer.SelectedValue = drvSql("BRK_CUS_ID").ToString()
            Setup_Site_Combo()
            Me.RadCB_Site.SelectedValue = drvSql("BRK_SITE_ID").ToString()
            Setup_Asset_Combo()
            RadCB_Asset.SelectedValue = drvSql("BRK_A_ID").ToString()
            Setup_Engineers_Combo()
            Me.RadCB_Engineer.SelectedValue = drvSql("BRK_Engineer_ID").ToString()
            txtSMU.Text = drvSql("BRK_SMU").ToString()
            txtValue.Text = drvSql("BRK_Value").ToString()
            Img_Photo_Link.ImageUrl = drvSql("BRK_Photo_Link").ToString()
            txtRetestValue.Text = drvSql("BRK_Retest_Value").ToString()
            Img_Retest_Photo_Link.ImageUrl = drvSql("BRK_Retest_Photo_Link").ToString()
            RadCB_Ground_Condition.SelectedValue = drvSql("BRK_Ground_Condition").ToString()
            RadCB_Status.SelectedValue = drvSql("BRK_Status").ToString()
            txtNotes.Text = drvSql("BRK_Notes").ToString()
            RadCB_Handbrake.SelectedValue = drvSql("BRK_HandBrake").ToString()
            Img_Handbrake_Photo_Link.ImageUrl = drvSql("BRK_HandBrake_Photo_Link").ToString()
            RadCB_Handbrake_Retest.SelectedValue = drvSql("BRK_HandBrake_Retest").ToString()
            Img_Handbrake_Retest_Photo_Link.ImageUrl = drvSql("BRK_HandBrake_Retest_Photo_Link").ToString()
            Img_Signature_Link.ImageUrl = drvSql("BRK_Signature_Link").ToString()
            lbl_Created_By.Text = drvSql("BRK_Created_By").ToString()
            Me.HF_BRK_ID.Value = drvSql("BRK_ID").ToString()
            GetAssetDetails()
            If HF_CAT_ID.Value = 254 Then HF_MOD_ID.Value = "%"
            GetRatio()
            If HF_Ratio.Value = "" Then HF_Ratio.Value = "30"
            If txtValue.Text < HF_Ratio.Value Then
                Table_ReTest.Visible = True
                lbl_Brake.Text = "Fail"
                lbl_Brake.ForeColor = Drawing.Color.Red
            Else
                lbl_Brake.Text = "Pass"
                lbl_Brake.ForeColor = Drawing.Color.ForestGreen
                lbl_Brake_Retest.Visible = False
                If RadCB_Handbrake.SelectedValue = 2 Then
                    Table_ReTest.Visible = True
                Else
                    Table_ReTest.Visible = False
                End If
            End If
            If txtRetestValue.Text < HF_Ratio.Value Then
                lbl_Brake_Retest.Text = "Fail"
                lbl_Brake_Retest.ForeColor = Drawing.Color.Red
            Else
                lbl_Brake_Retest.Text = "Pass"
                lbl_Brake_Retest.ForeColor = Drawing.Color.ForestGreen
            End If
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames(RadCB_Customer, False)
    End Sub
    Private Sub Setup_Site_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Site = Setup.Populate_SiteNames(RadCB_Site, RadCB_Customer.SelectedValue, False)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames(RadCB_Asset, RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue)
    End Sub
    Private Sub Setup_Engineers_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers(RadCB_Engineer, False, HF_BRK_ID.Value)
    End Sub
#End Region
    Sub GetAssetDetails()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetStufffromAsset(RadCB_Asset.SelectedValue)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_CAT_ID.Value = drvSql("A_CAT_ID").ToString()
            Me.HF_MOD_ID.Value = drvSql("A_MOD_ID").ToString()
        End If
    End Sub
    Sub GetRatio()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetBRKRatioFromDetails(HF_CAT_ID.Value, HF_MOD_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_Ratio.Value = drvSql("Ratio").ToString()
        End If
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        RadCB_Site.ClearSelection()
        Setup_Site_Combo()
        RadCB_Asset.ClearSelection()
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        RadCB_Asset.ClearSelection()
        Setup_Asset_Combo()
    End Sub
    Protected Sub btn_Save_Click(sender As Object, e As EventArgs) Handles btn_Save.Click
        SaveRecord()
    End Sub
    Private Sub SaveRecord()
        If txtNotes.Text = "" Then txtNotes.Text = "0"
        If txtValue.Text = "" Then txtValue.Text = "0"
        If txtRetestValue.Text = "" Then txtRetestValue.Text = "0"
        If txtSMU.Text = "" Then txtSMU.Text = "0"

        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveBrakeTest(Me.HF_BRK_ID.Value _
                        , RadCB_Customer.SelectedValue _
                        , RadCB_Site.SelectedValue _
                        , RadCB_Asset.SelectedValue _
                        , RadCB_Engineer.SelectedValue _
                        , If(IsNothing(RadDP_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Date.SelectedDate) _
                        , RadCB_Ground_Condition.SelectedValue _
                        , txtSMU.Text _
                        , txtValue.Text _
                        , txtRetestValue.Text _
                        , RadCB_Handbrake.SelectedValue _
                        , RadCB_Handbrake_Retest.SelectedValue _
                        , txtNotes.Text _
                        , RadCB_Status.SelectedValue _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("BRK_ID") = Me.HF_BRK_ID.Value
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_7_RW.Value = 1 Then
                    Me.btn_Save.Visible = True
                Else
                    Me.btn_Save.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_7_RW.Value = 1 Then
                    Me.btn_Save.Visible = True
                Else
                    Me.btn_Save.Visible = False
                End If
            Case 4
                Me.btn_Save.Visible = True
            Case 5
                Me.btn_Save.Visible = True
            Case Else
                Me.btn_Save.Visible = False
        End Select
    End Sub
    Protected Sub txtValue_TextChanged(sender As Object, e As EventArgs) Handles txtValue.TextChanged
        HF_ThisCount.Value = 0
        If txtValue.Text < HF_Ratio.Value Then
            lbl_Brake.Text = "Fail"
            lbl_Brake.ForeColor = Drawing.Color.Red
            RadWindowManager1.RadConfirm("The data you have entered indicates the Asset has failed its brake test. Are you sure this data is correct as per the Testers figures?", "confirmCallBackFn", 400, 200, Nothing, "Brake Test Failure", "myConfirmImage.png")
            Table_ReTest.Visible = True
        Else
            lbl_Brake.Text = "Pass"
            lbl_Brake.ForeColor = Drawing.Color.ForestGreen
            lbl_Brake_Retest.Visible = False
            Table_ReTest.Visible = False
        End If
    End Sub
    Protected Sub txtRetestValue_TextChanged(sender As Object, e As EventArgs) Handles txtRetestValue.TextChanged
        HF_ThisCount.Value = 0
        If txtRetestValue.Text < HF_Ratio.Value Then
            lbl_Brake_Retest.Text = "Fail"
            lbl_Brake_Retest.ForeColor = Drawing.Color.Red
            RadWindowManager1.RadConfirm("The data you have entered indicates the Asset has failed its brake test for the second time. Are you sure this data is correct as per the Testers figures?", "confirmCallBackFn", 400, 200, Nothing, "Brake Test Failure", "myConfirmImage.png")
        Else
            lbl_Brake_Retest.Text = "Pass"
            lbl_Brake_Retest.ForeColor = Drawing.Color.ForestGreen
        End If
    End Sub
    Protected Sub HiddenButton_Click(sender As Object, e As System.EventArgs) Handles HiddenButton.Click
        If HF_ThisCount.Value <> 1 Then
            Me.SqlDS_BrakeTestFailureEmail.Select(DataSourceSelectArguments.Empty)
            HF_ThisCount.Value = 1
        End If
    End Sub
    Protected Sub RadCB_Handbrake_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Handbrake.SelectedIndexChanged
        HF_ThisCount2.Value = 0
        If RadCB_Handbrake.SelectedValue = 2 Then
            RadWindowManager1.RadConfirm("The data you have entered indicates the Asset has failed its handbrake test. Are you sure this data is correct as per the Testers information?", "confirmCallBackFnHB", 400, 200, Nothing, "handbrake Test Failure", "myConfirmImage.png")
            Table_ReTest.Visible = True
        Else
            Table_ReTest.Visible = False
        End If
    End Sub
    Protected Sub RadCB_Handbrake_Retest_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Handbrake_Retest.SelectedIndexChanged
        HF_ThisCount2.Value = 0
        If RadCB_Handbrake_Retest.SelectedValue = 2 Then
            RadWindowManager1.RadConfirm("The data you have entered indicates the Asset has failed its handbrake test for the second time. Are you sure this data is correct as per the Testers information?", "confirmCallBackFnHB", 400, 200, Nothing, "handbrake Test Failure", "myConfirmImage.png")
        Else
        End If
    End Sub
    Protected Sub HiddenButton2_Click(sender As Object, e As System.EventArgs) Handles HiddenButton2.Click
        If HF_ThisCount2.Value <> 2 Then
            Me.SqlDS_HandBrakeTestFailureEmail.Select(DataSourceSelectArguments.Empty)
            HF_ThisCount2.Value = 2
        End If
    End Sub


End Class
