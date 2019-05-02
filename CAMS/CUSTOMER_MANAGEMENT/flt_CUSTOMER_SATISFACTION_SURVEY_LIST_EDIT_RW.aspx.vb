Imports System.Data
Imports System.Data.SqlClient
Partial Class CUSTOMER_MANAGEMENT_flt_CUSTOMER_SATISFACTION_SURVEY_LIST_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_CS_ID.Value = Request.QueryString("CS_ID")
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
        Session("CS_ID") = Me.HF_CS_ID.Value
        Apply_Permissions()

        If Me.HF_CS_ID.Value = 0 Then
            lblTitle.Text = "ADD SURVEY"
            Me.Title = lblTitle.Text
        Else
            lblTitle.Text = "EDIT SURVEY"
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
        Dim ThisID As String = HF_CS_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "CM - Customer Satisfaction Survey List - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If

        If Not Me.IsPostBack Then
            Setup_Customer_Combo()
            Setup_Engineer_Combo()
            GetData()
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.CM_CUSTOMER_SATISFACTION_SURVEY_RG_SELECT_RW_SP(HF_CS_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadCB_Customer.SelectedValue = drvSql("CS_CUS_ID").ToString()
            Me.RadCB_Engineer.SelectedValue = drvSql("CS_Engineer_ID").ToString()
            Me.RadNumTxt_Q1.Text = drvSql("CS_Q1").ToString()
            Me.RadNumTxt_Q2.Text = drvSql("CS_Q2").ToString()
            Me.RadNumTxt_Q3.Text = drvSql("CS_Q3").ToString()
            Me.RadNumTxt_Q4.Text = drvSql("CS_Q4").ToString()
            Me.RadNumTxt_Q5.Text = drvSql("CS_Q5").ToString()
            Me.RadNumTxt_Q6.Text = drvSql("CS_Q6").ToString()
            Me.RadNumTxt_Q7.Text = drvSql("CS_Q7").ToString()
            Me.RadNumTxt_Q8.Text = drvSql("CS_Q8").ToString()
            Me.RadNumTxt_Q9.Text = drvSql("CS_Q9").ToString()
            Me.RadNumTxt_Q10.Text = drvSql("CS_Q10").ToString()
            Me.RadNumTxt_Q11.Text = drvSql("CS_Q11").ToString()
            Me.RadNumTxt_Q12.Text = drvSql("CS_Q12").ToString()
            Me.RadNumTxt_Q13.Text = drvSql("CS_Q13").ToString()
            Me.RadNumTxt_Q14.Text = drvSql("CS_Q14").ToString()
            If HF_CS_ID.Value <> 0 Then
                Me.lbl_Total_Text.Visible = True
                Me.lbl_Total_PCT_Text.Visible = True
                Me.lbl_Total.Visible = True
                Me.lbl_Total_PCT.Visible = True
                Me.lbl_Total.Text = drvSql("CS_Total").ToString()
                Me.lbl_Total_PCT.Text = drvSql("CS_Total_PCT").ToString() + "%"
            Else
                Me.lbl_Total_Text.Visible = False
                Me.lbl_Total_PCT_Text.Visible = False
                Me.lbl_Total.Visible = False
                Me.lbl_Total_PCT.Visible = False
            End If
            Me.RadTxt_Notes.Text = drvSql("CS_Notes").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("CS_Status").ToString()
        End If
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
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames(RadCB_Customer, False)
    End Sub

    Private Sub Setup_Engineer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers(RadCB_Engineer, True, HF_CS_ID.Value)
    End Sub
#End Region
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveCustomerSatisfaction(Me.HF_CS_ID.Value _
                        , RadCB_Customer.SelectedValue _
                        , RadCB_Engineer.SelectedValue _
                        , RadNumTxt_Q1.Text _
                        , RadNumTxt_Q2.Text _
                        , RadNumTxt_Q3.Text _
                        , RadNumTxt_Q4.Text _
                        , RadNumTxt_Q5.Text _
                        , RadNumTxt_Q6.Text _
                        , RadNumTxt_Q7.Text _
                        , RadNumTxt_Q8.Text _
                        , RadNumTxt_Q9.Text _
                        , RadNumTxt_Q10.Text _
                        , RadNumTxt_Q11.Text _
                        , RadNumTxt_Q12.Text _
                        , RadNumTxt_Q13.Text _
                        , RadNumTxt_Q14.Text _
                        , RadTxt_Notes.Text _
                        , RadCB_Status.SelectedValue _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("CS_ID") = Me.HF_CS_ID.Value
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