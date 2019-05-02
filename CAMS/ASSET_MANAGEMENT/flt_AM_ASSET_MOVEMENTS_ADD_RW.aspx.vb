Imports System.Data
Imports System.Data.SqlClient
Partial Class ASSET_MANAGEMENT_flt_AM_ASSET_MOVEMENTS_ADD_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.LblPreviousPage.Text = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        Apply_Permissions()
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
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 0 'OTHER
                Me.lbl_Cost_Location.Visible = False
                Me.lbl_Current_Cost_Location.Visible = False
                Me.RadCB_Cost.Visible = False
                Me.lbl_Prev_Cost.Visible = False
            Case 1 'GU
                Me.lbl_Cost_Location.Visible = False
                Me.lbl_Current_Cost_Location.Visible = False
                Me.RadCB_Cost.Visible = False
                Me.lbl_Prev_Cost.Visible = False
            Case 2 'MANAGER
                Me.lbl_Cost_Location.Visible = False
                Me.lbl_Current_Cost_Location.Visible = False
                Me.RadCB_Cost.Visible = False
                Me.lbl_Prev_Cost.Visible = False
            Case 3 'DIVISIONAL
                Me.lbl_Cost_Location.Visible = False
                Me.lbl_Current_Cost_Location.Visible = False
                Me.RadCB_Cost.Visible = False
                Me.lbl_Prev_Cost.Visible = False
            Case 4 'ADMIN
                If Me.HF_Username.Value = "Tony Styles" Then
                    Me.lbl_Cost_Location.Visible = True
                    Me.lbl_Current_Cost_Location.Visible = True
                    Me.RadCB_Cost.Visible = True
                    Me.lbl_Prev_Cost.Visible = True
                Else
                    Me.lbl_Cost_Location.Visible = False
                    Me.lbl_Current_Cost_Location.Visible = False
                    Me.RadCB_Cost.Visible = False
                    Me.lbl_Prev_Cost.Visible = False
                End If
            Case 5 'SA
                Me.lbl_Cost_Location.Visible = True
                Me.lbl_Current_Cost_Location.Visible = True
                Me.RadCB_Cost.Visible = True
                Me.lbl_Prev_Cost.Visible = True
            Case Else
        End Select
    End Sub
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "AM - Asset Movements - Add"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        'AM_ASSET_MOVEMENTS_RG_INSERT_SP'
        SqlDS_Insert.SelectParameters("AM_A_ID").DefaultValue = 0
        SqlDS_Insert.SelectParameters("AM_SITE_ID_Prev").DefaultValue = 0
        SqlDS_Insert.SelectParameters("AM_SC_ID_Prev").DefaultValue = 0
        SqlDS_Insert.SelectParameters("AM_SITE_ID").DefaultValue = 0
        SqlDS_Insert.SelectParameters("AM_SC_ID").DefaultValue = 0
        SqlDS_Insert.SelectParameters("AM_WeekEnding").DefaultValue = "1900-01-01"
        SqlDS_Insert.SelectParameters("AM_Date").DefaultValue = "1900-01-01"
        SqlDS_Insert.SelectParameters("AM_Date_Started").DefaultValue = "1900-01-01"
        SqlDS_Insert.SelectParameters("AM_Reason").DefaultValue = "abc"
        SqlDS_Insert.SelectParameters("AM_Note").DefaultValue = "abc"
        SqlDS_Insert.SelectParameters("AM_Status").DefaultValue = "Planning"
        SqlDS_Insert.SelectParameters("AM_Movement_Flag").DefaultValue = "0"
        SqlDS_Insert.SelectParameters("AM_Created_By").DefaultValue = Me.lblWhoIsIt.Text
        SqlDS_Insert.SelectParameters("AM_Modified_By").DefaultValue = Me.lblWhoIsIt.Text
        Me.SqlDS_Insert.Select(DataSourceSelectArguments.Empty)
        Me.SqlDS_Email.Select(DataSourceSelectArguments.Empty)
        'AM_ASSET_MOVEMENTS_AL_UPDATE_SP'
        If RadCB_Status.SelectedValue = "Complete" Then
            SqlDS_Update_AssetList.SelectParameters("AM_A_ID").DefaultValue = 0
            SqlDS_Update_AssetList.SelectParameters("AM_SITE_ID").DefaultValue = 0
            SqlDS_Update_AssetList.SelectParameters("AM_SC_ID").DefaultValue = 0
            Me.SqlDS_Update_AssetList.Select(DataSourceSelectArguments.Empty)
        ElseIf RadCB_Status.SelectedValue = "Planning" Then
            Me.SqlDS_Request_Email.Select(DataSourceSelectArguments.Empty)
        End If
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindowAdd();", True)
    End Sub
    Protected Sub RadDP_Date_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_Date.SelectedDateChanged
        Me.SqlDS_GetWeekEnding.Select(DataSourceSelectArguments.Empty)
        GetWeekEnding()
    End Sub
    Sub GetWeekEnding()
        Dim WeekEnding As String = "dd MMM yyyy"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_GetWeekEnding.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            WeekEnding = drvSql("WeekEnding").ToString()
        Next
        Me.lbl_WeekEnding.Text = WeekEnding
        Me.lbl_WeekEnding.Text = DateTime.Parse(WeekEnding).ToString("dd/MM/yyyy")
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        GetSite()
    End Sub
    Sub GetSite()
        Dim dvSqlSession As DataView = DirectCast(SqlDS_GetSite.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            Me.HF_PrevSiteID.Value = drvSql("PrevSiteID").ToString()
            Me.HF_PrevCostID.Value = drvSql("PrevCostID").ToString()
            Me.lbl_Prev_Site.Text = drvSql("PrevSite").ToString()
            Me.lbl_Prev_Cost.Text = drvSql("PrevCost").ToString()
        Next
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        If RadCB_Status.SelectedValue = "Complete" Then
            Me.HF_Movement_Flag.Value = 1
        ElseIf RadCB_Status.SelectedValue = "Planning" Then
            Me.HF_Movement_Flag.Value = 0
        End If
    End Sub
End Class