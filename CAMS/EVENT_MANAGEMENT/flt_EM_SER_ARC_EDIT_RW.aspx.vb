Imports System.Data
Imports System.Data.SqlClient
Partial Class EVENT_MANAGEMENT_flt_EM_SER_ARC_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.LblPreviousPage.Text = Request.QueryString("PreviousPage")
        Me.HF_Asset.Value = Request.QueryString("SERA_A_ID")
        Me.lbl_SERA_ID.Text = Request.QueryString("SERA_ID")
        'Me.lblWhoIsIt.Text = "Jonathan Snaith"
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
        Dim ThisID As String = Me.lbl_SERA_ID.Text
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "EM - Servicing - Archive Edit" & " (" & ThisID & ")"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Sub GetData()
        Dim dvSql As DataView = DirectCast(SqlDS_Select.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lbl_Site.Text = drvSql("SITE_Name").ToString()
            Me.HF_Asset.Value = drvSql("SERA_A_ID").ToString()
            Me.lbl_Asset.Text = drvSql("Asset").ToString()
            Me.lbl_Cycle.Text = drvSql("SER_Cycle").ToString()
            Me.RadNumTxt_ServiceSMU.Text = drvSql("SERA_Service_SMU").ToString()
            Me.lbl_Counter.Text = drvSql("SERA_SMU_Diff").ToString()
            Me.lbl_Left.Text = drvSql("SERA_SMU_Left").ToString()
            Me.lbl_Previous_SMU.Text = drvSql("SERA_Last_SMU").ToString()
            Me.RadCB_ServiceType.SelectedValue = drvSql("SERA_SERT_ID").ToString()
            Me.lbl_Service_Type_ID.Text = drvSql("SERA_SERT_ID").ToString()
            If IsDBNull(drvSql("SERA_Date_Service")) = False Then
                Me.RadDP_Date.SelectedDate = DateTime.Parse(drvSql("SERA_Date_Service")).ToString("dd MMM yyyy")
            End If
        Next
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        SqlDS_Update.SelectParameters("SERA_ID").DefaultValue = Me.lbl_SERA_ID.Text
        SqlDS_Update.SelectParameters("SERA_A_ID").DefaultValue = 0
        SqlDS_Update.SelectParameters("SERA_Date_Service").DefaultValue = "1900-01-01"
        SqlDS_Update.SelectParameters("SERA_SERT_ID").DefaultValue = 0
        SqlDS_Update.SelectParameters("SERA_Service_SMU").DefaultValue = "0"
        SqlDS_Update.SelectParameters("SERA_Last_SMU").DefaultValue = "0"
        SqlDS_Update.SelectParameters("SERA_SMU_Diff").DefaultValue = "0"
        SqlDS_Update.SelectParameters("SERA_SMU_Left").DefaultValue = "0"
        SqlDS_Update.SelectParameters("SERA_Modified_By").DefaultValue = Me.lblWhoIsIt.Text
        Me.SqlDS_Update.Select(DataSourceSelectArguments.Empty)
        Me.SqlDS_SetNextServiceType.Select(DataSourceSelectArguments.Empty)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
    End Sub
    Protected Sub RadCB_ServiceType_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_ServiceType.SelectedIndexChanged
        Me.lbl_Service_Type_ID.Text = Me.RadCB_ServiceType.SelectedValue
    End Sub
    Protected Sub RadNumTxt_ServiceSMU_TextChanged(sender As Object, e As System.EventArgs) Handles RadNumTxt_ServiceSMU.TextChanged
        Dim NewSMU As Double = RadNumTxt_ServiceSMU.Text
        Dim PreviousSMU As Double = lbl_Previous_SMU.Text
        Me.lbl_Counter.Text = PreviousSMU - NewSMU
        Me.lbl_Left.Text = Me.lbl_Cycle.Text - Me.lbl_Counter.Text
    End Sub
End Class