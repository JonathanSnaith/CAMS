Imports System.Data
Imports System.Data.SqlClient
Partial Class ASSET_MANAGEMENT_flt_AM_ASSET_LIST_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_A_ID.Value = Request.QueryString("A_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Session("A_ID") = Me.HF_A_ID.Value
        Apply_Permissions()

        If Me.HF_A_ID.Value = 0 Then
            lblTitle.Text = "ADD ASSET"
            Me.Title = lblTitle.Text
        Else
            lblTitle.Text = "EDIT ASSET"
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
                                    Case 130
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_2_R.Value = 1 'Asset Management - R
                                        End If
                                    Case 142
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
        Dim ThisID As String = HF_A_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "AM - Asset List - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            If HF_A_ID.Value = 0 Then

            Else
                GetData()
                Setup_Site_Combo()
                Setup_Secondary_Group_Combo()
                Setup_Model_Combo()

            End If

            Setup_Customer_Combo()

            Setup_Primary_Group_Combo()

            Setup_Category_Combo()
            Setup_Type_Combo()
            Setup_Company_Combo()
            Setup_Hire_Company_Combo()


        End If
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.AM_ASSET_LIST_RG_SELECT_RW_SP(HF_A_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadCB_Customer.SelectedValue = drvSql("A_CUS_ID").ToString()
            RadCB_Site.SelectedValue = drvSql("A_SITE_ID").ToString()
            Me.RadTxt_Asset_ID.Text = drvSql("A_Asset_ID").ToString()
            Me.RadTxt_Hire_ID.Text = drvSql("A_Hire_ID").ToString()
            Me.RadCB_PrimaryGroup.SelectedValue = drvSql("A_AP_ID").ToString()
            Setup_Secondary_Group_Combo()
            Me.RadCB_SecondaryGroup.SelectedValue = drvSql("A_AS_ID").ToString()
            Setup_Model_Combo()
            Me.RadCB_Model.SelectedValue = drvSql("A_MOD_ID").ToString()
            GetModel()
            Me.RadCB_Company.SelectedValue = drvSql("A_COM_ID").ToString()
            Me.RadCB_Category.SelectedValue = drvSql("A_CAT_ID").ToString()
            Me.RadCB_Type.SelectedValue = drvSql("A_TYPE_ID").ToString()
            Me.HF_Category.Value = drvSql("A_CAT_ID").ToString()
            Me.RadCB_Activity_Status.SelectedValue = drvSql("A_Activity_Status").ToString()
            Me.RadTxt_Serial_No.Text = drvSql("A_Serial_No").ToString()
            Me.RadCB_Year.SelectedValue = drvSql("A_Year").ToString()
            If IsDBNull(drvSql("A_Date_Purchase")) = False Then
                Me.RadDP_Purchase_Date.SelectedDate = DateTime.Parse(drvSql("A_Date_Purchase")).ToString("dd MMM yyyy")
            End If
            If IsDBNull(drvSql("A_Warranty_Expiry_Date")) = False Then
                Me.RadDP_Warranty_Expiry_Date.SelectedDate = DateTime.Parse(drvSql("A_Warranty_Expiry_Date")).ToString("dd MMM yyyy")
            End If
            If IsDBNull(drvSql("A_Date_Sold")) = False Then
                Me.RadDP_Sold_Date.SelectedDate = DateTime.Parse(drvSql("A_Date_Sold")).ToString("dd MMM yyyy")
            End If
            Me.RadCB_Engine.SelectedValue = drvSql("A_Engine").ToString()
            Select Case Me.RadCB_Engine.SelectedValue
                Case 0
                    Me.lbl_Eng_SMU_1.Visible = False
                    Me.RadTxt_Engine_1_SMU.Visible = False
                    Me.lbl_Eng_Serial.Visible = False
                    Me.RadTxt_Engine_1_Serial.Visible = False
                    Me.lbl_Eng_SMU_2.Visible = False
                    Me.RadTxt_Engine_2_SMU.Visible = False
                    Me.lbl_Eng_Serial_2.Visible = False
                    Me.RadTxt_Engine_2_Serial.Visible = False
                Case 1
                    Me.lbl_Eng_SMU_1.Visible = True
                    Me.RadTxt_Engine_1_SMU.Visible = True
                    Me.RadTxt_Engine_1_SMU.Text = drvSql("A_Eng_SMU_1").ToString()
                    Me.lbl_Eng_Serial.Visible = True
                    Me.RadTxt_Engine_1_Serial.Visible = True
                    Me.RadTxt_Engine_1_Serial.Text = drvSql("A_Eng_Serial_1").ToString()
                    Me.lbl_Eng_SMU_2.Visible = False
                    Me.RadTxt_Engine_2_SMU.Visible = False
                    Me.lbl_Eng_Serial_2.Visible = False
                    Me.RadTxt_Engine_2_Serial.Visible = False
                Case 2
                    Me.lbl_Eng_SMU_1.Visible = True
                    Me.RadTxt_Engine_1_SMU.Visible = True
                    Me.RadTxt_Engine_1_SMU.Text = drvSql("A_Eng_SMU_1").ToString()
                    Me.lbl_Eng_Serial.Visible = True
                    Me.RadTxt_Engine_1_Serial.Visible = True
                    Me.RadTxt_Engine_1_Serial.Text = drvSql("A_Eng_Serial_1").ToString()
                    Me.lbl_Eng_SMU_2.Visible = True
                    Me.RadTxt_Engine_2_SMU.Visible = True
                    Me.RadTxt_Engine_2_SMU.Text = drvSql("A_Eng_SMU_2").ToString()
                    Me.lbl_Eng_Serial_2.Visible = True
                    Me.RadTxt_Engine_2_Serial.Visible = True
                    Me.RadTxt_Engine_2_Serial.Text = drvSql("A_Eng_Serial_2").ToString()
                Case Else
                    Me.lbl_Eng_SMU_1.Visible = False
                    Me.RadTxt_Engine_1_SMU.Visible = False
                    Me.lbl_Eng_Serial.Visible = False
                    Me.RadTxt_Engine_1_Serial.Visible = False
                    Me.lbl_Eng_SMU_2.Visible = False
                    Me.RadTxt_Engine_2_SMU.Visible = False
                    Me.lbl_Eng_Serial_2.Visible = False
                    Me.RadTxt_Engine_2_Serial.Visible = False
            End Select
            Me.RadTxt_Purchase_SMU.Text = drvSql("A_Purchase_SMU").ToString()
            Me.RadTxt_Sold_SMU.Text = drvSql("A_Sold_SMU").ToString()
            Me.RadCB_HireCompany.SelectedValue = drvSql("A_HC_ID").ToString()
            Me.RadNumTxt_Hire_Rate.Text = drvSql("A_Hire_Rate").ToString()
            Me.RadNumTxt_Hire_Rate_External.Text = drvSql("A_Hire_Rate_External").ToString()
            Me.RadNumTxt_Transport_On.Text = drvSql("A_Transport_Rate_On").ToString()
            Me.RadNumTxt_Transport_Off.Text = drvSql("A_Transport_Rate_Off").ToString()
            Me.RadTxt_Order_Number.Text = drvSql("A_Order_Number").ToString()
            Me.RadTxt_Off_Hire_Number.Text = drvSql("A_Off_Hire_Number").ToString()
            Me.RadNumTxt_Insurance_Value.Text = drvSql("A_Insurance_Value").ToString()
            Me.RadNumTxt_Insurance_NFO.Text = drvSql("A_Insurance_New_For_Old_Value").ToString()
            Me.RadCB_Insurance_Status.SelectedValue = drvSql("A_Insurance_Status").ToString()
            Me.lbl_Weeks.Text = drvSql("A_Weeks").ToString()
            Me.RadNumTxt_Cost_To_Date.Text = drvSql("A_Cost_To_Date").ToString()
            Me.RadCB_Hire_Rate_Unit.SelectedValue = drvSql("A_Hire_Rate_Unit").ToString()
            Me.RadCB_Hire_Rate_Unit_External.SelectedValue = drvSql("A_Hire_Rate_Unit_External").ToString()
            Me.RadTxt_Hours_Hire.Text = drvSql("A_Hours_Hire").ToString()
            Me.RadNumTxt_Excess_Hour_Rate.Text = drvSql("A_Excess_Hour_Rate").ToString()
            Me.RadCB_Spec_Type.SelectedValue = drvSql("A_Spec_Type").ToString()
            Me.RadCB_Body_Type.SelectedValue = drvSql("A_Body_Type").ToString()
            Me.RadTxt_Blade_Bucket_Size.Text = drvSql("A_Blade_Bucket_Size").ToString()
            Me.RadTxt_Track_Tyre_Size.Text = drvSql("A_Track_Tyre_Size").ToString()
            Me.RadTxt_Body_Capacity.Text = drvSql("A_Body_Capacity").ToString()
            Me.RadTxt_Operating_Weight.Text = drvSql("A_Operating_Weight").ToString()
            Me.RadTxt_CO_Emissions.Text = drvSql("A_CO_Emissions").ToString()
            Me.RadTxt_Nox_Emissions.Text = drvSql("A_Nox_Emissions").ToString()
            Me.RadTxt_HC_Emissions.Text = drvSql("A_HC_Emissions").ToString()
            Me.RadTxt_Particulates.Text = drvSql("A_Particulates").ToString()
            Me.RadTxt_External_Noise_dB.Text = drvSql("A_External_Noise_dB").ToString()
            Me.RadTxt_External_Noise_Power.Text = drvSql("A_External_Noise_Power").ToString()
            Me.RadTxt_Estimated_Disposal_Hours.Text = drvSql("A_Estimated_Disposal_Hours").ToString()
            Me.RadTxt_Operator_Ear_dB.Text = drvSql("A_Operator_Ear_dB").ToString()
            Me.RadTxt_Operator_Ear_Power.Text = drvSql("A_Operator_Ear_Power").ToString()
            Me.RadCB_Telemetry.SelectedValue = drvSql("A_Telemetry").ToString()
            If RadCB_SecondaryGroup.SelectedValue = 71 Then
                Me.lbl_Prime_Mover_Report.Visible = True
                Me.RadCB_Prime_Mover_Report.Visible = True
                Me.RadCB_Prime_Mover_Report.SelectedValue = drvSql("A_Prime_Mover_Report").ToString()
                Me.lbl_Plant_Rate_Insitu.Visible = True
                Me.RadNumTxt_Plant_Rate_Insitu.Visible = True
                Me.RadNumTxt_Plant_Rate_Insitu.Text = drvSql("A_Plant_Rate_Insitu").ToString()
                Me.lbl_Plant_Rate_Soils.Visible = True
                Me.RadNumTxt_Plant_Rate_Soils.Visible = True
                Me.RadNumTxt_Plant_Rate_Soils.Text = drvSql("A_Plant_Rate_Soils").ToString()
            ElseIf RadCB_SecondaryGroup.SelectedValue = 90 Then
                Me.RadCB_Prime_Mover_Report.ClearSelection()
                Me.lbl_Prime_Mover_Report.Visible = False
                Me.RadCB_Prime_Mover_Report.Visible = False
                Me.lbl_Plant_Rate_Insitu.Visible = True
                Me.RadNumTxt_Plant_Rate_Insitu.Visible = True
                Me.RadNumTxt_Plant_Rate_Insitu.Text = drvSql("A_Plant_Rate_Insitu").ToString()
                Me.lbl_Plant_Rate_Soils.Visible = True
                Me.RadNumTxt_Plant_Rate_Soils.Visible = True
                Me.RadNumTxt_Plant_Rate_Soils.Text = drvSql("A_Plant_Rate_Soils").ToString()
            Else
                Me.RadCB_Prime_Mover_Report.ClearSelection()
                Me.lbl_Prime_Mover_Report.Visible = False
                Me.RadCB_Prime_Mover_Report.Visible = False
                Me.lbl_Plant_Rate_Insitu.Visible = False
                Me.RadNumTxt_Plant_Rate_Insitu.Visible = False
                Me.lbl_Plant_Rate_Soils.Visible = False
                Me.RadNumTxt_Plant_Rate_Soils.Visible = False
            End If
            Me.RadNumTxt_Production_Rate.Text = drvSql("A_Production_Rate").ToString()
            Me.RadCB_Brake_Test.SelectedValue = drvSql("A_Brake_Test").ToString()
            Me.RadCB_Timesheet.SelectedValue = drvSql("A_Timesheet").ToString()
            Me.RadCB_SMU.SelectedValue = drvSql("A_SMU").ToString()
            Me.RadCB_Fuel.SelectedValue = drvSql("A_Fuel").ToString()
            Me.RadCB_Fuel_Type.SelectedValue = drvSql("A_Fuel_Type").ToString()
            Me.RadCB_Inspection.SelectedValue = drvSql("A_Inspection").ToString()
            Me.lbl_Service_Text.Text = drvSql("Servicable").ToString()
            If lbl_Service_Text.Text = "No" Then
                Me.RadCB_Service.Visible = True
                Me.lbl_Service_Text.Visible = False
            Else
                Me.RadCB_Service.Visible = False
                Me.lbl_Service_Text.Visible = True
            End If
            Me.lbl_Fire.Text = drvSql("FireSup").ToString()
            Me.lbl_Exam.Text = drvSql("Examinations").ToString()
            Me.RadCB_Hired.SelectedValue = drvSql("A_Hire").ToString()
            Me.HF_ServiceCycle.Value = drvSql("A_ST_ID").ToString()
            Me.RadCB_Status.SelectedValue = drvSql("A_Status").ToString()
            Me.RadTxt_Photo_Link.Text = drvSql("A_Photo_Link").ToString()
            Me.Image1.ImageUrl = drvSql("A_Photo_Link").ToString()
            Me.RadTxt_QR_Link.Text = drvSql("A_QR_Link").ToString()
            Me.Image2.ImageUrl = drvSql("A_QR_Link").ToString()
            Me.RadTxt_Notes.Text = drvSql("A_Notes").ToString()
            Me.RadCB_Service_Status.SelectedValue = drvSql("A_Service_Status").ToString()
            Me.HF_Service_Status_Prev.Value = drvSql("A_Service_Status").ToString()
            Me.RadCB_Planning_Status.SelectedValue = drvSql("A_Planning_Status").ToString()
            Me.HF_Planning_Status_Prev.Value = drvSql("A_Planning_Status").ToString()
            If Me.lbl_Service_Text.Text = "Yes" Then
                Me.lbl_Fire.Visible = True
                Me.lbl_Exam.Visible = True
                Me.lbl_Fire_Text.Visible = True
                Me.lbl_Exam_Text.Visible = True
            Else
                Me.lbl_Fire.Visible = False
                Me.lbl_Exam.Visible = False
                Me.lbl_Fire_Text.Visible = False
                Me.lbl_Exam_Text.Visible = False
            End If
            GetRateVariance()
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames(RadCB_Customer, False)
    End Sub
    Private Sub Setup_Site_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Site = Setup.Populate_SiteNames(RadCB_Site, RadCB_Customer.SelectedValue, False)
    End Sub
    Private Sub Setup_Primary_Group_Combo()
        Dim Setup As New Setup.Combo
        RadCB_PrimaryGroup = Setup.Populate_AttributeDropdown(RadCB_PrimaryGroup, False, "ASSET_Primary")
    End Sub
    Private Sub Setup_Secondary_Group_Combo()
        Dim Setup As New Setup.Combo
        RadCB_SecondaryGroup = Setup.Populate_AttributeDropdownfromotherAttribute(RadCB_SecondaryGroup, False, "ASSET_Secondary", RadCB_PrimaryGroup.SelectedValue)
    End Sub
    Private Sub Setup_Category_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Category = Setup.Populate_AttributeDropdown(RadCB_Category, False, "ASSET_Category")
    End Sub
    Private Sub Setup_Type_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Type = Setup.Populate_AttributeDropdown(RadCB_Type, False, "ASSET_Type")
    End Sub
    Private Sub Setup_Company_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Company = Setup.Populate_AttributeDropdown(RadCB_Company, False, "ASSET_Company")
    End Sub
    Private Sub Setup_Hire_Company_Combo()
        Dim Setup As New Setup.Combo
        RadCB_HireCompany = Setup.Populate_AttributeDropdown(RadCB_HireCompany, False, "ASSET_Hire_Company")
    End Sub
    Private Sub Setup_Model_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Model = Setup.Populate_AttributeDropdownfromotherAttribute(RadCB_Model, False, "ASSET_Model", RadCB_SecondaryGroup.SelectedValue)
    End Sub
#End Region
    Sub GetModel()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dt As DataTable = qry.GetModelfromAsset(HF_A_ID.Value)
            If dt.Rows.Count > 0 Then
                Dim drvSql As DataRow = dt.Rows(0)
                Dim abc As String
                abc = drvSql("A_MOD_ID").ToString()
                If abc = -1 Then
                    Me.RadCB_Model.SelectedValue = 256
                End If
                Exit Sub
            End If
    End Sub
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveAsset(HF_A_ID.Value _
                        , RadCB_Customer.SelectedValue _
                        , RadTxt_Asset_ID.Text _
                        , RadCB_Model.SelectedValue _
                        , RadCB_PrimaryGroup.SelectedValue _
                        , RadCB_SecondaryGroup.SelectedValue _
                        , RadCB_Company.SelectedValue _
                        , RadCB_Category.SelectedValue _
                        , RadCB_Type.SelectedValue _
                        , RadCB_Site.SelectedValue _
                        , RadNumTxt_Plant_Rate_Insitu.Text _
                        , RadNumTxt_Plant_Rate_Soils.Text _
                        , RadNumTxt_Production_Rate.Text _
                        , RadCB_Activity_Status.SelectedValue _
                        , RadTxt_Serial_No.Text _
                        , RadCB_Year.SelectedValue _
                        , If(IsNothing(RadDP_Purchase_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Purchase_Date.SelectedDate) _
                        , RadCB_Engine.SelectedValue _
                        , RadTxt_Engine_1_SMU.Text _
                        , RadTxt_Engine_2_SMU.Text _
                        , RadTxt_Engine_1_Serial.Text _
                        , RadTxt_Engine_2_Serial.Text _
                        , RadTxt_Order_Number.Text _
                        , RadTxt_Off_Hire_Number.Text _
                        , RadTxt_Hire_ID.Text _
                        , RadCB_HireCompany.SelectedValue _
                        , RadNumTxt_Hire_Rate.Text _
                        , RadNumTxt_Hire_Rate_External.Text _
                        , RadCB_Hire_Rate_Unit.Text _
                        , RadCB_Hire_Rate_Unit_External.Text _
                        , RadTxt_Hours_Hire.Text _
                        , RadNumTxt_Excess_Hour_Rate.Text _
                        , RadNumTxt_Transport_On.Text _
                        , RadNumTxt_Transport_Off.Text _
                        , RadNumTxt_Insurance_Value.Text _
                        , RadNumTxt_Insurance_NFO.Text _
                        , RadCB_Insurance_Status.SelectedValue _
                        , RadCB_Telemetry.SelectedValue _
                        , RadCB_Prime_Mover_Report.SelectedValue _
                        , RadCB_Brake_Test.SelectedValue _
                        , RadCB_Timesheet.SelectedValue _
                        , RadCB_SMU.SelectedValue _
                        , RadCB_Fuel.SelectedValue _
                        , RadCB_Fuel_Type.SelectedValue _
                        , RadCB_Service.SelectedValue _
                        , RadCB_Service_Status.SelectedValue _
                        , RadCB_Planning_Status.SelectedValue _
                        , RadCB_Hired.SelectedValue _
                        , RadCB_Inspection.SelectedValue _
                        , RadCB_Spec_Type.SelectedValue _
                        , RadTxt_Blade_Bucket_Size.Text _
                        , RadTxt_Track_Tyre_Size.Text _
                        , RadCB_Body_Type.SelectedValue _
                        , RadTxt_Body_Capacity.Text _
                        , RadTxt_Operating_Weight.Text _
                        , RadTxt_Purchase_SMU.Text _
                        , If(IsNothing(RadDP_Warranty_Expiry_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Warranty_Expiry_Date.SelectedDate) _
                        , RadTxt_Estimated_Disposal_Hours.Text _
                        , If(IsNothing(RadDP_Sold_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Sold_Date.SelectedDate) _
                        , RadTxt_Sold_SMU.Text _
                        , RadTxt_CO_Emissions.Text _
                        , RadTxt_Nox_Emissions.Text _
                        , RadTxt_HC_Emissions.Text _
                        , RadTxt_Particulates.Text _
                        , RadTxt_External_Noise_dB.Text _
                        , RadTxt_External_Noise_Power.Text _
                        , RadTxt_Operator_Ear_dB.Text _
                        , RadTxt_Operator_Ear_Power.Text _
                        , RadCB_Status.SelectedValue _
                        , RadTxt_Photo_Link.Text _
                        , RadTxt_QR_Link.Text _
                        , RadTxt_Notes.Text _
                        , HF_Username.Value _
                        , HF_Username.Value)

        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("A_ID") = Me.HF_A_ID.Value
    End Sub
    Protected Sub RadCB_Engine_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Engine.SelectedIndexChanged
        Select Case Me.RadCB_Engine.SelectedValue
            Case 0
                Me.lbl_Eng_SMU_1.Visible = False
                Me.RadTxt_Engine_1_SMU.Visible = False
                Me.lbl_Eng_Serial.Visible = False
                Me.RadTxt_Engine_1_Serial.Visible = False
                Me.lbl_Eng_SMU_2.Visible = False
                Me.RadTxt_Engine_2_SMU.Visible = False
                Me.lbl_Eng_Serial_2.Visible = False
                Me.RadTxt_Engine_2_Serial.Visible = False
            Case 1
                Me.lbl_Eng_SMU_1.Visible = True
                Me.RadTxt_Engine_1_SMU.Visible = True
                Me.lbl_Eng_Serial.Visible = True
                Me.RadTxt_Engine_1_Serial.Visible = True
                Me.lbl_Eng_SMU_2.Visible = False
                Me.RadTxt_Engine_2_SMU.Visible = False
                Me.lbl_Eng_Serial_2.Visible = False
                Me.RadTxt_Engine_2_Serial.Visible = False
            Case 2
                Me.lbl_Eng_SMU_1.Visible = True
                Me.RadTxt_Engine_1_SMU.Visible = True
                Me.lbl_Eng_Serial.Visible = True
                Me.RadTxt_Engine_1_Serial.Visible = True
                Me.lbl_Eng_SMU_2.Visible = True
                Me.RadTxt_Engine_2_SMU.Visible = True
                Me.lbl_Eng_Serial_2.Visible = True
                Me.RadTxt_Engine_2_Serial.Visible = True
            Case Else
                Me.lbl_Eng_SMU_1.Visible = False
                Me.RadTxt_Engine_1_SMU.Visible = False
                Me.lbl_Eng_Serial.Visible = False
                Me.RadTxt_Engine_1_Serial.Visible = False
                Me.lbl_Eng_SMU_2.Visible = False
                Me.RadTxt_Engine_2_SMU.Visible = False
                Me.lbl_Eng_Serial_2.Visible = False
                Me.RadTxt_Engine_2_Serial.Visible = False
        End Select
    End Sub
    Protected Sub RadCB_PrimaryGroup_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_PrimaryGroup.SelectedIndexChanged
        Me.RadCB_SecondaryGroup.ClearSelection()
        Setup_Secondary_Group_Combo()
    End Sub
    Protected Sub RadCB_SecondaryGroup_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_SecondaryGroup.SelectedIndexChanged
        Setup_Model_Combo()
        Me.RadCB_Model.SelectedValue = 256
        If RadCB_SecondaryGroup.SelectedValue = 71 Then
            Me.RadCB_Prime_Mover_Report.ClearSelection()
            Me.lbl_Prime_Mover_Report.Visible = True
            Me.RadCB_Prime_Mover_Report.Visible = True
            Me.lbl_Plant_Rate_Insitu.Visible = True
            Me.RadNumTxt_Plant_Rate_Insitu.Visible = True
            Me.lbl_Plant_Rate_Soils.Visible = True
            Me.RadNumTxt_Plant_Rate_Soils.Visible = True
        ElseIf RadCB_SecondaryGroup.SelectedValue = 90 Then
            Me.RadCB_Prime_Mover_Report.ClearSelection()
            Me.lbl_Prime_Mover_Report.Visible = False
            Me.RadCB_Prime_Mover_Report.Visible = False
            Me.lbl_Plant_Rate_Insitu.Visible = True
            Me.RadNumTxt_Plant_Rate_Insitu.Visible = True
            Me.lbl_Plant_Rate_Soils.Visible = True
            Me.RadNumTxt_Plant_Rate_Soils.Visible = True
        Else
            Me.RadCB_Prime_Mover_Report.ClearSelection()
            Me.lbl_Prime_Mover_Report.Visible = False
            Me.RadCB_Prime_Mover_Report.Visible = False
            Me.lbl_Plant_Rate_Insitu.Visible = False
            Me.RadNumTxt_Plant_Rate_Insitu.Visible = False
            Me.lbl_Plant_Rate_Soils.Visible = False
            Me.RadNumTxt_Plant_Rate_Soils.Visible = False
        End If
    End Sub
    Sub GetRateVariance()
        If RadNumTxt_Hire_Rate.Value IsNot Nothing And RadNumTxt_Hire_Rate_External.Value IsNot Nothing Then
            If RadCB_Hire_Rate_Unit.SelectedValue = RadCB_Hire_Rate_Unit_External.SelectedValue Then
                lblRateVariance.Text = (CDbl(RadNumTxt_Hire_Rate.Value) - CDbl(RadNumTxt_Hire_Rate_External.Value)) / CDbl(RadNumTxt_Hire_Rate_External.Value) * 100
                Dim Val As Decimal = Convert.ToDouble(lblRateVariance.Text)
                lblRateVariance.Text = Math.Round(Val, 2)
                lblRateVariance.Text = lblRateVariance.Text + "%"
            Else
                lblRateVariance.Text = "N/A"
            End If
        Else
            lblRateVariance.Text = "N/A"
        End If
    End Sub
    Protected Sub RadNumTxt_Hire_Rate_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Hire_Rate.TextChanged
        GetRateVariance()
    End Sub
    Protected Sub RadNumTxt_Hire_Rate_External_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Hire_Rate_External.TextChanged
        GetRateVariance()
    End Sub
    Protected Sub RadCB_Hire_Rate_Unit_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Hire_Rate_Unit.SelectedIndexChanged
        GetRateVariance()
    End Sub
    Protected Sub RadCB_Hire_Rate_Unit_External_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Hire_Rate_Unit_External.SelectedIndexChanged
        GetRateVariance()
    End Sub
    Protected Sub RadTxt_Photo_Link_TextChanged(sender As Object, e As EventArgs) Handles RadTxt_Photo_Link.TextChanged
        Me.Image1.ImageUrl = Me.RadTxt_Photo_Link.Text
    End Sub
    Protected Sub RadTxt_QR_Link_TextChanged(sender As Object, e As EventArgs) Handles RadTxt_QR_Link.TextChanged
        Me.Image2.ImageUrl = Me.RadTxt_QR_Link.Text
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
    Protected Sub RadTxt_Asset_ID_TextChanged(sender As Object, e As EventArgs) Handles RadTxt_Asset_ID.TextChanged
        Me.Img_AssetID_Yes.Visible = False
        Me.Img_AssetID_No.Visible = False
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetAssetNameCheck(RadTxt_Asset_ID.Text, RadCB_Customer.SelectedValue)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            HF_NameCheck.Value = drvSql("A_Asset_ID").ToString()
            HF_CusCheck.Value = drvSql("A_CUS_ID").ToString()
            If HF_NameCheck.Value = RadTxt_Asset_ID.Text And HF_CusCheck.Value = RadCB_Customer.SelectedValue Then
                Me.Img_AssetID_No.Visible = True
                RadNotify.Text = "Asset ID already exists for this customer. Please specify a different name."
                RadNotify.Show()
                RadTxt_Asset_ID.Text = ""
                RadTxt_Asset_ID.Focus()
            End If
            Exit Sub
        End If
        If HF_NameCheck.Value = Nothing Then
            Me.Img_AssetID_Yes.Visible = True
        End If
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        If RadCB_Customer.SelectedValue <> "" Then
            Me.RadTxt_Asset_ID.Visible = True
        Else
            Me.RadTxt_Asset_ID.Visible = False
        End If
        RadCB_Site.ClearSelection()
        Setup_Site_Combo()
    End Sub
End Class