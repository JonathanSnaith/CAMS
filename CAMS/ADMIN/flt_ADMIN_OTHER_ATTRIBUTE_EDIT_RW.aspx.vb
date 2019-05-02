Imports System.Data
Imports System.Data.SqlClient
Partial Class ADMIN_flt_ADMIN_OTHER_ATTRIBUTE_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lbl_Table.Text = Request.QueryString("ATT_TABLE")
        Me.HF_ATT_ID.Value = Request.QueryString("ATT_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Select Case lbl_Table.Text
            Case "FUEL_Consumer"
                lbl_Table_English.Text = "Fuel Consumer"
            Case "PLANT_TIMESHEET_Code"
                lbl_Table_English.Text = "Plant Timesheet Code"
            Case "PLANT_TIMESHEET_Reason"
                lbl_Table_English.Text = "Plant Timesheet Not Working Reason"
            Case "SERVICE_Type"
                lbl_Table_English.Text = "Service Type"
            Case "PA_CutNumber"
                lbl_Table_English.Text = "Activity Location"
            Case "PA_SitePhase"
                lbl_Table_English.Text = "Activity Site Phase"
            Case "PA_OverburdenExcavation"
                lbl_Table_English.Text = "Activity Seams"
            Case "PA_Excavation"
                lbl_Table_English.Text = "Activity Horizon"
            Case "SITE_StartTime"
                lbl_Table_English.Text = "Activity Site StartTime"
            Case "SITE_EndTime"
                lbl_Table_English.Text = "Activity Site EndTime"
            Case "DM_Categories"
                lbl_Table_English.Text = "Driver Matrix Categories"
            Case "PA_BaitTimes"
                lbl_Table_English.Text = "Activity Bait Times"
            Case "COMPARTMENT"
                lbl_Table_English.Text = "Compartment"
            Case "VISUAL_RATING"
                lbl_Table_English.Text = "Visual Rating"
            Case "LUBRICANT_Type"
                lbl_Table_English.Text = "Lubricant Type"
            Case "Processing_Plant_Gravity_Reasons"
                lbl_Table_English.Text = "Wash Plant Specific Gravity Reasons"
        End Select
        GetData()
        Apply_Permissions()
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
            HF_PageName.Value = "Admin - Other - Edit Attribute"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.ADMIN_OTHER_RG_ATTRIBUTES_SELECT_RW_SP(HF_ATT_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadTxt_Name.Text = drvSql("ATT_Name").ToString()
            Me.RadTxt_Description.Text = drvSql("ATT_Description").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("ATT_Status").ToString()
        End If
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveAttributesOther(Me.HF_ATT_ID.Value _
                        , RadTxt_Name.Text _
                        , RadTxt_Description.Text _
                        , RadCB_Status.Text _
                        , lbl_Table.Text _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_11_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_11_RW.Value = 1 Then
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