Imports System.Data
Imports System.Data.SqlClient
Partial Class DATA_INPUT_flt_HOSES_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_HOS_ID.Value = Request.QueryString("HOS_ID")
        Me.lbl_HOS_ID.Text = Request.QueryString("HOS_ID")
        Session("HOS_ID") = lbl_HOS_ID.Text
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
        Dim ThisID As String = HF_HOS_ID.Value
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Data Input - Hoses - Edit" & " (" & ThisID & ")"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Sub GetData()
        Dim dvSql As DataView = DirectCast(SqlDS_Select.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lbl_Created.Text = DateTime.Parse(drvSql("HOS_Created")).ToString("dd MMM yyyy HH:mm")
            Me.lbl_Modified.Text = DateTime.Parse(drvSql("HOS_Modified")).ToString("dd MMM yyyy HH:mm")
            Me.RadCB_Asset.SelectedValue = drvSql("HOS_A_ID").ToString()
            Me.RadCB_Site.SelectedValue = drvSql("HOS_SITE_ID").ToString()
            Me.HF_A_ID.Value = drvSql("HOS_A_ID").ToString()
            Me.RadCB_EventType.SelectedValue = drvSql("HOS_ET_ID").ToString()
            Me.RadCB_Reason.SelectedValue = drvSql("HOS_Reason_ID").ToString()
            Me.RadCB_Component.SelectedValue = drvSql("HOS_Area_ID").ToString()
            Me.RadCB_Position.SelectedValue = drvSql("HOS_POS_ID").ToString()
            If IsDBNull(drvSql("HOS_Date")) = False Then
                Me.RadDP_Date.SelectedDate = DateTime.Parse(drvSql("HOS_Date")).ToString("dd MMM yyyy")
            End If
            Me.RadTxt_SMU.Text = drvSql("HOS_SMU").ToString()
            Me.RadTxt_Order.Text = drvSql("HOS_Order").ToString()
            Me.RadTxt_Tag.Text = drvSql("HOS_Tag").ToString()
            Me.RadTxt_OldTag.Text = drvSql("HOS_OldTag").ToString()
            Me.RadCB_Prevented.SelectedValue = drvSql("HOS_Prevented").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("HOS_Status").ToString()
        Next
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Me.SqlDS_Update.Select(DataSourceSelectArguments.Empty)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_7_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_7_RW.Value = 1 Then
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
End Class