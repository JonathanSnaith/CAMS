Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class EVENT_MANAGEMENT_flt_EM_EVENTS_ITEMS_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_EI_ID.Value = Request.QueryString("EI_ID")
        Me.HF_E_ID.Value = Request.QueryString("E_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Session("EI_ID") = HF_EI_ID.Value
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        GetData()
        If HF_EI_ID.Value = 0 Then
            RadNumTxt_Qty.Text = "1"
            RadNumTxt_Rate.Text = "1"
            RadNumTxt_Markup.Text = "0"
            ShowHideSave()
            Setup_Level3_Combo()
            Me.RadCB_Level3.SelectedValue = 2663
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
        Dim ThisID As String = HF_EI_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "EM - Events Item - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.EM_EVENTS_ITEMS_RG_SELECT_RW_SP(HF_EI_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_E_ID.Value = drvSql("EI_E_ID").ToString()
            Setup_Level3_Combo()
            Me.RadCB_Level3.SelectedValue = drvSql("EI_Level_3").ToString()
            Me.RadTxt_Name.Text = drvSql("EI_Name").ToString()
            Me.RadNumTxt_Qty.Text = drvSql("EI_Qty").ToString()
            lbl_Qty.Text = drvSql("EI_Qty").ToString()
            Me.RadNumTxt_Markup.Text = drvSql("EI_Markup").ToString()
            Me.RadNumTxt_Rate.Text = drvSql("EI_Rate").ToString()
            Me.lbl_Total.Text = Format(drvSql("EI_Total"), "£#,##0.00")
            Me.RadCB_Status.SelectedValue = drvSql("EI_Status").ToString()
            If RadCB_Status.SelectedValue = "Used" Then
                Me.lbl_Qty_Used.Visible = True
                Me.RadNumTxt_Qty_Used.Visible = True
                Me.RadNumTxt_Qty_Used.Text = drvSql("EI_Qty_Used").ToString()
                'ShowHideSave()
            Else
                Me.lbl_Qty_Used.Visible = False
                Me.RadNumTxt_Qty_Used.Visible = False
            End If
            If RadCB_Status.SelectedValue = "Requested" Or RadCB_Status.SelectedValue = "Used" Or RadCB_Status.SelectedValue = "Unused" Then
                Me.lbl_Qty.Visible = True
                Me.RadNumTxt_Qty.Visible = False
            Else
                Me.lbl_Qty.Visible = False
                Me.RadNumTxt_Qty.Visible = True
            End If
            If RadNumTxt_Qty_Used.Text = "" Then RadNumTxt_Qty_Used.Text = "0"
        End If
    End Sub
    Protected Sub RadNumTxt_Qty_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Qty.TextChanged
        ShowHideSave()
    End Sub
    Protected Sub RadNumTxt_Rate_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Rate.TextChanged
        ShowHideSave()
    End Sub
    Protected Sub RadNumTxt_Markup_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Markup.TextChanged
        ShowHideSave()
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        If RadCB_Status.SelectedValue = "Used" Then
            Me.lbl_Qty_Used.Visible = True
            Me.RadNumTxt_Qty_Used.Visible = True
            Me.RadNumTxt_Qty_Used.Text = "0"
            Me.Btn_Save.Visible = False
        Else
            Me.lbl_Qty_Used.Visible = False
            Me.RadNumTxt_Qty_Used.Visible = False
            Me.RadNumTxt_Qty_Used.Value = Nothing
        End If
        If RadNumTxt_Qty_Used.Text = "" Then RadNumTxt_Qty_Used.Text = "0"
    End Sub
    Protected Sub RadNumTxt_Qty_Used_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Qty_Used.TextChanged
        ShowHideSave()
    End Sub
    Sub ShowHideSave()
        If RadNumTxt_Markup.Text = "" Then RadNumTxt_Markup.Text = "0"
        Dim Markup As Decimal
        Markup = 100
        Markup = (100 + CDbl(RadNumTxt_Markup.Text)) / 100
        If RadNumTxt_Qty.Text = "0" Or RadNumTxt_Rate.Text = "0" Then
            Me.Btn_Save.Visible = False
        Else
            lbl_Total.Text = Format((CDbl(RadNumTxt_Qty.Text) * CDbl(RadNumTxt_Rate.Text) * Markup), "£#,##0.00")
            Me.Btn_Save.Visible = True
        End If
        If RadCB_Status.SelectedValue = "Used" Then
            If RadNumTxt_Qty_Used.Text = "" Then RadNumTxt_Qty_Used.Text = "0"
            If (CDbl(RadNumTxt_Qty_Used.Text) > CDbl(RadNumTxt_Qty.Text)) Then

                Me.Btn_Save.Visible = False
                RadNotification1.Visible = True
            Else
                Me.Btn_Save.Visible = True
                RadNotification1.Visible = False
            End If
            If RadNumTxt_Qty_Used.Text = "0" Then
                Me.Btn_Save.Visible = False
            End If
        End If
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveEI(Me.HF_EI_ID.Value _
                        , HF_E_ID.Value _
                        , RadCB_Level3.SelectedValue _
                        , RadTxt_Name.Text _
                        , RadNumTxt_Qty.Text _
                        , RadNumTxt_Rate.Text _
                        , RadNumTxt_Markup.Text _
                        , CDbl(lbl_Total.Text) _
                        , RadNumTxt_Qty_Used.Text _
                        , RadCB_Status.SelectedValue _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("EI_ID") = HF_EI_ID.Value
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Level3_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Level3 = Setup.Populate_CodeLevel3Only(RadCB_Level3)
    End Sub
#End Region

End Class