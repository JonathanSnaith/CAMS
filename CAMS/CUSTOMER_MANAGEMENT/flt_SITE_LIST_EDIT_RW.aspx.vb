Imports System.Data
Imports System.Data.SqlClient
Partial Class CUSTOMER_MANAGEMENT_flt_SITE_LIST_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_SITE_ID.Value = Request.QueryString("SITE_ID")
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
        Session("SITE_ID") = Me.HF_SITE_ID.Value
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
        Dim ThisID As String = HF_SITE_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "CM - Site List - Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            Setup_Customer_Combo()
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.CM_SITE_LIST_RG_SELECT_RW_SP(HF_SITE_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadTxt_Site_Name.Text = drvSql("SITE_Name").ToString()
            Me.RadCB_Customer.SelectedValue = drvSql("SITE_CUS_ID").ToString()
            Me.RadCB_Address_Type.Text = drvSql("SITE_Address_Type").ToString()
            Me.RadTxt_Address_1.Text = drvSql("SITE_Address_1").ToString()
            Me.RadTxt_Address_2.Text = drvSql("SITE_Address_2").ToString()
            Me.RadTxt_Address_3.Text = drvSql("SITE_Address_3").ToString()
            Me.RadTxt_City.Text = drvSql("SITE_City").ToString()
            Me.RadTxt_County.Text = drvSql("SITE_County").ToString()
            Me.RadTxt_Postcode.Text = drvSql("SITE_Postcode").ToString()
            Me.RadTxt_Lat.Text = drvSql("SITE_Lat").ToString()
            Me.RadTxt_Lon.Text = drvSql("SITE_Lon").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("SITE_Status").ToString()
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames(RadCB_Customer, False)
    End Sub
#End Region
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveSite(Me.HF_SITE_ID.Value _
                        , RadCB_Customer.SelectedValue _
                        , RadTxt_Site_Name.Text _
                        , RadCB_Address_Type.Text _
                        , RadTxt_Address_1.Text _
                        , RadTxt_Address_2.Text _
                        , RadTxt_Address_3.Text _
                        , RadTxt_City.Text _
                        , RadTxt_County.Text _
                        , RadTxt_Postcode.Text _
                        , RadTxt_Lat.Text _
                        , RadTxt_Lon.Text _
                        , RadCB_Status.SelectedValue _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("SITE_ID") = Me.HF_SITE_ID.Value
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        ShowHideSave()
    End Sub
    Sub ShowHideSave()
        If RadCB_Customer.SelectedValue = -1 Then
            Me.Btn_Save.Visible = False
        Else
            Me.Btn_Save.Visible = True
            Apply_Permissions()
        End If
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