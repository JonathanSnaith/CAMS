Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI

Partial Class ASSET_MANAGEMENT_flt_AM_PART_LIST_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_P_ID.Value = Request.QueryString("P_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Session("P_ID") = Me.HF_P_ID.Value
        Apply_Permissions()
        If Me.HF_P_ID.Value = 0 Then
            lblTitle.Text = "ADD PART"
            Me.Title = lblTitle.Text
        Else
            lblTitle.Text = "EDIT PART"
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
                                    Case 93
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_93.Value = 1 'Review Part Request/Disposal
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
        Dim ThisID As String = HF_P_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "AM - Part List - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            If HF_P_ID.Value = 0 Then
                Me.Btn_New.Visible = False
                Me.RadGrid_Attachments.Visible = False
                Me.lbl_History_Text.Visible = False
                Me.RadGrid_Part_History.Visible = False
                Setup_Level3_Combo()
                Setup_Model_Combo()
                Setup_Pos_Combo()
            Else
                GetData()
            End If


        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.AM_PART_LIST_RG_SELECT_RW_SP(HF_P_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadTxt_Part_ID.Text = drvSql("P_Part_ID").ToString()
            Setup_Model_Combo()
            Me.RadCB_Model.SelectedValue = drvSql("P_MOD_ID").ToString()
            Setup_Pos_Combo()
            Me.RadCB_Pos.SelectedValue = drvSql("P_POS_ID").ToString()
            Setup_Level3_Combo()
            Me.RadCB_Level3.SelectedValue = drvSql("P_Level_3").ToString()
            If HF_Status.Value = "" Then
                Me.HF_Status.value = drvSql("P_Status").ToString()
                If HF_Status.value = "Request Disposal" Or HF_Status.value = "Disposed" Then
                    Me.RadCB_Status.Visible = False
                    Me.RadCB_Status_Disposal_Request.Visible = True
                    Me.RadCB_Status_Disposal_Request.SelectedValue = drvSql("P_Status").ToString()
                Else
                    Me.RadCB_Status.Visible = True
                    Me.RadCB_Status.SelectedValue = drvSql("P_Status").ToString()
                    Me.RadCB_Status_Disposal_Request.Visible = False
                End If
            End If
            Me.RadTxt_Notes.Text = drvSql("P_Notes").ToString()
            Me.HF_Disposal_LOCK.Value = drvSql("P_Disposal_LOCK").ToString()
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Level3_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Level3 = Setup.Populate_CodeLevel3Only(RadCB_Level3)
    End Sub
    Private Sub Setup_Model_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Model = Setup.Populate_AttributeDropdown(RadCB_Model, False, "Asset_Model")
    End Sub
    Private Sub Setup_Pos_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Pos = Setup.Populate_AttributeDropdown(RadCB_Pos, False, "Defect_Position")
    End Sub
    Private Sub Setup_Position_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Position = Setup.Populate_AttributeDropdown(RadCB_Position, False, "Defect_Position")
    End Sub
    Private Sub Setup_Location_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Location = Setup.Populate_Location_Parts_RW(RadCB_Location, RadCB_LT.SelectedValue)
    End Sub
#End Region
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SavePart(HF_P_ID.Value _
                        , RadTxt_Part_ID.Text _
                        , RadCB_Model.SelectedValue _
                        , RadCB_Pos.SelectedValue _
                        , RadCB_Level3.SelectedValue _
                        , HF_Status.Value _
                        , RadTxt_Notes.Text _
                        , HF_Username.Value _
                        , HF_Username.Value _
                        , HF_Username.Value _
                        , HF_Username.Value)
        If HF_Status.Value = "Request Disposal" Then
            Me.SqlDS_RequestDisposalEmail.Select(DataSourceSelectArguments.Empty)
        Else
        End If
        If HF_Status.Value = "Disposed" Then
            Me.SqlDS_DisposedEmail.Select(DataSourceSelectArguments.Empty)
        Else
        End If
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("P_ID") = Me.HF_P_ID.Value
    End Sub
    Protected Sub Btn_Insert_Click(sender As Object, e As EventArgs) Handles Btn_Insert.Click
        Me.HF_Location_Type.Value = RadCB_LT.Text
        Me.HF_Location.Value = RadCB_Location.SelectedValue

        If Me.RadDP_Location_Date.SelectedDate Is Nothing Or RadCB_Location.SelectedValue = "" Or RadCB_Position.SelectedValue = "" Then
            Dim msgstrFailure As String = "Please ensure all data in this section is completed before proceeding"
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrFailure & "');", True)
        Else
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePartMovement(HF_P_ID.Value _
                        , HF_Location.Value _
                        , HF_Location_Type.Value _
                        , If(IsNothing(RadDP_Location_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Location_Date.SelectedDate) _
                        , RadCB_Position.SelectedValue _
                        , RadNumTxt_Expected_Days.Text _
                        , HF_Username.Value _
                        , HF_Username.Value)
            Me.RadGrid_Part_History.Rebind()
            Dim msgstrSuccess As String = "New movement added!"
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & msgstrSuccess & "');", True)
        End If
    End Sub
    Protected Sub RadCB_LT_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_LT.SelectedIndexChanged
        Me.RadCB_Location.Visible = True
        Setup_Location_Combo()
        Me.RadCB_Location.DataBind()
    End Sub
    Protected Sub RadCB_Location_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Location.SelectedIndexChanged
        Me.HF_Location_Type.Value = RadCB_LT.Text
        Me.HF_Location.Value = RadCB_Location.SelectedValue

        If RadCB_LT.SelectedValue = "Site" Or RadCB_LT.SelectedValue = "Company" Then
            If RadCB_Location.SelectedValue <> 28 Then
                If RadNumTxt_Expected_Days.Text = "0" Then
                    Me.Btn_Insert.Visible = False
                Else
                    Me.Btn_Insert.Visible = True
                End If
            Else
                Me.Btn_Insert.Visible = True
            End If
        End If
    End Sub
    Protected Sub RadDP_Location_Date_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_Location_Date.SelectedDateChanged
        Me.HF_Location_Type.Value = RadCB_LT.Text
        Me.HF_Location.Value = RadCB_Location.SelectedValue
    End Sub
    Protected Sub RadCB_Position_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Position.SelectedIndexChanged
        Me.HF_Location_Type.Value = RadCB_LT.Text
        Me.HF_Location.Value = RadCB_Location.SelectedValue
    End Sub
    Protected Sub RadNumTxt_Expected_Days_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Expected_Days.TextChanged
        Me.HF_Location_Type.Value = RadCB_LT.Text
        Me.HF_Location.Value = RadCB_Location.SelectedValue
        If RadCB_LT.SelectedValue = "Site" Or RadCB_LT.SelectedValue = "Company" Then
            If RadCB_Location.SelectedValue <> 28 Then
                If RadNumTxt_Expected_Days.Text = "0" Then
                    Me.Btn_Insert.Visible = False
                Else
                    Me.Btn_Insert.Visible = True
                End If
            Else
                Me.Btn_Insert.Visible = True
            End If
        End If
    End Sub
    Protected Sub Btn_New_Click(sender As Object, e As EventArgs) Handles Btn_New.Click
        Me.RadCB_LT.SelectedValue = "*Select"
        Setup_Position_Combo()
        Setup_Location_Combo()
        Me.RadCB_Location.ClearSelection()
        Me.RadDP_Location_Date.SelectedDate = Nothing
        Me.RadCB_Position.ClearSelection()
        Me.RadNumTxt_Expected_Days.Text = "0"
        Me.Tbl_NewMovement.Visible = True
        Me.Btn_Insert.Visible = True
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        HF_Status.Value = Me.RadCB_Status.SelectedValue
        If RadCB_Status.SelectedValue = "Request Disposal" Then
            Me.HF_Disposal_Requested_By.Value = Me.HF_Username.Value
        Else
            Me.HF_Disposal_Requested_By.Value = Nothing
        End If
    End Sub
    Protected Sub RadCB_Status_Disposal_Request_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status_Disposal_Request.SelectedIndexChanged
        HF_Status.Value = Me.RadCB_Status_Disposal_Request.SelectedValue
        If RadCB_Status_Disposal_Request.SelectedValue = "Disposed" And HF_Disposal_LOCK.Value = 0 Then
            Me.HF_Disposal_Approved_By.Value = Me.HF_Username.Value
        Else
            Me.HF_Disposal_Approved_By.Value = Nothing
        End If
    End Sub
    Private Sub RadGrid_Part_History_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid_Part_History.ItemDataBound
        For Each item As GridDataItem In RadGrid_Part_History.Items
            Dim myTotalCell3 As TableCell = item("PD_Actual_Days")
            Dim myTotalCell4 As TableCell = item("ExpectedDaysCalc")
            Dim myTotalCell5 As TableCell = item("PD_Location_Type")
            Dim myTotalCell6 As TableCell = item("Location")
            If InStr(myTotalCell3.Text, "&nbsp;") Then
            Else
                Dim ThisTotal3 As Double
                ThisTotal3 = myTotalCell3.Text
                Dim ThisTotal4 As Double
                ThisTotal4 = myTotalCell4.Text
                Dim ThisTotal5 As String
                ThisTotal5 = myTotalCell5.Text
                Dim ThisTotal6 As String
                ThisTotal6 = myTotalCell6.Text
                If (ThisTotal3 > ThisTotal4 And ThisTotal5 <> "Asset") And (ThisTotal3 > ThisTotal4 And ThisTotal6 <> "Thrislington Yard - Stock") Then
                    item("PD_Actual_Days").ForeColor = Drawing.Color.Red
                Else
                    item("PD_Actual_Days").ForeColor = Drawing.Color.White
                End If
            End If
        Next
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 3
                Me.Btn_Save.Visible = False
                Me.Btn_New.Visible = False
                RadGrid_Part_History.MasterTableView.GetColumnSafe("EditCommandColumn").Display = False
                If HF_Status.Value = "Request Disposal" Or HF_Status.Value = "Disposed" Then
                    If Me.HF_EXCEPTION_93.Value = 1 Then
                        Me.Btn_Save.Visible = True
                    Else
                        Me.Btn_Save.Visible = False
                    End If
                End If
            Case 4
                Me.Btn_Save.Visible = True
                Me.Btn_New.Visible = True
                RadGrid_Part_History.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
                If HF_Status.Value = "Request Disposal" Or HF_Status.Value = "Disposed" Then
                    If Me.HF_EXCEPTION_93.Value = 1 Then
                        Me.Btn_Save.Visible = True
                    Else
                        Me.Btn_Save.Visible = False
                    End If
                End If
            Case 5
                Me.Btn_Save.Visible = True
                Me.Btn_New.Visible = True
                RadGrid_Part_History.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
            Case Else
                Me.Btn_Save.Visible = False
                Me.Btn_New.Visible = False
                RadGrid_Part_History.MasterTableView.GetColumnSafe("EditCommandColumn").Display = False
        End Select
    End Sub
End Class