Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class ADMIN_TRIGGERS
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Apply_Permissions()
        Me.T2.Visible = False
        GetSYS()
    End Sub
    Sub GetSYS()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GET_SYS_SP()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
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
            HF_PageName.Value = "Admin - Triggers"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
        If Not Me.IsPostBack Then
            Setup_Model_Combo()
        Else
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
                        Case "Calculate"
                            Dim valuePassed As String = eventArgument
                            'Me.CalculateSheet()
                        Case "Show_Buttons"
                            Dim valuepassed As String = eventArgument
                            'ShowPage1_Buttons(valuepassed)
                        Case "Refresh_Combo"
                            Dim valuepassed As String = eventArgument
                            RefreshCombo()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub RefreshCombo()
        Setup_Model_Combo()
        Me.RadCB_Model.DataBind()
        Me.RadCB_Model.SelectedValue = Me.HF_Model.Value
        Me.RadGrid_Triggers.DataBind()
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Model_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Model = Setup.Populate_AttributeDropdown(RadCB_Model, True, "ASSET_Model")
    End Sub
#End Region
    Protected Sub RadCB_Model_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Model.SelectedIndexChanged
        Me.T2.Visible = False
        Me.lbl_Msg2.Visible = False
        Me.lbl_Msg.Visible = True
        Me.lbl_Msg.Text = "Click 'Add New Job Trigger' to add to the database for this model. Alternatively, click the pencil icon to edit/trash the item. This will affect any future assets of this model type. Single Click on an item in the grid to see the button to add it into an existing Asset in the Planning Dashboard. Double Click on an item in the grid to add it into ALL Assets of this model type in the Planning Dashboard."
    End Sub
    Protected Sub RadGrid_Triggers_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadGrid_Triggers.SelectedIndexChanged
        Me.T2.Visible = True
        Apply_Permissions()
        Me.lbl_Msg.Visible = False
        Me.lbl_Msg2.Visible = True
        Me.lbl_Msg2.Text = "Click 'Add to specific Asset' to add selected item to an existing Asset in the Planning Dashboard."
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_11_RW.Value = 1 Then
                    Me.T1.Visible = True
                    Me.T2.Visible = True
                    Me.T3.Visible = True
                    Me.RadGrid_Triggers.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
                    Me.RadGrid_Triggers.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
                Else
                    Me.T1.Visible = False
                    Me.T2.Visible = False
                    Me.T3.Visible = False
                    Me.RadGrid_Triggers.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None
                    Me.RadGrid_Triggers.MasterTableView.GetColumnSafe("EditCommandColumn").Display = False
                End If
            Case 3
                If HF_EXCEPTION_11_RW.Value = 1 Then
                    Me.T1.Visible = True
                    Me.T2.Visible = True
                    Me.T3.Visible = True
                    Me.RadGrid_Triggers.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
                    Me.RadGrid_Triggers.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
                Else
                    Me.T1.Visible = False
                    Me.T2.Visible = False
                    Me.T3.Visible = False
                    Me.RadGrid_Triggers.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None
                    Me.RadGrid_Triggers.MasterTableView.GetColumnSafe("EditCommandColumn").Display = False
                End If
            Case 4
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.RadGrid_Triggers.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
                Me.RadGrid_Triggers.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
            Case 5
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.RadGrid_Triggers.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
                Me.RadGrid_Triggers.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
            Case Else
                Me.T1.Visible = False
                Me.T2.Visible = False
                Me.T3.Visible = False
                Me.RadGrid_Triggers.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None
                Me.RadGrid_Triggers.MasterTableView.GetColumnSafe("EditCommandColumn").Display = False
        End Select
    End Sub
End Class