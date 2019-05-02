Imports System.Data
Imports System.Data.SqlClient
Partial Class CUSTOMER_MANAGEMENT_flt_CUSTOMER_LIST_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_CUS_ID.Value = Request.QueryString("CUS_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        GetData()
        Session("CUS_ID") = Me.HF_CUS_ID.Value
        Apply_Permissions()
        If Me.HF_CUS_ID.Value = 0 Then
            lblTitle.Text = "ADD CUSTOMER"
            Me.Title = lblTitle.Text
        Else
            lblTitle.Text = "EDIT CUSTOMER"
            Me.Title = lblTitle.Text
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
                                    Case 127
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_19_R.Value = 1 'Customer Management - R
                                        End If
                                    Case 128
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_19_RW.Value = 1 'Customer Management - RW
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
        Dim ThisID As String = HF_CUS_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "CM - Customer List - Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.CM_CUSTOMER_LIST_RG_SELECT_RW_SP(HF_CUS_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadTxt_Customer_Name.Text = drvSql("CUS_Name").ToString()
            Me.RadTxt_Company_Number.Text = drvSql("CUS_Company_Number").ToString()
            Me.RadTxt_Code.Text = drvSql("CUS_Code").ToString()
            Me.RadTxt_Phone.Text = drvSql("CUS_Phone").ToString()
            Me.RadTxt_Email.Text = drvSql("CUS_Email").ToString()
            Me.RadTxt_Website.Text = drvSql("CUS_Website").ToString()
            Me.RadTxt_Address_1.Text = drvSql("CUS_Address_1").ToString()
            Me.RadTxt_Address_2.Text = drvSql("CUS_Address_2").ToString()
            Me.RadTxt_Address_3.Text = drvSql("CUS_Address_3").ToString()
            Me.RadTxt_City.Text = drvSql("CUS_City").ToString()
            Me.RadTxt_County.Text = drvSql("CUS_County").ToString()
            Me.RadTxt_Postcode.Text = drvSql("CUS_Postcode").ToString()
            Me.RadNumTxt_Discount.Text = drvSql("CUS_Discount").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("CUS_Status").ToString()
            Me.RadTxt_Notes.Text = drvSql("CUS_Notes").ToString()
        End If
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveCustomer(Me.HF_CUS_ID.Value _
                        , RadTxt_Customer_Name.Text _
                        , RadTxt_Company_Number.Text _
                        , RadTxt_Code.Text _
                        , RadTxt_Phone.Text _
                        , RadTxt_Email.Text _
                        , RadTxt_Website.Text _
                        , RadTxt_Address_1.Text _
                        , RadTxt_Address_2.Text _
                        , RadTxt_Address_3.Text _
                        , RadTxt_City.Text _
                        , RadTxt_County.Text _
                        , RadTxt_Postcode.Text _
                        , RadNumTxt_Discount.Text _
                        , RadCB_Status.SelectedValue _
                        , RadTxt_Notes.Text _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("CUS_ID") = Me.HF_CUS_ID.Value
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_19_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_19_RW.Value = 1 Then
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