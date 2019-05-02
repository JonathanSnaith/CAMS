Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class ASSET_MANAGEMENT_flt_AM_ASSET_SERVICE_CONTRACTS_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_ASC_ID.Value = Request.QueryString("ASC_ID")
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.LblPreviousPage.Text = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        GetData()
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
                                    Case 97
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_18_R.Value = 1 'Finance - R
                                        End If
                                    Case 98
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_18_RW.Value = 1 'Finance - RW
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
            lblPageName.Text = "AM - Asset Service Contracts - Edit"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Sub GetData()
        Dim dvSql As DataView = DirectCast(SqlDS_Select.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lblAsset.Text = drvSql("A_Asset_ID").ToString()
            Me.lblMan.Text = drvSql("AssetCompany").ToString()
            Me.lblModel.Text = drvSql("Model").ToString()
            Me.lblSerial.Text = drvSql("A_Serial_No").ToString()
            Me.RadCB_Type.SelectedValue = drvSql("ASC_Type").ToString()
            Me.RadNumTxt_Months.Text = drvSql("ASC_Months").ToString()
            Me.RadNumTxt_Hours.Text = drvSql("ASC_End_Hours").ToString()
            Me.RadNumTxt_Start_SMU.Text = drvSql("ASC_Start_SMU").ToString()
            Me.lbl_Current_SMU.Text = drvSql("ASC_Current_SMU").ToString()
            Me.RadNumTxt_Usage.Text = drvSql("ASC_Agreed_Usage").ToString()
            Me.RadNumTxt_Month_Cost.Text = drvSql("ASC_Month_Cost").ToString()
            Me.RadCB_Company.SelectedValue = drvSql("ASC_COM_ID").ToString()
            If IsDBNull(drvSql("ASC_Start_Date")) = False Then
                Me.RadDP_Start_Date.SelectedDate = DateTime.Parse(drvSql("ASC_Start_Date")).ToString("dd MMM yyyy")
            End If
            If IsDBNull(drvSql("ASC_End_Date")) = False Then
                Me.RadDP_End_Date.SelectedDate = DateTime.Parse(drvSql("ASC_End_Date")).ToString("dd MMM yyyy")
            End If
            Me.RadCB_Status.SelectedValue = drvSql("ASC_Status").ToString()
        Next
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        SqlDS_UPDATE.SelectParameters("ASC_COM_ID").DefaultValue = 0
        SqlDS_UPDATE.SelectParameters("ASC_Start_Date").DefaultValue = "1900-01-01"
        SqlDS_UPDATE.SelectParameters("ASC_End_Date").DefaultValue = "1900-01-01"
        SqlDS_UPDATE.SelectParameters("ASC_Status").DefaultValue = "Active"
        SqlDS_UPDATE.SelectParameters("ASC_Modified_By").DefaultValue = Me.lblWhoIsIt.Text
        Me.SqlDS_UPDATE.Select(DataSourceSelectArguments.Empty)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindowAdd();", True)
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 5
                Me.Btn_Save.Visible = True
                Me.RadGrid_Attachments.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
                Me.RadGrid_Attachments.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
            Case Else
                If HF_EXCEPTION_18_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                    Me.RadGrid_Attachments.MasterTableView.GetColumnSafe("EditCommandColumn").Display = True
                    Me.RadGrid_Attachments.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top
                Else
                    Me.Btn_Save.Visible = False
                    Me.RadGrid_Attachments.MasterTableView.GetColumnSafe("EditCommandColumn").Display = False
                    Me.RadGrid_Attachments.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None
                End If
        End Select
    End Sub
End Class