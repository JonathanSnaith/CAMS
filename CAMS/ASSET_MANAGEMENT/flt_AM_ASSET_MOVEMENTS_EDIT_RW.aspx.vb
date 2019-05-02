Imports System.Data
Imports System.Data.SqlClient
Partial Class ASSET_MANAGEMENT_flt_AM_ASSET_MOVEMENTS_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_AM_ID.Value = Request.QueryString("AM_ID")
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.LblPreviousPage.Text = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        ' Me.lblWhoIsIt.Text = "Jonathan Snaith"
        GetData()
        GetWeekEnding()
        Session("AM_ID") = Me.HF_AM_ID.Value
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
                                Select Case dr("EXCEPTION_ID").ToString()
                                    Case 73
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_2_R.Value = 1 'Asset Management - R
                                        End If
                                    Case 85
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_2_RW.Value = 1 'Asset Management - RW
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
        Dim ThisID As String = HF_AM_ID.Value
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "AM - Asset Movements - Edit" & " (" & ThisID & ")"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Sub GetData()
        Dim dvSql As DataView = DirectCast(SqlDS_Select.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lbl_ID.Text = drvSql("AM_ID").ToString()
            Me.lbl_Asset.Text = drvSql("Asset_ID").ToString()
            Me.lbl_AM_A_ID.Text = drvSql("AM_A_ID").ToString()
            Me.lbl_Site_Prev.Text = drvSql("Previous_Site_Name").ToString()
            Me.lbl_Cost_Prev.Text = drvSql("Previous_SC_Name").ToString()
            Me.RadCB_Company.SelectedValue = drvSql("AM_COM_ID").ToString()
            Me.HF_Company.Value = drvSql("AM_COM_ID").ToString()
            Me.RadCB_Site.SelectedValue = drvSql("AM_SITE_ID").ToString()
            Me.lbl_Site_ID.Text = drvSql("AM_SITE_ID").ToString()
            Me.HF_Site_ID.Value = drvSql("AM_SITE_ID").ToString()
            Me.lbl_Site.Text = drvSql("Site_Name").ToString()
            Me.RadCB_Cost.SelectedValue = drvSql("AM_SC_ID").ToString()
            Me.RadCB_Cost_1.SelectedValue = drvSql("AM_Cost_Dept").ToString()
            Me.RadCB_Cost_2.SelectedValue = drvSql("AM_Cost_ID").ToString()
            If IsDBNull(drvSql("AM_WeekEnding")) = False Then
                Me.lbl_WeekEnding.Text = DateTime.Parse(drvSql("AM_WeekEnding")).ToString("dd MMM yyyy")
            End If
            If IsDBNull(drvSql("AM_Date")) = False Then
                Me.RadDP_Date.SelectedDate = DateTime.Parse(drvSql("AM_Date")).ToString("dd MMM yyyy")
            End If
            If IsDBNull(drvSql("AM_Date_Started")) = False Then
                Me.RadDP_Date_Started.SelectedDate = DateTime.Parse(drvSql("AM_Date_Started")).ToString("dd MMM yyyy")
            End If
            If IsDBNull(drvSql("AM_Date_Started")) = False Then
                Me.HF_Actual_Date.Value = DateTime.Parse(drvSql("AM_Date_Started")).ToString("dd MMM yyyy")
            End If
            Me.RadTxt_Reason.Text = drvSql("AM_Reason").ToString()
            Me.RadTxt_Notes.Text = drvSql("AM_Note").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("AM_Status").ToString()
            Me.HF_Movement_Flag.Value = drvSql("AM_Movement_Flag").ToString()
            Me.HF_Created_By.Value = drvSql("AM_Created_By").ToString()
            If RadCB_Status.SelectedValue = "Approved" Then
                Me.HF_Approved_By.Value = drvSql("AM_Approved_By").ToString()
            End If
        Next
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        SqlDS_Update.SelectParameters("AM_ID").DefaultValue = Me.HF_AM_ID.Value
        SqlDS_Update.SelectParameters("AM_SITE_ID").DefaultValue = 0
        SqlDS_Update.SelectParameters("AM_COM_ID").DefaultValue = -1
        SqlDS_Update.SelectParameters("AM_SC_ID").DefaultValue = 0
        SqlDS_Update.SelectParameters("AM_WeekEnding").DefaultValue = "1900-01-01"
        SqlDS_Update.SelectParameters("AM_Date").DefaultValue = "1900-01-01"
        SqlDS_Update.SelectParameters("AM_Date_Started").DefaultValue = "1900-01-01"
        SqlDS_Update.SelectParameters("AM_Note").DefaultValue = "abc"
        SqlDS_Update.SelectParameters("AM_Cost_Dept").DefaultValue = "*Not Specified"
        SqlDS_Update.SelectParameters("AM_Status").DefaultValue = "Planning"
        SqlDS_Update.SelectParameters("AM_Movement_Flag").DefaultValue = "0"
        SqlDS_Update.SelectParameters("AM_Modified_By").DefaultValue = Me.lblWhoIsIt.Text
        Me.SqlDS_Update.Select(DataSourceSelectArguments.Empty)
        If RadCB_Status.SelectedValue = "Complete" Then
            SqlDS_Update_AssetList.SelectParameters("AM_A_ID").DefaultValue = "0"
            SqlDS_Update_AssetList.SelectParameters("AM_SITE_ID").DefaultValue = "0"
            SqlDS_Update_AssetList.SelectParameters("AM_SC_ID").DefaultValue = "0"
            Me.SqlDS_Update_AssetList.Select(DataSourceSelectArguments.Empty)
        ElseIf RadCB_Status.SelectedValue = "Approved" Then
            Me.SqlDS_Email_Approved.Select(DataSourceSelectArguments.Empty)
            If RadDP_Date_Started.SelectedDate <> HF_Actual_Date.Value Or RadCB_Company.SelectedValue <> HF_Company.Value Then
                Me.SqlDS_Email_Date_Amended.Select(DataSourceSelectArguments.Empty)
            Else

            End If
        ElseIf RadCB_Status.SelectedValue = "Rejected" Then
            Me.SqlDS_Email_Rejected.Select(DataSourceSelectArguments.Empty)
        End If
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("AM_ID") = Me.HF_AM_ID.Value
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
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        If RadCB_Status.SelectedValue = "Complete" Or RadCB_Status.SelectedValue = "Approved" Then
            Me.HF_Movement_Flag.Value = 1
        ElseIf RadCB_Status.SelectedValue = "Planning" Or RadCB_Status.SelectedValue = "Rejected" Then
            Me.HF_Movement_Flag.Value = 0
        End If
        If RadCB_Status.SelectedValue = "Rejected" Then
            Me.lbl_Reject_Note.Visible = True
            Me.RadTxt_Reject_Note.Visible = True
            Me.HF_Rejected_By.Value = Me.lblWhoIsIt.Text
        Else
            Me.lbl_Reject_Note.Visible = False
            Me.RadTxt_Reject_Note.Visible = False
            Me.HF_Rejected_By.Value = Nothing
        End If
        If RadCB_Status.SelectedValue = "Approved" Then
            Me.HF_Approved_By.Value = Me.lblWhoIsIt.Text
            Me.RadCB_Site.Visible = True
            Me.lbl_Site.Visible = False
        Else
            Me.HF_Approved_By.Value = Nothing
            Me.RadCB_Site.Visible = False
            Me.lbl_Site.Visible = True
        End If
        If RadCB_Status.SelectedValue = "Approved" And HF_Created_By.Value = lblWhoIsIt.Text Then
            Btn_Save.Visible = False
        Else
            Btn_Save.Visible = True
        End If
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_2_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_2_RW.Value = 1 Then
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
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Me.HF_Site_ID.Value = RadCB_Site.SelectedValue
    End Sub
End Class