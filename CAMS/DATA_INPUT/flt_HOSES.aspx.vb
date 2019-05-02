Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class DATA_INPUT_flt_HOSES
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        Apply_Permissions()
        GetSYS()
    End Sub
    Sub GetSYS()
        Dim dvSql As DataView = DirectCast(SqlDS_SYS.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        Next
    End Sub
    Sub Get_Session_Info(ByVal SESSION_ID As Integer, ByVal CLIENT_APP_ID As Integer)
        Me.HF_Session_ID.Value = SESSION_ID
        Me.HF_Client_APP_ID.Value = CLIENT_APP_ID
        If HttpContext.Current.Request.IsLocal Then
            Me.HF_Username.Value = "Jonathan Snaith"
            Me.lblWhoIsIt.Text = "Jonathan Snaith"
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
                                Me.lblWhoIsIt.Text = dr("Fullname").ToString()
                                Me.HF_PQQ_Permission.Value = dr("Value")
                                Me.HF_EMP_ID.Value = dr("EMPLOYEE_ID").ToString()
                            Case 1 ' APPLICATION EXCEPTIONS
                                Select Case dr("EXCEPTION_ID").ToString()
                                    Case 78
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_7_R.Value = 1 'Data Input - R
                                        End If
                                    Case 89
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_7_RW.Value = 1 'Data Input- RW
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
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Data Input - Hoses"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
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
                        Case "Calculate"
                            Dim valuePassed As String = eventArgument
                            'Me.CalculateSheet()
                        Case "Show_Buttons"
                            Dim valuepassed As String = eventArgument
                            'ShowPage1_Buttons(valuepassed)
                        Case "Refresh_Grid_Combo"
                            Dim valuepassed As String = eventArgument
                            RefreshCombo()
                            Me.RadGrid_Hoses.Rebind()
                            WhichRowSelectedJob()
                            SelectCorrectRecordJob()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub RefreshCombo()
        Me.RadGrid_Hoses.DataBind()
    End Sub
    Sub WhichRowSelectedJob()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Hoses.Items
            Dim intCategoryID As String = (item("HOS_ID").Text)
            count = count + 1
            If item.Selected Then
                lbl_TestJob.Text = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecordJob()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Hoses.Items
            Dim JobIDCell As TableCell = item("HOS_ID")
            Dim JobID = JobIDCell.Text
            count = count + 1
            If Session("HOS_ID") = "null" Then Session("HOS_ID") = "0"

            If Session("HOS_ID") = JobID Then
                item.Selected = True
            End If
        Next
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Dim abc As String = RadCB_Site.SelectedValue
        Me.lbl_Site.Text = abc
        Me.RadCB_Asset.SelectedValue = "%"
        Me.RadCB_Asset.DataBind()
        Me.RadCB_EventType.SelectedValue = "%"
        Me.RadCB_EventType.DataBind()
        Me.RadCB_Component.SelectedValue = "%"
        Me.RadCB_Component.DataBind()
        Me.RadCB_Reason.SelectedValue = "%"
        Me.RadCB_Reason.DataBind()
        If abc = "%" Then
            RadGrid_Hoses.MasterTableView.GetColumnSafe("SITE_Name").Display = True
            Exit Sub
        Else
            RadGrid_Hoses.MasterTableView.GetColumnSafe("SITE_Name").Display = False
        End If
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Dim abc As String = RadCB_Asset.SelectedValue
        Me.lbl_Asset.Text = abc
        Me.RadCB_Site.SelectedValue = "%"
        Me.RadCB_EventType.SelectedValue = "%"
        Me.RadCB_Component.DataBind()
        Me.RadCB_Reason.SelectedValue = "%"
        Me.RadCB_Reason.DataBind()
        If abc = "%" Then
            RadGrid_Hoses.MasterTableView.GetColumnSafe("Asset").Display = True
            Exit Sub
        Else
            RadGrid_Hoses.MasterTableView.GetColumnSafe("Asset").Display = False
        End If
        Me.RadGrid_Hoses.DataBind()
    End Sub
    Protected Sub RadCB_EventType_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_EventType.SelectedIndexChanged
        Dim abc As String = RadCB_EventType.SelectedValue
        Me.lbl_EventType.Text = abc
        Me.RadCB_Component.SelectedValue = "%"
        Me.RadCB_Component.DataBind()
        Me.RadCB_Reason.SelectedValue = "%"
        Me.RadCB_Reason.DataBind()
        Me.RadGrid_Hoses.DataBind()
    End Sub
    Protected Sub RadCB_Component_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Component.SelectedIndexChanged
        Dim abc As String = RadCB_Component.SelectedValue
        Me.lbl_Component.Text = abc
        Me.RadCB_Reason.SelectedValue = "%"
        Me.RadCB_Reason.DataBind()
        Me.RadGrid_Hoses.DataBind()
    End Sub
    Protected Sub RadCB_Reason_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Reason.SelectedIndexChanged
        Dim abc As String = RadCB_Reason.SelectedValue
        Me.lbl_Reason.Text = abc
    End Sub
    Protected Sub btn_Refresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Refresh.Click
        Me.RadCB_Site.SelectedValue = "%"
        Me.RadCB_Site.DataBind()
        Me.RadCB_Asset.SelectedValue = "%"
        Me.RadCB_Asset.DataBind()
        Me.RadCB_EventType.SelectedValue = "%"
        RadCB_EventType.DataBind()
        Me.RadCB_Component.SelectedValue = "%"
        Me.RadCB_Component.DataBind()
        Me.RadCB_Reason.SelectedValue = "%"
        Me.RadCB_Reason.DataBind()
        RadGrid_Hoses.MasterTableView.GetColumnSafe("Asset").Display = True
        RadGrid_Hoses.MasterTableView.GetColumnSafe("Site_Name").Display = True
        Me.RadGrid_Hoses.DataBind()
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_7_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_7_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
            Case 4
                Me.T1.Visible = True
            Case 5
                Me.T1.Visible = True
            Case Else
                Me.T1.Visible = False
        End Select
    End Sub
End Class