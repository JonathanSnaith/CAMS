Imports System.Data
Imports System.Data.SqlClient
Partial Class DATA_INPUT_flt_MAGNETIC_PLUG_INSPECTIONS_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_MPI_ID.Value = Request.QueryString("MPI_ID")
        Me.lbl_MPI_ID.Text = Request.QueryString("MPI_ID")
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
                                    Case 135
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_7_R.Value = 1 'Data Input - R
                                        End If
                                    Case 146
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
        Dim ThisID As String = HF_MPI_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "Data Input - Magnetic Plug Inspection - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            If HF_MPI_ID.Value = "0" Then
            Else
                GetData()
            End If
            Setup_Customer_Combo()
            Setup_Asset_Combo()
            Setup_Compartment_Combo()
            Setup_Visual_Rating_Combo()
            Setup_Engineer_Combo()
        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.DATA_INPUT_MAGNETIC_PLUG_INSPECTIONS_SELECT_RW_SP(HF_MPI_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lbl_Created.Text = DateTime.Parse(drvSql("MPI_Created")).ToString("dd MMM yyyy HH:mm")
            Me.lbl_Modified.Text = DateTime.Parse(drvSql("MPI_Modified")).ToString("dd MMM yyyy HH:mm")
            Me.RadCB_Customer.SelectedValue = drvSql("MPI_CUS_ID").ToString()
            Setup_Asset_Combo()
            Me.RadCB_Asset.SelectedValue = drvSql("MPI_A_ID").ToString()
            Me.HF_A_ID.Value = drvSql("MPI_A_ID").ToString()
            Setup_Compartment_Combo()
            Me.RadCB_Compartment.SelectedValue = drvSql("MPI_CP_ID").ToString()
            Setup_Visual_Rating_Combo()
            Me.RadCB_Visual_Rating.SelectedValue = drvSql("MPI_VR_ID").ToString()
            Setup_Engineer_Combo()
            Me.RadCB_Inspector.SelectedValue = drvSql("MPI_INS_ID").ToString()
            If IsDBNull(drvSql("MPI_Date")) = False Then
                Me.RadDP_Date.SelectedDate = DateTime.Parse(drvSql("MPI_Date")).ToString("dd MMM yyyy")
            End If
            Me.RadTxt_SMU.Text = drvSql("MPI_SMU").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("MPI_Status").ToString()
            Me.RadTxt_Link.Text = drvSql("MPI_Photo_Link").ToString()
            Me.Image1.ImageUrl = drvSql("MPI_Photo_Link").ToString()
            Me.Image2.ImageUrl = drvSql("MPI_Signature_Link").ToString()
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames(RadCB_Customer, False)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames(RadCB_Asset, RadCB_Customer.SelectedValue, -1)
    End Sub
    Private Sub Setup_Compartment_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Compartment = Setup.Populate_AttributeDropdown(RadCB_Compartment, False, "COMPARTMENT")
    End Sub
    Private Sub Setup_Visual_Rating_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Visual_Rating = Setup.Populate_AttributeDropdown(RadCB_Visual_Rating, False, "VISUAL_RATING")
    End Sub
    Private Sub Setup_Engineer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Inspector = Setup.Populate_Engineers_StringID(RadCB_Inspector, False, HF_MPI_ID.Value)
    End Sub
#End Region
    Protected Sub RadTxt_Link_TextChanged(sender As Object, e As EventArgs) Handles RadTxt_Link.TextChanged
        Me.Image1.ImageUrl = Me.RadTxt_Link.Text
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveMagPlugs(Me.HF_MPI_ID.Value _
                        , RadCB_Customer.SelectedValue _
                        , RadCB_Asset.SelectedValue _
                        , RadCB_Compartment.SelectedValue _
                        , RadCB_Visual_Rating.SelectedValue _
                        , RadCB_Inspector.SelectedValue _
                        , RadTxt_SMU.Text _
                        , RadTxt_Link.Text _
                        , If(IsNothing(RadDP_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Date.SelectedDate) _
                        , RadCB_Status.SelectedValue _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("MPI_ID") = Me.HF_MPI_ID.Value
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