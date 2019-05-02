Imports System.Data
Imports System.Data.SqlClient
Partial Class AM_PART_INSPECTIONS_ADD_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.LblPreviousPage.Text = Request.QueryString("PreviousPage")
        If Session("ThisID") = Nothing Then
            Me.HF_ID_ID.Value = Request.QueryString("ID")
            Me.HF_PD_ID.Value = Request.QueryString("PD_ID")
            Me.HF_L3.Value = Request.QueryString("P_Level_3")
            Me.HF_MOD_ID.Value = Request.QueryString("P_MOD_ID")
            Me.HF_Part_ID.Value = Request.QueryString("P_Part_ID")
            Session("ThisID") = Me.HF_ID_ID.Value
        End If
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        GetData()
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
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Asset Management - New Part Inspection"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Me.SqlDS_Insert.Select(DataSourceSelectArguments.Empty)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
    End Sub
    Sub GetData()
        Dim dvSql As DataView = DirectCast(SqlDS_GetData.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.HF_PD_ID.Value = drvSql("PD_ID").ToString()
            Me.lbl_Model.Text = drvSql("Model").ToString()
            Me.lbl_Part_ID.Text = drvSql("P_Part_ID").ToString()
            Me.lbl_Component.Text = drvSql("Level3").ToString()
            Me.lbl_Overdue_Days.Text = drvSql("PD_Inspection_Due_Days").ToString()
        Next
        Me.lbl_Overdue_Days.Text = CInt(Me.lbl_Overdue_Days.Text) - 180
    End Sub
    Protected Sub btn_Next_Click(sender As Object, e As System.EventArgs) Handles btn_Next.Click
        Me.SqlDS_Insert.Select(DataSourceSelectArguments.Empty)
        Session("ThisID") = Session("ThisID") + 1
        GetData()
        'Me.RadDP_Inspection_Date.SelectedDate = Nothing
        'Me.RadCB_Inspector.ClearSelection()
        Me.RadTxt_Comments.Text = ""
    End Sub
    Protected Sub RadCB_Inspector_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Inspector.SelectedIndexChanged
        If RadDP_Inspection_Date.SelectedDate IsNot Nothing Then
            Me.Btn_Save.Visible = True
        Else
            Me.Btn_Save.Visible = False
        End If
    End Sub
    Protected Sub RadDP_Inspection_Date_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_Inspection_Date.SelectedDateChanged
        If RadCB_Inspector.SelectedValue <> "" Then
            Me.Btn_Save.Visible = True
        Else
            Me.Btn_Save.Visible = False
        End If
    End Sub
End Class