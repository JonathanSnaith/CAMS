Imports System.Data
Imports System.Data.SqlClient
Partial Class CLIENT_flt_MAIN_HOME
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Dim PreviousPage As Integer = Request.QueryString("PreviousPage")
        Me.HF_PreviousPage.value = PreviousPage
        If HF_PreviousPage.value = "" Then Me.HF_PreviousPage.value = "0"
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)

        Select Case HF_PreviousPage.Value
            Case "0"
                HF_button.Value = "Home"
            Case "1"
                HF_button.Value = "Analysis"
            Case "2"
                HF_button.Value = "Condition Monitoring"
            Case "3"
                HF_button.Value = "Event Dashboard"
            Case "4"
                HF_button.Value = "Data Input"
            Case "5"
                HF_button.Value = "Reports"
            Case "6"
                HF_button.Value = "Asset Management"
            Case "7"
                HF_button.Value = "Component Management"
            Case "8"
                HF_button.Value = "Event Management"
            Case "9"
                HF_button.Value = "Servicing"
            Case "10"
                HF_button.Value = "Plant Activity"
            Case "11"
                HF_button.Value = "Admin"
            Case "12"
                HF_button.Value = "Customer Management"
            Case Else
                HF_button.Value = "Home"
        End Select
        GetCustomerPreferences()
        Apply_Permissions()
        Box1()
        Box2()
        Box3()
        Box4()
        Box5()
        'Box6()
        'Box7()
        'Box8()
        ' Box9()
        GetSYS()
    End Sub
    Sub GetSYS()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GET_SYS_SP()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        End If
    End Sub
    Sub GetThresholdFromWidget()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetThresholdFromWidget(WT_Area.Value, WT_No.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.WT_Name.Value = drvSql("WT_Name").ToString()
            Me.WT_Desc.Value = drvSql("WT_Description").ToString()
            Me.WT_Green.Value = drvSql("WT_Green").ToString()
            Me.WT_Amber.Value = drvSql("WT_Amber").ToString()
            Me.WT_Red.Value = drvSql("WT_Red").ToString()
        End If
    End Sub
    Sub GetCustomerPreferences()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GET_CUSTOMER_PREFERENCES(HF_CUS_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_ANALYSIS_0.Value = drvSql("CUSP_ANALYSIS_0").ToString() 'ANALYSIS & STATISTICS - HOME
            Me.HF_ANALYSIS_1.Value = drvSql("CUSP_ANALYSIS_1").ToString() 'PLANT ANALYSIS DASH
            Me.HF_ANALYSIS_2.Value = drvSql("CUSP_ANALYSIS_2").ToString() 'ENGINEERS DASH
            Me.HF_ANALYSIS_3.Value = drvSql("CUSP_ANALYSIS_3").ToString() 'MAGNETIC PLUGS DASH
            Me.HF_ANALYSIS_4.Value = drvSql("CUSP_ANALYSIS_4").ToString() 'BRAKE TESTING DASH
            Me.HF_ANALYSIS_5.Value = drvSql("CUSP_ANALYSIS_5").ToString() 'PRIME MOVERS DASH
            Me.HF_ANALYSIS_6.Value = drvSql("CUSP_ANALYSIS_6").ToString() 'PROCESSING PLANT DASH
            Me.HF_ANALYSIS_7.Value = drvSql("CUSP_ANALYSIS_7").ToString() 'PRODUCTION DASH
            Me.HF_ANALYSIS_8.Value = drvSql("CUSP_ANALYSIS_8").ToString() 'ASSET COSTING DASH
            Me.HF_ANALYSIS_9.Value = drvSql("CUSP_ANALYSIS_9").ToString() 'PLANT RESOURCE EFFICIENCY DASH
            Me.HF_ANALYSIS_10.Value = drvSql("CUSP_ANALYSIS_10").ToString() 'HOSES DASH
            Me.HF_ANALYSIS_11.Value = drvSql("CUSP_ANALYSIS_11").ToString() 'TYRES DASH
            Me.HF_ANALYSIS_12.Value = drvSql("CUSP_ANALYSIS_12").ToString() 'STATISTICS DASH
            Me.HF_ANALYSIS_13.Value = drvSql("CUSP_ANALYSIS_13").ToString() 'CUSTOMERS DASH
            Me.HF_ASSETMAN_0.Value = drvSql("CUSP_ASSETMAN_0").ToString() 'ASSET MANAGEMENT - HOME
            Me.HF_ASSETMAN_1.Value = drvSql("CUSP_ASSETMAN_1").ToString() 'ASSET DASHBOARD
            Me.HF_ASSETMAN_2.Value = drvSql("CUSP_ASSETMAN_2").ToString() 'ASSET LIST
            Me.HF_ASSETMAN_3.Value = drvSql("CUSP_ASSETMAN_3").ToString() 'ASSET MOVEMENTS
            Me.HF_ASSETMAN_4.Value = drvSql("CUSP_ASSETMAN_4").ToString() 'ASSET LEASING
            Me.HF_ASSETMAN_5.Value = drvSql("CUSP_ASSETMAN_5").ToString() 'ASSET SERVICE CONTRACTS
            Me.HF_ASSETMAN_6.Value = drvSql("CUSP_ASSETMAN_6").ToString() 'ENGINE LOAD FACTORS
            Me.HF_CONMON_0.Value = drvSql("CUSP_CONMON_0").ToString() 'CONDITION MONITORING - HOME
            Me.HF_CONMON_1.Value = drvSql("CUSP_CONMON_1").ToString() 'OIL SAMPLING
            Me.HF_CONMON_2.Value = drvSql("CUSP_CONMON_2").ToString() 'TYRES
            Me.HF_CONMON_3.Value = drvSql("CUSP_CONMON_3").ToString() 'THOROUGH EXAMS
            Me.HF_CONMON_4.Value = drvSql("CUSP_CONMON_4").ToString() 'TRACK INSPECTIONS
            Me.HF_CONMON_5.Value = drvSql("CUSP_CONMON_5").ToString() 'CAT VISIONLINK
            Me.HF_CONMON_6.Value = drvSql("CUSP_CONMON_6").ToString() 'KOMATSU KOMTRAX
            Me.HF_CONMON_7.Value = drvSql("CUSP_CONMON_7").ToString() 'VOLVO CARETRACK
            Me.HF_CONMON_8.Value = drvSql("CUSP_CONMON_8").ToString() 'JCB LIVELINK
            Me.HF_COMMAN_0.Value = drvSql("CUSP_COMMAN_0").ToString() 'COMPONENT MANAGEMENT - HOME
            Me.HF_COMMAN_1.Value = drvSql("CUSP_COMMAN_1").ToString() 'COMPONENT CHANGEOUT PLANNER
            Me.HF_COMMAN_2.Value = drvSql("CUSP_COMMAN_2").ToString() 'COMPONENT PARTS TRACKER
            Me.HF_COMMAN_3.Value = drvSql("CUSP_COMMAN_3").ToString() 'COMPONENT PARTS INSPECTIONS
            Me.HF_COMMAN_4.Value = drvSql("CUSP_COMMAN_4").ToString() 'WARRANTY TRACKER
            Me.HF_COMMAN_5.Value = drvSql("CUSP_COMMAN_5").ToString() 'LUBRICANTS
            Me.HF_CUSMAN_0.Value = drvSql("CUSP_CUSMAN_0").ToString() 'CUSTOMER MANAGEMENT - HOME
            Me.HF_CUSMAN_1.Value = drvSql("CUSP_CUSMAN_1").ToString() 'CUSTOMER LIST
            Me.HF_CUSMAN_2.Value = drvSql("CUSP_CUSMAN_2").ToString() 'CONTACTS
            Me.HF_CUSMAN_3.Value = drvSql("CUSP_CUSMAN_3").ToString() 'SITES
            Me.HF_CUSMAN_4.Value = drvSql("CUSP_CUSMAN_4").ToString() 'SATISFACTION SURVEYS
            Me.HF_CUSMAN_5.Value = drvSql("CUSP_CUSMAN_5").ToString() 'CUSTOMER PREFERENCES
            Me.HF_EVENTD_0.Value = drvSql("CUSP_EVENTD_0").ToString() 'EVENT DASHBOARD
            Me.HF_EVENTMAN_0.Value = drvSql("CUSP_EVENTMAN_0").ToString() 'EVENT MANAGEMENT - HOME
            Me.HF_EVENTMAN_1.Value = drvSql("CUSP_EVENTMAN_1").ToString() 'EVENT DETAIL
            Me.HF_EVENTMAN_2.Value = drvSql("CUSP_EVENTMAN_2").ToString() 'JOB MANAGEMENT
            Me.HF_EVENTMAN_3.Value = drvSql("CUSP_EVENTMAN_3").ToString() 'TIMESHEETS
            Me.HF_EVENTMAN_4.Value = drvSql("CUSP_EVENTMAN_4").ToString() 'EVENT PLANNING CALENDAR
            Me.HF_EVENTMAN_5.Value = drvSql("CUSP_EVENTMAN_5").ToString() 'EVENT ARCHIVE
            Me.HF_EVENTMAN_6.Value = drvSql("CUSP_EVENTMAN_6").ToString() 'EVENT PLUS 250
            Me.HF_DATAINPUT_0.Value = drvSql("CUSP_DATAINPUT_0").ToString() 'DATA INPUT - HOME
            Me.HF_DATAINPUT_1.Value = drvSql("CUSP_DATAINPUT_1").ToString() 'TBRAKE TEST INPUT
            Me.HF_DATAINPUT_2.Value = drvSql("CUSP_DATAINPUT_2").ToString() 'MAGNETIC PLUG INPUT
            Me.HF_DATAINPUT_3.Value = drvSql("CUSP_DATAINPUT_3").ToString() 'FUEL INPU
            Me.HF_DATAINPUT_4.Value = drvSql("CUSP_DATAINPUT_4").ToString() 'SMU INPUT
            Me.HF_DATAINPUT_5.Value = drvSql("CUSP_DATAINPUT_5").ToString() 'PROCESSING PLANT INPUT
            Me.HF_DATAINPUT_6.Value = drvSql("CUSP_DATAINPUT_6").ToString() 'PRODUCTION INPUT
            Me.HF_DATAINPUT_7.Value = drvSql("CUSP_DATAINPUT_7").ToString() 'HOSES INPUT
            Me.HF_DATAINPUT_8.Value = drvSql("CUSP_DATAINPUT_8").ToString() 'WASH PLANT SPECIFIC GRAVITY
            Me.HF_SERVICING_0.Value = drvSql("CUSP_SERVICING_0").ToString() 'SERVICING PLANNER
            Me.HF_REPORTS_0.Value = drvSql("CUSP_REPORTS_0").ToString() 'REPORTS - HOME
            Me.HF_REPORTS_1.Value = drvSql("CUSP_REPORTS_1").ToString() 'DATA INPUT REPORTS
            Me.HF_REPORTS_2.Value = drvSql("CUSP_REPORTS_2").ToString() 'ASSET MANAGEMENT REPORTS
            Me.HF_REPORTS_3.Value = drvSql("CUSP_REPORTS_3").ToString() 'EVENT MANAGEMENT REPORTS
            Me.HF_ACTIVITY_0.Value = drvSql("CUSP_ACTIVITY_0").ToString() 'PLANT ACTIVITY - HOME
            Me.HF_ADMIN_0.Value = drvSql("CUSP_ADMIN_0").ToString() 'ADMIN - HOME
            Me.HF_ADMIN_1.Value = drvSql("CUSP_ADMIN_1").ToString() 'ASSET AND PARTS ADMIN
            Me.HF_ADMIN_2.Value = drvSql("CUSP_ADMIN_2").ToString() 'EVENT AND JOBS ADMIN
            Me.HF_ADMIN_3.Value = drvSql("CUSP_ADMIN_3").ToString() 'CODE ADMIN
            Me.HF_ADMIN_4.Value = drvSql("CUSP_ADMIN_4").ToString() 'EMPLOYEES ADMIN
            Me.HF_ADMIN_5.Value = drvSql("CUSP_ADMIN_5").ToString() 'OTHER ADMIN
            Me.HF_ADMIN_6.Value = drvSql("CUSP_ADMIN_6").ToString() 'SYSTEM PERMISSIONS
            Me.HF_ADMIN_7.Value = drvSql("CUSP_ADMIN_7").ToString() 'JOB TRIGGERS ADMIN
            Me.HF_ADMIN_8.Value = drvSql("CUSP_ADMIN_8").ToString() 'SYSTEM AUDITING
            Me.HF_ADMIN_9.Value = drvSql("CUSP_ADMIN_9").ToString() 'SYSTEM STATUS
            Me.HF_REQUEST_1.Value = drvSql("CUSP_REQUEST_1").ToString() 'REQUEST ASSET MOVEMENT - HOME
            Me.HF_REQUEST_2.Value = drvSql("CUSP_REQUEST_2").ToString() 'REQUEST PART - HOME
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
                                    Case 129
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_1.Value = 1 'Analysis & Statistics
                                        End If
                                    Case 130
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_2_R.Value = 1 'Asset Management R
                                        End If
                                    Case 131
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_3.Value = 1 'Condition Monitoring
                                        End If
                                    Case 132
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_4_R.Value = 1 'Component Management R
                                        End If
                                    Case 133
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_5_R.Value = 1 'Event Dashboard R
                                        End If
                                    Case 134
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_6_R.Value = 1 'Event Management R
                                        End If
                                    Case 135
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_7_R.Value = 1 'Data Input R
                                        End If
                                    Case 136
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_8_R.Value = 1 'Servicing R
                                        End If
                                    Case 137
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_9.Value = 1 'Reports
                                        End If
                                    Case 139
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_11_R.Value = 1 'System Administration R
                                        End If
                                    Case 140
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_12.Value = 1 'Request Asset Movement
                                        End If
                                    Case 141
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_13.Value = 1 'Request Part
                                        End If
                                    Case 142
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_2_RW.Value = 1 'Asset Management RW
                                        End If
                                    Case 143
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_4_RW.Value = 1 'Component Management RW
                                        End If
                                    Case 144
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_5_RW.Value = 1 'Event Dashboard RW
                                        End If
                                    Case 145
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_6_RW.Value = 1 'Event Management RW
                                        End If
                                    Case 146
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_7_RW.Value = 1 'Data Input RW
                                        End If
                                    Case 147
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_8_RW.Value = 1 'Servicing RW
                                        End If
                                    Case 148
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_10_RW.Value = 1 'Plant Activity RW
                                        End If
                                    Case 149
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_11_RW.Value = 1 'System Administration RW
                                        End If
                                    Case 152
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_16.Value = 1 'Production Input W
                                        End If
                                    Case 153
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_17.Value = 1 'Production Analysis
                                        End If
                                    Case 154
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_18_R.Value = 1 'Financial R
                                        End If
                                    Case 155
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_18_RW.Value = 1 'Financial W
                                        End If
                                    Case 127
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_19_R.Value = 1 'Customer Management R
                                        End If
                                    Case 128
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_19_RW.Value = 1 'Customer Management W
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
        Dim OKtoContinue As Boolean = True
        Dim FLT_Username As String = Request.QueryString("FLT_Username")
        If Request.QueryString("GUID") = "" Then
            OKtoContinue = False
        End If
        Session("Cancel") = Nothing
        'With Me.ID_1_A.Attributes
        '    .Add("onClick", "fn_1()")
        'End With
        'With Me.ID_1_B.Attributes
        '    .Add("onClick", "fn_1()")
        'End With
        'With Me.ID_2_A.Attributes
        '    .Add("onClick", "fn_2()")
        'End With
        'With Me.ID_2_B.Attributes
        '    .Add("onClick", "fn_2()")
        'End With
        'With Me.ID_3_A.Attributes
        '    .Add("onClick", "fn_3()")
        'End With
        'With Me.ID_3_B.Attributes
        '    .Add("onClick", "fn_3()")
        'End With
        'With Me.ID_4_A.Attributes
        '    .Add("onClick", "fn_4()")
        'End With
        'With Me.ID_4_B.Attributes
        '    .Add("onClick", "fn_4()")
        'End With
        'With Me.ID_5_A.Attributes
        '    .Add("onClick", "fn_5()")
        'End With
        'With Me.ID_5_B.Attributes
        '    .Add("onClick", "fn_5()")
        'End With
        'With Me.ID_6_A.Attributes
        '    .Add("onClick", "fn_6()")
        'End With
        'With Me.ID_6_B.Attributes
        '    .Add("onClick", "fn_6()")
        'End With
        'With Me.ID_7_A.Attributes
        '    .Add("onClick", "fn_7()")
        'End With
        'With Me.ID_7_B.Attributes
        '    .Add("onClick", "fn_7()")
        'End With
        'With Me.ID_8_A.Attributes
        '    .Add("onClick", "fn_8()")
        'End With
        'With Me.ID_8_B.Attributes
        '    .Add("onClick", "fn_8()")
        'End With
        'With Me.ID_9_A.Attributes
        '    .Add("onClick", "fn_9()")
        'End With
        'With Me.ID_9_B.Attributes
        '    .Add("onClick", "fn_9()")
        'End With
        With btn_home
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_analysis
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_condition_monitoring
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_event_dashboard
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_data_input
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_reports
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_analysis
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_asset_management
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_component_management
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_customer_management
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_event_management
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_servicing
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_plant_activity
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn_system_administration
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With Me.ANALYSIS_Panel_1.Attributes
            .Add("onClick", "fn_analysis()")
        End With
        With Me.ANALYSIS_HOME_1.Attributes
            .Add("onClick", "fn_analysis_home_1()")
        End With
        'Me.ANALYSIS_HOME_1.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_2.Attributes
            .Add("onClick", "fn_analysis_home_2()")
        End With
        'Me.ANALYSIS_HOME_2.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_3.Attributes
            .Add("onClick", "fn_analysis_home_3()")
        End With
        'Me.ANALYSIS_HOME_3.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_4.Attributes
            .Add("onClick", "fn_analysis_home_4()")
        End With
        'Me.ANALYSIS_HOME_4.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_5.Attributes
            .Add("onClick", "fn_analysis_home_5()")
        End With
        'Me.ANALYSIS_HOME_5.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_6.Attributes
            .Add("onClick", "fn_analysis_home_6()")
        End With
        'Me.ANALYSIS_HOME_6.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_7.Attributes
            .Add("onClick", "fn_analysis_home_7()")
        End With
        'Me.ANALYSIS_HOME_7.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_8.Attributes
            .Add("onClick", "fn_analysis_home_8()")
        End With
        'Me.ANALYSIS_HOME_8.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_9.Attributes
            .Add("onClick", "fn_analysis_home_9()")
        End With
        'Me.ANALYSIS_HOME_9.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_10.Attributes
            .Add("onClick", "fn_analysis_home_10()")
        End With
        'Me.ANALYSIS_HOME_10.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_11.Attributes
            .Add("onClick", "fn_analysis_home_11()")
        End With
        'Me.ANALYSIS_HOME_11.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_12.Attributes
            .Add("onClick", "fn_analysis_home_12()")
        End With
        'Me.ANALYSIS_HOME_12.CssClass = "hideitem"
        With Me.ANALYSIS_HOME_13.Attributes
            .Add("onClick", "fn_analysis_home_13()")
        End With
        'Me.ANALYSIS_HOME_13.CssClass = "hideitem"

        With Me.CONDITION_MONITORING_Panel_1.Attributes
            .Add("onClick", "fn_condition_monitoring()")
        End With
        With Me.CONDITION_MONITORING_HOME_1.Attributes
            .Add("onClick", "fn_condition_monitoring_home_1()")
        End With
        'Me.CONDITION_MONITORING_HOME_1.CssClass = "hideitem"
        With Me.CONDITION_MONITORING_HOME_2.Attributes
            .Add("onClick", "fn_condition_monitoring_home_2()")
        End With
        'Me.CONDITION_MONITORING_HOME_2.CssClass = "hideitem"
        With Me.CONDITION_MONITORING_HOME_3.Attributes
            .Add("onClick", "fn_condition_monitoring_home_3()")
        End With
        'Me.CONDITION_MONITORING_HOME_3.CssClass = "hideitem"
        With Me.CONDITION_MONITORING_HOME_4.Attributes
            .Add("onClick", "fn_condition_monitoring_home_4()")
        End With
        'Me.CONDITION_MONITORING_HOME_4.CssClass = "hideitem"
        With Me.CONDITION_MONITORING_HOME_5.Attributes
            .Add("onClick", "fn_condition_monitoring_home_5()")
        End With
        'Me.CONDITION_MONITORING_HOME_5.CssClass = "hideitem"
        With Me.CONDITION_MONITORING_HOME_6.Attributes
            .Add("onClick", "fn_condition_monitoring_home_6()")
        End With
        'Me.CONDITION_MONITORING_HOME_6.CssClass = "hideitem"
        With Me.CONDITION_MONITORING_HOME_7.Attributes
            .Add("onClick", "fn_condition_monitoring_home_7()")
        End With
        'Me.CONDITION_MONITORING_HOME_7.CssClass = "hideitem"
        With Me.CONDITION_MONITORING_HOME_8.Attributes
            .Add("onClick", "fn_condition_monitoring_home_8()")
        End With
        'Me.CONDITION_MONITORING_HOME_8.CssClass = "hideitem"

        With Me.EVENT_DASHBOARD_Panel_1.Attributes
            .Add("onClick", "fn_event_dashboard()")
        End With

        With Me.DATA_INPUT_Panel_1.Attributes
            .Add("onClick", "fn_data_input()")
        End With
        With Me.DATA_INPUT_HOME_1.Attributes
            .Add("onClick", "fn_data_input_home_1()")
        End With
        'Me.DATA_INPUT_HOME_1.CssClass = "hideitem"
        With Me.DATA_INPUT_HOME_2.Attributes
            .Add("onClick", "fn_data_input_home_2()")
        End With
        'Me.DATA_INPUT_HOME_2.CssClass = "hideitem"
        With Me.DATA_INPUT_HOME_3.Attributes
            .Add("onClick", "fn_data_input_home_3()")
        End With
        'Me.DATA_INPUT_HOME_3.CssClass = "hideitem"
        With Me.DATA_INPUT_HOME_4.Attributes
            .Add("onClick", "fn_data_input_home_4()")
        End With
        'Me.DATA_INPUT_HOME_4.CssClass = "hideitem"
        With Me.DATA_INPUT_HOME_5.Attributes
            .Add("onClick", "fn_data_input_home_5()")
        End With
        'Me.DATA_INPUT_HOME_5.CssClass = "hideitem"
        With Me.DATA_INPUT_HOME_6.Attributes
            .Add("onClick", "fn_data_input_home_6()")
        End With
        'Me.DATA_INPUT_HOME_6.CssClass = "hideitem"
        With Me.DATA_INPUT_HOME_7.Attributes
            .Add("onClick", "fn_data_input_home_7()")
        End With
        'Me.DATA_INPUT_HOME_7.CssClass = "hideitem"
        With Me.DATA_INPUT_HOME_8.Attributes
            .Add("onClick", "fn_data_input_home_8()")
        End With
        'Me.DATA_INPUT_HOME_8.CssClass = "hideitem"

        With Me.REPORT_Panel_1.Attributes
            .Add("onClick", "fn_report()")
        End With
        With Me.REPORT_HOME_1.Attributes
            .Add("onClick", "fn_report_home_1()")
        End With
        'Me.REPORT_HOME_1.CssClass = "hideitem"
        With Me.REPORT_HOME_2.Attributes
            .Add("onClick", "fn_report_home_2()")
        End With
        'Me.REPORT_HOME_2.CssClass = "hideitem"
        With Me.REPORT_HOME_3.Attributes
            .Add("onClick", "fn_report_home_3()")
        End With
        'Me.REPORT_HOME_3.CssClass = "hideitem"

        With Me.ASSET_MANAGEMENT_Panel_1.Attributes
            .Add("onClick", "fn_asset_management()")
        End With
        With Me.ASSET_MANAGEMENT_HOME_1.Attributes
            .Add("onClick", "fn_asset_management_home_1()")
        End With
        'Me.ASSET_MANAGEMENT_HOME_1.CssClass = "hideitem"
        With Me.ASSET_MANAGEMENT_HOME_2.Attributes
            .Add("onClick", "fn_asset_management_home_2()")
        End With
        'Me.ASSET_MANAGEMENT_HOME_2.CssClass = "hideitem"
        With Me.ASSET_MANAGEMENT_HOME_3.Attributes
            .Add("onClick", "fn_asset_management_home_3()")
        End With
        'Me.ASSET_MANAGEMENT_HOME_3.CssClass = "hideitem"
        With Me.ASSET_MANAGEMENT_HOME_4.Attributes
            .Add("onClick", "fn_asset_management_home_4()")
        End With
        'Me.ASSET_MANAGEMENT_HOME_4.CssClass = "hideitem"
        With Me.ASSET_MANAGEMENT_HOME_5.Attributes
            .Add("onClick", "fn_asset_management_home_5()")
        End With
        'Me.ASSET_MANAGEMENT_HOME_5.CssClass = "hideitem"
        With Me.ASSET_MANAGEMENT_HOME_6.Attributes
            .Add("onClick", "fn_asset_management_home_6()")
        End With
        'Me.ASSET_MANAGEMENT_HOME_6.CssClass = "hideitem"

        With Me.COMPONENT_MANAGEMENT_Panel_1.Attributes
            .Add("onClick", "fn_component_management()")
        End With
        With Me.COMPONENT_MANAGEMENT_HOME_1.Attributes
            .Add("onClick", "fn_component_management_home_1()")
        End With
        'Me.COMPONENT_MANAGEMENT_HOME_1.CssClass = "hideitem"
        With Me.COMPONENT_MANAGEMENT_HOME_2.Attributes
            .Add("onClick", "fn_component_management_home_2()")
        End With
        'Me.COMPONENT_MANAGEMENT_HOME_2.CssClass = "hideitem"
        With Me.COMPONENT_MANAGEMENT_HOME_3.Attributes
            .Add("onClick", "fn_component_management_home_3()")
        End With
        ' Me.COMPONENT_MANAGEMENT_HOME_3.CssClass = "hideitem"
        With Me.COMPONENT_MANAGEMENT_HOME_4.Attributes
            .Add("onClick", "fn_component_management_home_4()")
        End With
        ' Me.COMPONENT_MANAGEMENT_HOME_4.CssClass = "hideitem"
        With Me.COMPONENT_MANAGEMENT_HOME_5.Attributes
            .Add("onClick", "fn_component_management_home_5()")
        End With
        ' Me.COMPONENT_MANAGEMENT_HOME_5.CssClass = "hideitem"

        With Me.CUSTOMER_MANAGEMENT_Panel_1.Attributes
            .Add("onClick", "fn_customer_management()")
        End With
        With Me.CUSTOMER_MANAGEMENT_HOME_1.Attributes
            .Add("onClick", "fn_customer_management_home_1()")
        End With
        With Me.CUSTOMER_MANAGEMENT_HOME_2.Attributes
            .Add("onClick", "fn_customer_management_home_2()")
        End With
        With Me.CUSTOMER_MANAGEMENT_HOME_3.Attributes
            .Add("onClick", "fn_customer_management_home_3()")
        End With
        With Me.CUSTOMER_MANAGEMENT_HOME_4.Attributes
            .Add("onClick", "fn_customer_management_home_4()")
        End With
        With Me.CUSTOMER_MANAGEMENT_HOME_5.Attributes
            .Add("onClick", "fn_customer_management_home_5()")
        End With

        With Me.EVENT_MANAGEMENT_Panel_1.Attributes
            .Add("onClick", "fn_event_management()")
        End With
        With Me.EVENT_MANAGEMENT_HOME_1.Attributes
            .Add("onClick", "fn_event_management_home_1()")
        End With
        'Me.EVENT_MANAGEMENT_HOME_1.CssClass = "hideitem"
        With Me.EVENT_MANAGEMENT_HOME_2.Attributes
            .Add("onClick", "fn_event_management_home_2()")
        End With
        'Me.EVENT_MANAGEMENT_HOME_2.CssClass = "hideitem"
        With Me.EVENT_MANAGEMENT_HOME_3.Attributes
            .Add("onClick", "fn_event_management_home_3()")
        End With
        'Me.EVENT_MANAGEMENT_HOME_3.CssClass = "hideitem"
        With Me.EVENT_MANAGEMENT_HOME_4.Attributes
            .Add("onClick", "fn_event_management_home_4()")
        End With
        'Me.EVENT_MANAGEMENT_HOME_4.CssClass = "hideitem"
        With Me.EVENT_MANAGEMENT_HOME_5.Attributes
            .Add("onClick", "fn_event_management_home_5()")
        End With
        'Me.EVENT_MANAGEMENT_HOME_5.CssClass = "hideitem"
        With Me.EVENT_MANAGEMENT_HOME_6.Attributes
            .Add("onClick", "fn_event_management_home_6()")
        End With
        'Me.EVENT_MANAGEMENT_HOME_6.CssClass = "hideitem"


        With Me.SERVICING_Panel_1.Attributes
            .Add("onClick", "fn_servicing()")
        End With

        With Me.PLANT_ACTIVITY_Panel_1.Attributes
            .Add("onClick", "fn_plant_activity()")
        End With
        With Me.ADMIN_HOME_1.Attributes
            .Add("onClick", "fn_admin_home_1()")
        End With
        'Me.ADMIN_HOME_1.CssClass = "hideitem"
        With Me.ADMIN_HOME_2.Attributes
            .Add("onClick", "fn_admin_home_2()")
        End With
        'Me.ADMIN_HOME_2.CssClass = "hideitem"
        With Me.ADMIN_HOME_3.Attributes
            .Add("onClick", "fn_admin_home_3()")
        End With
        'Me.ADMIN_HOME_3.CssClass = "hideitem"
        With Me.ADMIN_HOME_4.Attributes
            .Add("onClick", "fn_admin_home_4()")
        End With
        'Me.ADMIN_HOME_4.CssClass = "hideitem"
        With Me.ADMIN_HOME_5.Attributes
            .Add("onClick", "fn_admin_home_5()")
        End With
        'Me.ADMIN_HOME_5.CssClass = "hideitem"
        With Me.ADMIN_HOME_6.Attributes
            .Add("onClick", "fn_admin_home_6()")
        End With
        'Me.ADMIN_HOME_6.CssClass = "hideitem"
        With Me.ADMIN_HOME_7.Attributes
            .Add("onClick", "fn_admin_home_7()")
        End With
        'Me.ADMIN_HOME_7.CssClass = "hideitem"
        With Me.ADMIN_HOME_8.Attributes
            .Add("onClick", "fn_admin_home_8()")
        End With
        'Me.ADMIN_HOME_8.CssClass = "hideitem"
        With Me.ADMIN_HOME_9.Attributes
            .Add("onClick", "fn_admin_home_9()")
        End With
        'Me.ADMIN_HOME_9.CssClass = "hideitem"
        '--------------------------------------------
    End Sub
    Protected Sub btn_home_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_home.Click
        Me.HF_button.Value = "Home"
        Apply_Permissions()
    End Sub
    Protected Sub btn_analysis_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_analysis.Click
        Me.HF_button.Value = "Analysis"
        Apply_Permissions()
    End Sub
    Protected Sub btn_condition_monitoring_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_condition_monitoring.Click
        Me.HF_button.Value = "Condition Monitoring"
        Apply_Permissions()
    End Sub
    Protected Sub btn_event_dashboard_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_event_dashboard.Click
        Me.HF_button.Value = "Event Dashboard"
        Apply_Permissions()
    End Sub
    Protected Sub btn_data_input_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_data_input.Click
        Me.HF_button.Value = "Data Input"
        Apply_Permissions()
    End Sub
    Protected Sub btn_reports_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_reports.Click
        Me.HF_button.Value = "Reports"
        Apply_Permissions()
    End Sub
    Protected Sub btn_asset_management_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_asset_management.Click
        Me.HF_button.Value = "Asset Management"
        Apply_Permissions()
    End Sub
    Protected Sub btn_component_management_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_component_management.Click
        Me.HF_button.Value = "Component Management"
        Apply_Permissions()
    End Sub
    Protected Sub btn_customer_management_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_customer_management.Click
        Me.HF_button.Value = "Customer Management"
        Apply_Permissions()
    End Sub
    Protected Sub btn_event_management_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_event_management.Click
        Me.HF_button.Value = "Event Management"
        Apply_Permissions()
    End Sub
    Protected Sub btn_servicing_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_servicing.Click
        Me.HF_button.Value = "Servicing"
        Apply_Permissions()
    End Sub
    Protected Sub btn_plant_activity_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_plant_activity.Click
        Me.HF_button.Value = "Plant Activity"
        Apply_Permissions()
    End Sub
    Protected Sub btn_system_administration_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_system_administration.Click
        Me.HF_button.Value = "Admin"
        Apply_Permissions()
    End Sub
    Sub Apply_Permissions()
        Select Case Me.HF_button.Value
            Case "Home", "Event Dashboard", "Servicing", "Plant Activity"
                Me.lblTitle.Text = "HOME"
                Me.lblTitle.Font.Size = "14"
                Select Case HF_PQQ_Permission.Value
                    Case 4
                        If HF_ANALYSIS_0.Value = 1 Then
                            Me.ANALYSIS_Panel_1.Visible = True
                            Me.ANALYSIS_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.ANALYSIS_Panel_1.Visible = False
                        End If
                        If HF_CONMON_0.Value = 1 Then
                            Me.CONDITION_MONITORING_Panel_1.Visible = True
                            Me.CONDITION_MONITORING_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.CONDITION_MONITORING_Panel_1.Visible = False
                        End If
                        If HF_EVENTD_0.Value = 1 Then
                            Me.EVENT_DASHBOARD_Panel_1.Visible = True
                            Me.EVENT_DASHBOARD_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.EVENT_DASHBOARD_Panel_1.Visible = False
                        End If
                        If HF_DATAINPUT_0.Value = 1 Then
                            Me.DATA_INPUT_Panel_1.Visible = True
                            Me.DATA_INPUT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.DATA_INPUT_Panel_1.Visible = False
                        End If
                        If HF_REPORTS_0.Value = 1 Then
                            Me.REPORT_Panel_1.Visible = True
                            Me.REPORT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.REPORT_Panel_1.Visible = False
                        End If
                        If HF_ASSETMAN_0.Value = 1 Then
                            Me.ASSET_MANAGEMENT_Panel_1.Visible = True
                            Me.ASSET_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                        End If
                        If HF_COMMAN_0.Value = 1 Then
                            Me.COMPONENT_MANAGEMENT_Panel_1.Visible = True
                            Me.COMPONENT_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                        End If
                        If HF_CUSMAN_0.Value = 1 Then
                            Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = True
                            Me.CUSTOMER_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                        End If
                        If HF_EVENTMAN_0.Value = 1 Then
                            Me.EVENT_MANAGEMENT_Panel_1.Visible = True
                            Me.EVENT_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                        End If
                        If HF_SERVICING_0.Value = 1 Then
                            Me.SERVICING_Panel_1.Visible = True
                            Me.SERVICING_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.SERVICING_Panel_1.Visible = False
                        End If
                        If HF_ACTIVITY_0.Value = 1 Then
                            Me.PLANT_ACTIVITY_Panel_1.Visible = True
                            Me.PLANT_ACTIVITY_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.PLANT_ACTIVITY_Panel_1.Visible = False
                        End If
                        If HF_ADMIN_0.Value = 1 Then
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Else
                            Me.ADMINISTRATION_Panel_1.Visible = False
                        End If
                        If HF_REQUEST_1.Value = 1 Then
                            Me.REQUEST_Panel_1.Visible = True
                            Me.REQUEST_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.REQUEST_Panel_1.Visible = False
                        End If
                        If HF_REQUEST_2.Value = 1 Then
                            Me.REQUEST_Panel_2.Visible = True
                            Me.REQUEST_Panel_2.CssClass = "roundcorners"
                        Else
                            Me.REQUEST_Panel_2.Visible = False
                            Me.REQUEST_Panel_2.CssClass = "roundcorners"
                        End If
                    Case 5
                        If HF_ANALYSIS_0.Value = 1 Then
                            Me.ANALYSIS_Panel_1.Visible = True
                            Me.ANALYSIS_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.ANALYSIS_Panel_1.Visible = False
                        End If
                        If HF_CONMON_0.Value = 1 Then
                            Me.CONDITION_MONITORING_Panel_1.Visible = True
                            Me.CONDITION_MONITORING_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.CONDITION_MONITORING_Panel_1.Visible = False
                        End If
                        If HF_EVENTD_0.Value = 1 Then
                            Me.EVENT_DASHBOARD_Panel_1.Visible = True
                            Me.EVENT_DASHBOARD_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.EVENT_DASHBOARD_Panel_1.Visible = False
                        End If
                        If HF_DATAINPUT_0.Value = 1 Then
                            Me.DATA_INPUT_Panel_1.Visible = True
                            Me.DATA_INPUT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.DATA_INPUT_Panel_1.Visible = False
                        End If
                        If HF_REPORTS_0.Value = 1 Then
                            Me.REPORT_Panel_1.Visible = True
                            Me.REPORT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.REPORT_Panel_1.Visible = False
                        End If
                        If HF_ASSETMAN_0.Value = 1 Then
                            Me.ASSET_MANAGEMENT_Panel_1.Visible = True
                            Me.ASSET_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                        End If
                        If HF_COMMAN_0.Value = 1 Then
                            Me.COMPONENT_MANAGEMENT_Panel_1.Visible = True
                            Me.COMPONENT_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                        End If
                        If HF_CUSMAN_0.Value = 1 Then
                            Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = True
                            Me.CUSTOMER_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                        End If
                        If HF_EVENTMAN_0.Value = 1 Then
                            Me.EVENT_MANAGEMENT_Panel_1.Visible = True
                            Me.EVENT_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                        End If
                        If HF_SERVICING_0.Value = 1 Then
                            Me.SERVICING_Panel_1.Visible = True
                            Me.SERVICING_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.SERVICING_Panel_1.Visible = False
                        End If
                        If HF_ACTIVITY_0.Value = 1 Then
                            Me.PLANT_ACTIVITY_Panel_1.Visible = True
                            Me.PLANT_ACTIVITY_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.PLANT_ACTIVITY_Panel_1.Visible = False
                        End If
                        If HF_ADMIN_0.Value = 1 Then
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Else
                            Me.ADMINISTRATION_Panel_1.Visible = False
                        End If
                        If HF_REQUEST_1.Value = 1 Then
                            Me.REQUEST_Panel_1.Visible = True
                            Me.REQUEST_Panel_1.CssClass = "roundcorners"
                        Else
                            Me.REQUEST_Panel_1.Visible = False
                        End If
                        If HF_REQUEST_2.Value = 1 Then
                            Me.REQUEST_Panel_2.Visible = True
                            Me.REQUEST_Panel_2.CssClass = "roundcorners"
                        Else
                            Me.REQUEST_Panel_2.Visible = False
                            Me.REQUEST_Panel_2.CssClass = "roundcorners"
                        End If
                    Case Else
                        Me.ANALYSIS_Panel_1.Visible = False
                        Me.CONDITION_MONITORING_Panel_1.Visible = False
                        Me.EVENT_DASHBOARD_Panel_1.Visible = False
                        Me.DATA_INPUT_Panel_1.Visible = False
                        Me.REPORT_Panel_1.Visible = False
                        Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                        Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                        Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                        Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                        Me.SERVICING_Panel_1.Visible = False
                        Me.PLANT_ACTIVITY_Panel_1.Visible = False
                        Me.ADMINISTRATION_Panel_1.Visible = False
                        Me.REQUEST_Panel_1.Visible = False
                        Me.REQUEST_Panel_2.Visible = False
                        If HF_ANALYSIS_0.Value = 1 Then
                            If HF_EXCEPTION_1.Value = 1 Or HF_EXCEPTION_17.Value = 1 Or HF_EXCEPTION_18_R.Value = 1 Or HF_EXCEPTION_18_RW.Value = 1 Then
                                Me.ANALYSIS_Panel_1.Visible = True
                                Me.ANALYSIS_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T1.Visible = False
                            End If
                        End If
                        If HF_CONMON_0.Value = 1 Then
                            If HF_EXCEPTION_3.Value = 1 Then
                                Me.CONDITION_MONITORING_Panel_1.Visible = True
                                Me.CONDITION_MONITORING_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T2.Visible = False
                            End If
                        End If
                        If HF_EVENTD_0.Value = 1 Then
                            If HF_EXCEPTION_5_R.Value = 1 Or HF_EXCEPTION_5_RW.Value = 1 Then
                                Me.EVENT_DASHBOARD_Panel_1.Visible = True
                                Me.EVENT_DASHBOARD_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T3.Visible = False
                            End If
                        End If
                        If HF_DATAINPUT_0.Value = 1 Then
                            If HF_EXCEPTION_7_R.Value = 1 Or HF_EXCEPTION_7_RW.Value = 1 Then
                                Me.DATA_INPUT_Panel_1.Visible = True
                                Me.DATA_INPUT_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T4.Visible = False
                            End If
                        End If
                        If HF_REPORTS_0.Value = 1 Then
                            If HF_EXCEPTION_9.Value = 1 Then
                                Me.REPORT_Panel_1.Visible = True
                                Me.REPORT_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T5.Visible = False
                            End If
                        End If
                        If HF_ASSETMAN_0.Value = 1 Then
                            If HF_EXCEPTION_2_R.Value = 1 Or HF_EXCEPTION_2_RW.Value = 1 Or HF_EXCEPTION_18_R.Value = 1 Or HF_EXCEPTION_18_RW.Value = 1 Then
                                Me.ASSET_MANAGEMENT_Panel_1.Visible = True
                                Me.ASSET_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T6.Visible = False
                            End If
                        End If
                        If HF_COMMAN_0.Value = 1 Then
                            If HF_EXCEPTION_4_R.Value = 1 Or HF_EXCEPTION_4_RW.Value = 1 Then
                                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = True
                                Me.COMPONENT_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T7.Visible = False
                            End If
                        End If
                        If HF_CUSMAN_0.Value = 1 Then
                            If HF_EXCEPTION_19_R.Value = 1 Or HF_EXCEPTION_19_RW.Value = 1 Then
                                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = True
                                Me.CUSTOMER_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T7.Visible = False
                            End If
                        End If
                        If HF_EVENTMAN_0.Value = 1 Then
                            If HF_EXCEPTION_6_R.Value = 1 Or HF_EXCEPTION_6_RW.Value = 1 Then
                                Me.EVENT_MANAGEMENT_Panel_1.Visible = True
                                Me.EVENT_MANAGEMENT_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T8.Visible = False
                            End If
                        End If
                        If HF_SERVICING_0.Value = 1 Then
                            If HF_EXCEPTION_8_R.Value = 1 Or HF_EXCEPTION_8_RW.Value = 1 Then
                                Me.SERVICING_Panel_1.Visible = True
                                Me.SERVICING_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T9.Visible = False
                            End If
                        End If
                        If HF_ACTIVITY_0.Value = 1 Then
                            If HF_EXCEPTION_10_R.Value = 1 Or HF_EXCEPTION_10_RW.Value = 1 Then
                                Me.PLANT_ACTIVITY_Panel_1.Visible = True
                                Me.PLANT_ACTIVITY_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T10.Visible = False
                            End If
                        End If
                        If HF_ADMIN_0.Value = 1 Then
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                        End If
                        If HF_REQUEST_1.Value = 1 Then
                            If HF_EXCEPTION_12.Value = 1 Then
                                Me.REQUEST_Panel_1.Visible = True
                                Me.REQUEST_Panel_1.CssClass = "roundcorners"
                            Else
                                Me.T11.Visible = False
                            End If
                        End If
                        If HF_REQUEST_2.Value = 1 Then
                            If HF_EXCEPTION_13.Value = 1 Then
                                Me.REQUEST_Panel_2.Visible = True
                                Me.REQUEST_Panel_2.CssClass = "roundcorners"
                            Else
                                Me.T12.Visible = False
                            End If
                        End If
                End Select
                'HOME_Panel.Visible = False
                ANALYSIS_HOME_1.Visible = False
                ANALYSIS_HOME_2.Visible = False
                ANALYSIS_HOME_3.Visible = False
                ANALYSIS_HOME_4.Visible = False
                ANALYSIS_HOME_5.Visible = False
                ANALYSIS_HOME_6.Visible = False
                ANALYSIS_HOME_7.Visible = False
                ANALYSIS_HOME_8.Visible = False
                ANALYSIS_HOME_9.Visible = False
                ANALYSIS_HOME_10.Visible = False
                ANALYSIS_HOME_11.Visible = False
                ANALYSIS_HOME_12.Visible = False
                ANALYSIS_HOME_13.Visible = False
                CONDITION_MONITORING_HOME_1.Visible = False
                CONDITION_MONITORING_HOME_2.Visible = False
                CONDITION_MONITORING_HOME_3.Visible = False
                CONDITION_MONITORING_HOME_4.Visible = False
                CONDITION_MONITORING_HOME_5.Visible = False
                CONDITION_MONITORING_HOME_6.Visible = False
                CONDITION_MONITORING_HOME_7.Visible = False
                CONDITION_MONITORING_HOME_8.Visible = False
                DATA_INPUT_HOME_1.Visible = False
                DATA_INPUT_HOME_2.Visible = False
                DATA_INPUT_HOME_3.Visible = False
                DATA_INPUT_HOME_4.Visible = False
                DATA_INPUT_HOME_5.Visible = False
                DATA_INPUT_HOME_6.Visible = False
                DATA_INPUT_HOME_7.Visible = False
                DATA_INPUT_HOME_8.Visible = False
                REPORT_HOME_1.Visible = False
                REPORT_HOME_2.Visible = False
                REPORT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_1.Visible = False
                ASSET_MANAGEMENT_HOME_2.Visible = False
                ASSET_MANAGEMENT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_4.Visible = False
                ASSET_MANAGEMENT_HOME_5.Visible = False
                ASSET_MANAGEMENT_HOME_6.Visible = False
                COMPONENT_MANAGEMENT_HOME_1.Visible = False
                COMPONENT_MANAGEMENT_HOME_2.Visible = False
                COMPONENT_MANAGEMENT_HOME_3.Visible = False
                COMPONENT_MANAGEMENT_HOME_4.Visible = False
                COMPONENT_MANAGEMENT_HOME_5.Visible = False
                CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                CUSTOMER_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_1.Visible = False
                EVENT_MANAGEMENT_HOME_2.Visible = False
                EVENT_MANAGEMENT_HOME_3.Visible = False
                EVENT_MANAGEMENT_HOME_4.Visible = False
                EVENT_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_6.Visible = False
                ADMIN_HOME_1.Visible = False
                ADMIN_HOME_2.Visible = False
                ADMIN_HOME_3.Visible = False
                ADMIN_HOME_4.Visible = False
                ADMIN_HOME_5.Visible = False
                ADMIN_HOME_6.Visible = False
                ADMIN_HOME_7.Visible = False
                ADMIN_HOME_8.Visible = False
                ADMIN_HOME_9.Visible = False
            Case "Analysis"
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.T4.Visible = True
                Me.T5.Visible = True
                Me.T6.Visible = True
                Me.T7.Visible = True
                Me.T8.Visible = True
                Me.T9.Visible = True
                Me.T10.Visible = True
                Me.T13.Visible = True
                Me.T14.Visible = True
                Me.ANALYSIS_Panel_1.Visible = False
                Me.CONDITION_MONITORING_Panel_1.Visible = False
                Me.EVENT_DASHBOARD_Panel_1.Visible = False
                Me.DATA_INPUT_Panel_1.Visible = False
                Me.REPORT_Panel_1.Visible = False
                Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                Me.SERVICING_Panel_1.Visible = False
                Me.PLANT_ACTIVITY_Panel_1.Visible = False
                If HF_ADMIN_0.Value = 1 Then
                    Select Case HF_PQQ_Permission.Value
                        Case 3
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 4
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 5
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case Else
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                    End Select
                End If

                Me.lblTitle.Text = "ANALYSIS & STATISTICS"
                Me.lblTitle.Font.Size = "14"
                REQUEST_Panel_1.Visible = False
                REQUEST_Panel_2.Visible = False
                If HF_ANALYSIS_1.Value = 1 Then
                    ANALYSIS_HOME_1.Visible = True
                    ANALYSIS_HOME_1.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_1.Visible = False
                End If
                If HF_ANALYSIS_2.Value = 1 Then
                    ANALYSIS_HOME_2.Visible = True
                    ANALYSIS_HOME_2.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_2.Visible = False
                End If
                If HF_ANALYSIS_3.Value = 1 Then
                    ANALYSIS_HOME_3.Visible = True
                    ANALYSIS_HOME_3.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_3.Visible = False
                End If
                If HF_ANALYSIS_4.Value = 1 Then
                    ANALYSIS_HOME_4.Visible = True
                    ANALYSIS_HOME_4.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_4.Visible = False
                End If
                If HF_ANALYSIS_5.Value = 1 Then
                    ANALYSIS_HOME_5.Visible = True
                    ANALYSIS_HOME_5.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_5.Visible = False
                End If
                If HF_ANALYSIS_6.Value = 1 Then
                    ANALYSIS_HOME_6.Visible = True
                    ANALYSIS_HOME_6.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_6.Visible = False
                End If
                If HF_ANALYSIS_7.Value = 1 Then
                    ANALYSIS_HOME_7.Visible = True
                    ANALYSIS_HOME_7.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_7.Visible = False
                End If
                If HF_ANALYSIS_8.Value = 1 Then
                    ANALYSIS_HOME_8.Visible = True
                    ANALYSIS_HOME_8.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_8.Visible = False
                End If
                If HF_ANALYSIS_9.Value = 1 Then
                    ANALYSIS_HOME_9.Visible = True
                    ANALYSIS_HOME_9.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_9.Visible = False
                End If
                If HF_ANALYSIS_10.Value = 1 Then
                    ANALYSIS_HOME_10.Visible = True
                    ANALYSIS_HOME_10.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_10.Visible = False
                End If
                If HF_ANALYSIS_11.Value = 1 Then
                    ANALYSIS_HOME_11.Visible = True
                    ANALYSIS_HOME_11.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_11.Visible = False
                End If
                If HF_ANALYSIS_12.Value = 1 Then
                    ANALYSIS_HOME_12.Visible = True
                    ANALYSIS_HOME_12.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_12.Visible = False
                End If
                If HF_ANALYSIS_13.Value = 1 Then
                    ANALYSIS_HOME_13.Visible = True
                    ANALYSIS_HOME_13.CssClass = "roundcorners"
                Else
                    ANALYSIS_HOME_13.Visible = False
                End If
                CONDITION_MONITORING_HOME_1.Visible = False
                CONDITION_MONITORING_HOME_2.Visible = False
                CONDITION_MONITORING_HOME_3.Visible = False
                CONDITION_MONITORING_HOME_4.Visible = False
                CONDITION_MONITORING_HOME_5.Visible = False
                CONDITION_MONITORING_HOME_6.Visible = False
                CONDITION_MONITORING_HOME_7.Visible = False
                CONDITION_MONITORING_HOME_8.Visible = False
                DATA_INPUT_HOME_1.Visible = False
                DATA_INPUT_HOME_2.Visible = False
                DATA_INPUT_HOME_3.Visible = False
                DATA_INPUT_HOME_4.Visible = False
                DATA_INPUT_HOME_5.Visible = False
                DATA_INPUT_HOME_6.Visible = False
                DATA_INPUT_HOME_7.Visible = False
                DATA_INPUT_HOME_8.Visible = False
                REPORT_HOME_1.Visible = False
                REPORT_HOME_2.Visible = False
                REPORT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_1.Visible = False
                ASSET_MANAGEMENT_HOME_2.Visible = False
                ASSET_MANAGEMENT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_4.Visible = False
                ASSET_MANAGEMENT_HOME_5.Visible = False
                ASSET_MANAGEMENT_HOME_6.Visible = False
                COMPONENT_MANAGEMENT_HOME_1.Visible = False
                COMPONENT_MANAGEMENT_HOME_2.Visible = False
                COMPONENT_MANAGEMENT_HOME_3.Visible = False
                COMPONENT_MANAGEMENT_HOME_4.Visible = False
                COMPONENT_MANAGEMENT_HOME_5.Visible = False
                CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                CUSTOMER_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_1.Visible = False
                EVENT_MANAGEMENT_HOME_2.Visible = False
                EVENT_MANAGEMENT_HOME_3.Visible = False
                EVENT_MANAGEMENT_HOME_4.Visible = False
                EVENT_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_6.Visible = False
                ADMIN_HOME_1.Visible = False
                ADMIN_HOME_2.Visible = False
                ADMIN_HOME_3.Visible = False
                ADMIN_HOME_4.Visible = False
                ADMIN_HOME_5.Visible = False
                ADMIN_HOME_6.Visible = False
                ADMIN_HOME_7.Visible = False
                ADMIN_HOME_8.Visible = False
                ADMIN_HOME_9.Visible = False
            Case "Condition Monitoring"
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.T4.Visible = True
                Me.T5.Visible = True
                Me.T6.Visible = True
                Me.T7.Visible = True
                Me.T8.Visible = True
                Me.T9.Visible = True
                Me.T10.Visible = True
                Me.T13.Visible = True
                ' Me.T14.Visible = True
                Me.ANALYSIS_Panel_1.Visible = False
                Me.CONDITION_MONITORING_Panel_1.Visible = False
                Me.EVENT_DASHBOARD_Panel_1.Visible = False
                Me.DATA_INPUT_Panel_1.Visible = False
                Me.REPORT_Panel_1.Visible = False
                Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                Me.SERVICING_Panel_1.Visible = False
                Me.PLANT_ACTIVITY_Panel_1.Visible = False
                If HF_ADMIN_0.Value = 1 Then
                    Select Case HF_PQQ_Permission.Value
                        Case 3
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 4
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 5
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case Else
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                    End Select
                End If
                ANALYSIS_HOME_1.Visible = False
                ANALYSIS_HOME_2.Visible = False
                ANALYSIS_HOME_3.Visible = False
                ANALYSIS_HOME_4.Visible = False
                ANALYSIS_HOME_5.Visible = False
                ANALYSIS_HOME_6.Visible = False
                ANALYSIS_HOME_7.Visible = False
                ANALYSIS_HOME_8.Visible = False
                ANALYSIS_HOME_9.Visible = False
                ANALYSIS_HOME_10.Visible = False
                ANALYSIS_HOME_11.Visible = False
                ANALYSIS_HOME_12.Visible = False
                ANALYSIS_HOME_13.Visible = False

                Me.lblTitle.Text = "CONDITION MONITORING"
                Me.lblTitle.Font.Size = "12"
                REQUEST_Panel_1.Visible = False
                REQUEST_Panel_2.Visible = False
                If HF_CONMON_1.Value = 1 Then
                    CONDITION_MONITORING_HOME_1.Visible = True
                    CONDITION_MONITORING_HOME_1.CssClass = "roundcorners"
                Else
                    CONDITION_MONITORING_HOME_1.Visible = False
                End If
                If HF_CONMON_2.Value = 1 Then
                    CONDITION_MONITORING_HOME_2.Visible = True
                    CONDITION_MONITORING_HOME_2.CssClass = "roundcorners"
                Else
                    CONDITION_MONITORING_HOME_2.Visible = False
                End If
                If HF_CONMON_3.Value = 1 Then
                    CONDITION_MONITORING_HOME_3.Visible = True
                    CONDITION_MONITORING_HOME_3.CssClass = "roundcorners"
                Else
                    CONDITION_MONITORING_HOME_3.Visible = False
                End If
                If HF_CONMON_4.Value = 1 Then
                    CONDITION_MONITORING_HOME_4.Visible = True
                    CONDITION_MONITORING_HOME_4.CssClass = "roundcorners"
                Else
                    CONDITION_MONITORING_HOME_4.Visible = False
                End If
                If HF_CONMON_5.Value = 1 Then
                    CONDITION_MONITORING_HOME_5.Visible = True
                    CONDITION_MONITORING_HOME_5.CssClass = "roundcorners"
                Else
                    CONDITION_MONITORING_HOME_5.Visible = False
                End If
                If HF_CONMON_6.Value = 1 Then
                    CONDITION_MONITORING_HOME_6.Visible = True
                    CONDITION_MONITORING_HOME_6.CssClass = "roundcorners"
                Else
                    CONDITION_MONITORING_HOME_6.Visible = False
                End If
                If HF_CONMON_7.Value = 1 Then
                    CONDITION_MONITORING_HOME_7.Visible = True
                    CONDITION_MONITORING_HOME_7.CssClass = "roundcorners"
                Else
                    CONDITION_MONITORING_HOME_7.Visible = False
                End If
                If HF_CONMON_8.Value = 1 Then
                    CONDITION_MONITORING_HOME_8.Visible = True
                    CONDITION_MONITORING_HOME_8.CssClass = "roundcorners"
                Else
                    CONDITION_MONITORING_HOME_8.Visible = False
                End If

                DATA_INPUT_HOME_1.Visible = False
                DATA_INPUT_HOME_2.Visible = False
                DATA_INPUT_HOME_3.Visible = False
                DATA_INPUT_HOME_4.Visible = False
                DATA_INPUT_HOME_5.Visible = False
                DATA_INPUT_HOME_6.Visible = False
                DATA_INPUT_HOME_7.Visible = False
                DATA_INPUT_HOME_8.Visible = False
                REPORT_HOME_1.Visible = False
                REPORT_HOME_2.Visible = False
                REPORT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_1.Visible = False
                ASSET_MANAGEMENT_HOME_2.Visible = False
                ASSET_MANAGEMENT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_4.Visible = False
                ASSET_MANAGEMENT_HOME_5.Visible = False
                ASSET_MANAGEMENT_HOME_6.Visible = False
                COMPONENT_MANAGEMENT_HOME_1.Visible = False
                COMPONENT_MANAGEMENT_HOME_2.Visible = False
                COMPONENT_MANAGEMENT_HOME_3.Visible = False
                COMPONENT_MANAGEMENT_HOME_4.Visible = False
                COMPONENT_MANAGEMENT_HOME_5.Visible = False
                CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                CUSTOMER_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_1.Visible = False
                EVENT_MANAGEMENT_HOME_2.Visible = False
                EVENT_MANAGEMENT_HOME_3.Visible = False
                EVENT_MANAGEMENT_HOME_4.Visible = False
                EVENT_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_6.Visible = False
                ADMIN_HOME_1.Visible = False
                ADMIN_HOME_2.Visible = False
                ADMIN_HOME_3.Visible = False
                ADMIN_HOME_4.Visible = False
                ADMIN_HOME_5.Visible = False
                ADMIN_HOME_6.Visible = False
                ADMIN_HOME_7.Visible = False
                ADMIN_HOME_8.Visible = False
                ADMIN_HOME_9.Visible = False
            Case "Data Input"
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.T4.Visible = True
                Me.T5.Visible = True
                Me.T6.Visible = True
                Me.T7.Visible = True
                Me.T8.Visible = True
                Me.T9.Visible = True
                Me.T10.Visible = True
                Me.T13.Visible = True
                'Me.T14.Visible = True
                Me.ANALYSIS_Panel_1.Visible = False
                Me.CONDITION_MONITORING_Panel_1.Visible = False
                Me.EVENT_DASHBOARD_Panel_1.Visible = False
                Me.DATA_INPUT_Panel_1.Visible = False
                Me.REPORT_Panel_1.Visible = False
                Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                Me.SERVICING_Panel_1.Visible = False
                Me.PLANT_ACTIVITY_Panel_1.Visible = False
                If HF_ADMIN_0.Value = 1 Then
                    Select Case HF_PQQ_Permission.Value
                        Case 3
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 4
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 5
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case Else
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                    End Select
                End If
                ANALYSIS_HOME_1.Visible = False
                ANALYSIS_HOME_2.Visible = False
                ANALYSIS_HOME_3.Visible = False
                ANALYSIS_HOME_4.Visible = False
                ANALYSIS_HOME_5.Visible = False
                ANALYSIS_HOME_6.Visible = False
                ANALYSIS_HOME_7.Visible = False
                ANALYSIS_HOME_8.Visible = False
                ANALYSIS_HOME_9.Visible = False
                ANALYSIS_HOME_10.Visible = False
                ANALYSIS_HOME_11.Visible = False
                ANALYSIS_HOME_12.Visible = False
                ANALYSIS_HOME_13.Visible = False
                CONDITION_MONITORING_HOME_1.Visible = False
                CONDITION_MONITORING_HOME_2.Visible = False
                CONDITION_MONITORING_HOME_3.Visible = False
                CONDITION_MONITORING_HOME_4.Visible = False
                CONDITION_MONITORING_HOME_5.Visible = False
                CONDITION_MONITORING_HOME_6.Visible = False
                CONDITION_MONITORING_HOME_7.Visible = False
                CONDITION_MONITORING_HOME_8.Visible = False

                Me.lblTitle.Text = "DATA INPUT"
                Me.lblTitle.Font.Size = "14"
                REQUEST_Panel_1.Visible = False
                REQUEST_Panel_2.Visible = False
                If HF_DATAINPUT_1.Value = 1 Then
                    DATA_INPUT_HOME_1.Visible = True
                    DATA_INPUT_HOME_1.CssClass = "roundcorners"
                Else
                    DATA_INPUT_HOME_1.Visible = False
                End If
                If HF_DATAINPUT_2.Value = 1 Then
                    DATA_INPUT_HOME_2.Visible = True
                    DATA_INPUT_HOME_2.CssClass = "roundcorners"
                Else
                    DATA_INPUT_HOME_2.Visible = False
                End If
                If HF_DATAINPUT_3.Value = 1 Then
                    DATA_INPUT_HOME_3.Visible = True
                    DATA_INPUT_HOME_3.CssClass = "roundcorners"
                Else
                    DATA_INPUT_HOME_3.Visible = False
                End If
                If HF_DATAINPUT_4.Value = 1 Then
                    DATA_INPUT_HOME_4.Visible = True
                    DATA_INPUT_HOME_4.CssClass = "roundcorners"
                Else
                    DATA_INPUT_HOME_4.Visible = False
                End If
                If HF_DATAINPUT_5.Value = 1 Then
                    DATA_INPUT_HOME_5.Visible = True
                    DATA_INPUT_HOME_5.CssClass = "roundcorners"
                Else
                    DATA_INPUT_HOME_5.Visible = False
                End If
                If HF_DATAINPUT_6.Value = 1 Then
                    DATA_INPUT_HOME_6.Visible = True
                    DATA_INPUT_HOME_6.CssClass = "roundcorners"
                Else
                    DATA_INPUT_HOME_6.Visible = False
                End If
                If HF_DATAINPUT_7.Value = 1 Then
                    DATA_INPUT_HOME_7.Visible = True
                    DATA_INPUT_HOME_7.CssClass = "roundcorners"
                Else
                    DATA_INPUT_HOME_7.Visible = False
                End If
                If HF_DATAINPUT_8.Value = 1 Then
                    DATA_INPUT_HOME_8.Visible = True
                    DATA_INPUT_HOME_8.CssClass = "roundcorners"
                Else
                    DATA_INPUT_HOME_8.Visible = False
                End If
                REPORT_HOME_1.Visible = False
                REPORT_HOME_2.Visible = False
                REPORT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_1.Visible = False
                ASSET_MANAGEMENT_HOME_2.Visible = False
                ASSET_MANAGEMENT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_4.Visible = False
                ASSET_MANAGEMENT_HOME_5.Visible = False
                ASSET_MANAGEMENT_HOME_6.Visible = False
                COMPONENT_MANAGEMENT_HOME_1.Visible = False
                COMPONENT_MANAGEMENT_HOME_2.Visible = False
                COMPONENT_MANAGEMENT_HOME_3.Visible = False
                COMPONENT_MANAGEMENT_HOME_4.Visible = False
                COMPONENT_MANAGEMENT_HOME_5.Visible = False
                CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                CUSTOMER_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_1.Visible = False
                EVENT_MANAGEMENT_HOME_2.Visible = False
                EVENT_MANAGEMENT_HOME_3.Visible = False
                EVENT_MANAGEMENT_HOME_4.Visible = False
                EVENT_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_6.Visible = False
                ADMIN_HOME_1.Visible = False
                ADMIN_HOME_2.Visible = False
                ADMIN_HOME_3.Visible = False
                ADMIN_HOME_4.Visible = False
                ADMIN_HOME_5.Visible = False
                ADMIN_HOME_6.Visible = False
                ADMIN_HOME_7.Visible = False
                ADMIN_HOME_8.Visible = False
                ADMIN_HOME_9.Visible = False
            Case "Reports"
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.T4.Visible = True
                Me.T5.Visible = True
                Me.T6.Visible = True
                Me.T7.Visible = True
                Me.T8.Visible = True
                Me.T9.Visible = True
                Me.T10.Visible = True
                Me.T13.Visible = True
                ' Me.T14.Visible = True
                Me.ANALYSIS_Panel_1.Visible = False
                Me.CONDITION_MONITORING_Panel_1.Visible = False
                Me.EVENT_DASHBOARD_Panel_1.Visible = False
                Me.DATA_INPUT_Panel_1.Visible = False
                Me.REPORT_Panel_1.Visible = False
                Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                Me.SERVICING_Panel_1.Visible = False
                Me.PLANT_ACTIVITY_Panel_1.Visible = False
                If HF_ADMIN_0.Value = 1 Then
                    Select Case HF_PQQ_Permission.Value
                        Case 3
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 4
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 5
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case Else
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                    End Select
                End If
                ANALYSIS_HOME_1.Visible = False
                ANALYSIS_HOME_2.Visible = False
                ANALYSIS_HOME_3.Visible = False
                ANALYSIS_HOME_4.Visible = False
                ANALYSIS_HOME_5.Visible = False
                ANALYSIS_HOME_6.Visible = False
                ANALYSIS_HOME_7.Visible = False
                ANALYSIS_HOME_8.Visible = False
                ANALYSIS_HOME_9.Visible = False
                ANALYSIS_HOME_10.Visible = False
                ANALYSIS_HOME_11.Visible = False
                ANALYSIS_HOME_12.Visible = False
                ANALYSIS_HOME_13.Visible = False
                CONDITION_MONITORING_HOME_1.Visible = False
                CONDITION_MONITORING_HOME_2.Visible = False
                CONDITION_MONITORING_HOME_3.Visible = False
                CONDITION_MONITORING_HOME_4.Visible = False
                CONDITION_MONITORING_HOME_5.Visible = False
                CONDITION_MONITORING_HOME_6.Visible = False
                CONDITION_MONITORING_HOME_7.Visible = False
                CONDITION_MONITORING_HOME_8.Visible = False
                DATA_INPUT_HOME_1.Visible = False
                DATA_INPUT_HOME_2.Visible = False
                DATA_INPUT_HOME_3.Visible = False
                DATA_INPUT_HOME_4.Visible = False
                DATA_INPUT_HOME_5.Visible = False
                DATA_INPUT_HOME_6.Visible = False
                DATA_INPUT_HOME_7.Visible = False
                DATA_INPUT_HOME_8.Visible = False
                Me.lblTitle.Text = "REPORTS"
                Me.lblTitle.Font.Size = "14"
                REQUEST_Panel_1.Visible = False
                REQUEST_Panel_2.Visible = False
                If HF_REPORTS_1.Value = 1 Then
                    REPORT_HOME_1.Visible = True
                    REPORT_HOME_1.CssClass = "roundcorners"
                Else
                    REPORT_HOME_1.Visible = False
                End If
                If HF_REPORTS_2.Value = 1 Then
                    REPORT_HOME_2.Visible = True
                    REPORT_HOME_2.CssClass = "roundcorners"
                Else
                    REPORT_HOME_2.Visible = False
                End If
                If HF_REPORTS_3.Value = 1 Then
                    REPORT_HOME_3.Visible = True
                    REPORT_HOME_3.CssClass = "roundcorners"
                Else
                    REPORT_HOME_3.Visible = False
                End If

                ASSET_MANAGEMENT_HOME_1.Visible = False
                ASSET_MANAGEMENT_HOME_2.Visible = False
                ASSET_MANAGEMENT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_4.Visible = False
                ASSET_MANAGEMENT_HOME_5.Visible = False
                ASSET_MANAGEMENT_HOME_6.Visible = False
                COMPONENT_MANAGEMENT_HOME_1.Visible = False
                COMPONENT_MANAGEMENT_HOME_2.Visible = False
                COMPONENT_MANAGEMENT_HOME_3.Visible = False
                COMPONENT_MANAGEMENT_HOME_4.Visible = False
                COMPONENT_MANAGEMENT_HOME_5.Visible = False
                CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                CUSTOMER_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_1.Visible = False
                EVENT_MANAGEMENT_HOME_2.Visible = False
                EVENT_MANAGEMENT_HOME_3.Visible = False
                EVENT_MANAGEMENT_HOME_4.Visible = False
                EVENT_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_6.Visible = False
                ADMIN_HOME_1.Visible = False
                ADMIN_HOME_2.Visible = False
                ADMIN_HOME_3.Visible = False
                ADMIN_HOME_4.Visible = False
                ADMIN_HOME_5.Visible = False
                ADMIN_HOME_6.Visible = False
                ADMIN_HOME_7.Visible = False
                ADMIN_HOME_8.Visible = False
                ADMIN_HOME_9.Visible = False
            Case "Asset Management"
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.T4.Visible = True
                Me.T5.Visible = True
                Me.T6.Visible = True
                Me.T7.Visible = True
                Me.T8.Visible = True
                Me.T9.Visible = True
                Me.T10.Visible = True
                Me.T13.Visible = True
                ' Me.T14.Visible = True
                Me.ANALYSIS_Panel_1.Visible = False
                Me.CONDITION_MONITORING_Panel_1.Visible = False
                Me.EVENT_DASHBOARD_Panel_1.Visible = False
                Me.DATA_INPUT_Panel_1.Visible = False
                Me.REPORT_Panel_1.Visible = False
                Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                Me.SERVICING_Panel_1.Visible = False
                Me.PLANT_ACTIVITY_Panel_1.Visible = False
                If HF_ADMIN_0.Value = 1 Then
                    Select Case HF_PQQ_Permission.Value
                        Case 3
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 4
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 5
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case Else
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                    End Select
                End If
                ANALYSIS_HOME_1.Visible = False
                ANALYSIS_HOME_2.Visible = False
                ANALYSIS_HOME_3.Visible = False
                ANALYSIS_HOME_4.Visible = False
                ANALYSIS_HOME_5.Visible = False
                ANALYSIS_HOME_6.Visible = False
                ANALYSIS_HOME_7.Visible = False
                ANALYSIS_HOME_8.Visible = False
                ANALYSIS_HOME_9.Visible = False
                ANALYSIS_HOME_10.Visible = False
                ANALYSIS_HOME_11.Visible = False
                ANALYSIS_HOME_12.Visible = False
                ANALYSIS_HOME_13.Visible = False
                CONDITION_MONITORING_HOME_1.Visible = False
                CONDITION_MONITORING_HOME_2.Visible = False
                CONDITION_MONITORING_HOME_3.Visible = False
                CONDITION_MONITORING_HOME_4.Visible = False
                CONDITION_MONITORING_HOME_5.Visible = False
                CONDITION_MONITORING_HOME_6.Visible = False
                CONDITION_MONITORING_HOME_7.Visible = False
                CONDITION_MONITORING_HOME_8.Visible = False
                DATA_INPUT_HOME_1.Visible = False
                DATA_INPUT_HOME_2.Visible = False
                DATA_INPUT_HOME_3.Visible = False
                DATA_INPUT_HOME_4.Visible = False
                DATA_INPUT_HOME_5.Visible = False
                DATA_INPUT_HOME_6.Visible = False
                DATA_INPUT_HOME_7.Visible = False
                DATA_INPUT_HOME_8.Visible = False
                REPORT_HOME_1.Visible = False
                REPORT_HOME_2.Visible = False
                REPORT_HOME_3.Visible = False

                Me.lblTitle.Text = "ASSET MANAGEMENT"
                Me.lblTitle.Font.Size = "14"
                If HF_REQUEST_1.Value = 1 Then
                    REQUEST_Panel_1.Visible = True
                Else
                    REQUEST_Panel_1.Visible = False
                End If
                If HF_REQUEST_2.Value = 1 Then
                    REQUEST_Panel_2.Visible = True
                Else
                    REQUEST_Panel_2.Visible = False
                End If
                If HF_ASSETMAN_1.Value = 1 Then
                    ASSET_MANAGEMENT_HOME_1.Visible = True
                    ASSET_MANAGEMENT_HOME_1.CssClass = "roundcorners"
                Else
                    ASSET_MANAGEMENT_HOME_1.Visible = False
                End If
                If HF_ASSETMAN_2.Value = 1 Then
                    ASSET_MANAGEMENT_HOME_2.Visible = True
                    ASSET_MANAGEMENT_HOME_2.CssClass = "roundcorners"
                Else
                    ASSET_MANAGEMENT_HOME_2.Visible = False
                End If
                If HF_ASSETMAN_3.Value = 1 Then
                    ASSET_MANAGEMENT_HOME_3.Visible = True
                    ASSET_MANAGEMENT_HOME_3.CssClass = "roundcorners"
                Else
                    ASSET_MANAGEMENT_HOME_3.Visible = False
                End If
                Select Case HF_PQQ_Permission.Value
                    Case 5
                        If HF_ASSETMAN_4.Value = 1 Then
                            ASSET_MANAGEMENT_HOME_4.Visible = True
                            ASSET_MANAGEMENT_HOME_4.CssClass = "roundcorners"
                        Else
                            ASSET_MANAGEMENT_HOME_4.Visible = False
                        End If
                        If HF_ASSETMAN_5.Value = 1 Then
                            ASSET_MANAGEMENT_HOME_5.Visible = True
                            ASSET_MANAGEMENT_HOME_5.CssClass = "roundcorners"
                        Else
                            ASSET_MANAGEMENT_HOME_5.Visible = False
                        End If
                    Case Else
                        If HF_EXCEPTION_18_R.Value = 1 Or HF_EXCEPTION_18_RW.Value = 1 Then
                            If HF_ASSETMAN_4.Value = 1 Then
                                ASSET_MANAGEMENT_HOME_4.Visible = True
                                ASSET_MANAGEMENT_HOME_4.CssClass = "roundcorners"
                            Else
                                ASSET_MANAGEMENT_HOME_4.Visible = False
                            End If
                            If HF_ASSETMAN_5.Value = 1 Then
                                ASSET_MANAGEMENT_HOME_5.Visible = True
                                ASSET_MANAGEMENT_HOME_5.CssClass = "roundcorners"
                            Else
                                ASSET_MANAGEMENT_HOME_5.Visible = False
                            End If
                        Else
                            ASSET_MANAGEMENT_HOME_4.Visible = False
                            ASSET_MANAGEMENT_HOME_5.Visible = False
                        End If

                End Select
                If HF_ASSETMAN_6.Value = 1 Then
                    ASSET_MANAGEMENT_HOME_6.Visible = True
                    ASSET_MANAGEMENT_HOME_6.CssClass = "roundcorners"
                Else
                    ASSET_MANAGEMENT_HOME_6.Visible = False
                End If

                COMPONENT_MANAGEMENT_HOME_1.Visible = False
                COMPONENT_MANAGEMENT_HOME_2.Visible = False
                COMPONENT_MANAGEMENT_HOME_3.Visible = False
                COMPONENT_MANAGEMENT_HOME_4.Visible = False
                COMPONENT_MANAGEMENT_HOME_5.Visible = False
                CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                CUSTOMER_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_1.Visible = False
                EVENT_MANAGEMENT_HOME_2.Visible = False
                EVENT_MANAGEMENT_HOME_3.Visible = False
                EVENT_MANAGEMENT_HOME_4.Visible = False
                EVENT_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_6.Visible = False
                ADMIN_HOME_1.Visible = False
                ADMIN_HOME_2.Visible = False
                ADMIN_HOME_3.Visible = False
                ADMIN_HOME_4.Visible = False
                ADMIN_HOME_5.Visible = False
                ADMIN_HOME_6.Visible = False
                ADMIN_HOME_7.Visible = False
                ADMIN_HOME_8.Visible = False
                ADMIN_HOME_9.Visible = False
            Case "Component Management"
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.T4.Visible = True
                Me.T5.Visible = True
                Me.T6.Visible = True
                Me.T7.Visible = True
                Me.T8.Visible = True
                Me.T9.Visible = True
                Me.T10.Visible = True
                Me.T13.Visible = True
                ' Me.T14.Visible = True
                Me.ANALYSIS_Panel_1.Visible = False
                Me.CONDITION_MONITORING_Panel_1.Visible = False
                Me.EVENT_DASHBOARD_Panel_1.Visible = False
                Me.DATA_INPUT_Panel_1.Visible = False
                Me.REPORT_Panel_1.Visible = False
                Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                Me.SERVICING_Panel_1.Visible = False
                Me.PLANT_ACTIVITY_Panel_1.Visible = False
                If HF_ADMIN_0.Value = 1 Then
                    Select Case HF_PQQ_Permission.Value
                        Case 3
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 4
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 5
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case Else
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                    End Select
                End If
                ANALYSIS_HOME_1.Visible = False
                ANALYSIS_HOME_2.Visible = False
                ANALYSIS_HOME_3.Visible = False
                ANALYSIS_HOME_4.Visible = False
                ANALYSIS_HOME_5.Visible = False
                ANALYSIS_HOME_6.Visible = False
                ANALYSIS_HOME_7.Visible = False
                ANALYSIS_HOME_8.Visible = False
                ANALYSIS_HOME_9.Visible = False
                ANALYSIS_HOME_10.Visible = False
                ANALYSIS_HOME_11.Visible = False
                ANALYSIS_HOME_12.Visible = False
                ANALYSIS_HOME_13.Visible = False
                CONDITION_MONITORING_HOME_1.Visible = False
                CONDITION_MONITORING_HOME_2.Visible = False
                CONDITION_MONITORING_HOME_3.Visible = False
                CONDITION_MONITORING_HOME_4.Visible = False
                CONDITION_MONITORING_HOME_5.Visible = False
                CONDITION_MONITORING_HOME_6.Visible = False
                CONDITION_MONITORING_HOME_7.Visible = False
                CONDITION_MONITORING_HOME_8.Visible = False
                DATA_INPUT_HOME_1.Visible = False
                DATA_INPUT_HOME_2.Visible = False
                DATA_INPUT_HOME_3.Visible = False
                DATA_INPUT_HOME_4.Visible = False
                DATA_INPUT_HOME_5.Visible = False
                DATA_INPUT_HOME_6.Visible = False
                DATA_INPUT_HOME_7.Visible = False
                DATA_INPUT_HOME_8.Visible = False
                REPORT_HOME_1.Visible = False
                REPORT_HOME_2.Visible = False
                REPORT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_1.Visible = False
                ASSET_MANAGEMENT_HOME_2.Visible = False
                ASSET_MANAGEMENT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_4.Visible = False
                ASSET_MANAGEMENT_HOME_5.Visible = False
                ASSET_MANAGEMENT_HOME_6.Visible = False

                Me.lblTitle.Text = "COMPONENT MANAGEMENT"
                Me.lblTitle.Font.Size = "11"
                REQUEST_Panel_1.Visible = False
                REQUEST_Panel_2.Visible = False
                If HF_COMMAN_1.Value = 1 Then
                    COMPONENT_MANAGEMENT_HOME_1.Visible = True
                    COMPONENT_MANAGEMENT_HOME_1.CssClass = "roundcorners"
                Else
                    COMPONENT_MANAGEMENT_HOME_1.Visible = False
                End If
                If HF_COMMAN_2.Value = 1 Then
                    COMPONENT_MANAGEMENT_HOME_2.Visible = True
                    COMPONENT_MANAGEMENT_HOME_2.CssClass = "roundcorners"
                Else
                    COMPONENT_MANAGEMENT_HOME_2.Visible = False
                End If
                If HF_COMMAN_3.Value = 1 Then
                    COMPONENT_MANAGEMENT_HOME_3.Visible = True
                    COMPONENT_MANAGEMENT_HOME_3.CssClass = "roundcorners"
                Else
                    COMPONENT_MANAGEMENT_HOME_3.Visible = False
                End If
                If HF_COMMAN_4.Value = 1 Then
                    COMPONENT_MANAGEMENT_HOME_4.Visible = True
                    COMPONENT_MANAGEMENT_HOME_4.CssClass = "roundcorners"
                Else
                    COMPONENT_MANAGEMENT_HOME_4.Visible = False
                End If
                If HF_COMMAN_5.Value = 1 Then
                    COMPONENT_MANAGEMENT_HOME_5.Visible = True
                    COMPONENT_MANAGEMENT_HOME_5.CssClass = "roundcorners"
                Else
                    COMPONENT_MANAGEMENT_HOME_5.Visible = False
                End If
                CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                CUSTOMER_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_1.Visible = False
                EVENT_MANAGEMENT_HOME_2.Visible = False
                EVENT_MANAGEMENT_HOME_3.Visible = False
                EVENT_MANAGEMENT_HOME_4.Visible = False
                EVENT_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_6.Visible = False
                ADMIN_HOME_1.Visible = False
                ADMIN_HOME_2.Visible = False
                ADMIN_HOME_3.Visible = False
                ADMIN_HOME_4.Visible = False
                ADMIN_HOME_5.Visible = False
                ADMIN_HOME_6.Visible = False
                ADMIN_HOME_7.Visible = False
                ADMIN_HOME_8.Visible = False
                ADMIN_HOME_9.Visible = False
            Case "Customer Management"
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.T4.Visible = True
                Me.T5.Visible = True
                Me.T6.Visible = True
                Me.T7.Visible = True
                Me.T8.Visible = True
                Me.T9.Visible = True
                Me.T10.Visible = True
                Me.T13.Visible = True
                ' Me.T14.Visible = True
                Me.ANALYSIS_Panel_1.Visible = False
                Me.CONDITION_MONITORING_Panel_1.Visible = False
                Me.EVENT_DASHBOARD_Panel_1.Visible = False
                Me.DATA_INPUT_Panel_1.Visible = False
                Me.REPORT_Panel_1.Visible = False
                Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                Me.SERVICING_Panel_1.Visible = False
                Me.PLANT_ACTIVITY_Panel_1.Visible = False
                If HF_ADMIN_0.Value = 1 Then
                    Select Case HF_PQQ_Permission.Value
                        Case 3
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 4
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 5
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case Else
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                    End Select
                End If
                ANALYSIS_HOME_1.Visible = False
                ANALYSIS_HOME_2.Visible = False
                ANALYSIS_HOME_3.Visible = False
                ANALYSIS_HOME_4.Visible = False
                ANALYSIS_HOME_5.Visible = False
                ANALYSIS_HOME_6.Visible = False
                ANALYSIS_HOME_7.Visible = False
                ANALYSIS_HOME_8.Visible = False
                ANALYSIS_HOME_9.Visible = False
                ANALYSIS_HOME_10.Visible = False
                ANALYSIS_HOME_11.Visible = False
                ANALYSIS_HOME_12.Visible = False
                ANALYSIS_HOME_13.Visible = False
                CONDITION_MONITORING_HOME_1.Visible = False
                CONDITION_MONITORING_HOME_2.Visible = False
                CONDITION_MONITORING_HOME_3.Visible = False
                CONDITION_MONITORING_HOME_4.Visible = False
                CONDITION_MONITORING_HOME_5.Visible = False
                CONDITION_MONITORING_HOME_6.Visible = False
                CONDITION_MONITORING_HOME_7.Visible = False
                CONDITION_MONITORING_HOME_8.Visible = False
                DATA_INPUT_HOME_1.Visible = False
                DATA_INPUT_HOME_2.Visible = False
                DATA_INPUT_HOME_3.Visible = False
                DATA_INPUT_HOME_4.Visible = False
                DATA_INPUT_HOME_5.Visible = False
                DATA_INPUT_HOME_6.Visible = False
                DATA_INPUT_HOME_7.Visible = False
                DATA_INPUT_HOME_8.Visible = False
                REPORT_HOME_1.Visible = False
                REPORT_HOME_2.Visible = False
                REPORT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_1.Visible = False
                ASSET_MANAGEMENT_HOME_2.Visible = False
                ASSET_MANAGEMENT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_4.Visible = False
                ASSET_MANAGEMENT_HOME_5.Visible = False
                ASSET_MANAGEMENT_HOME_6.Visible = False
                COMPONENT_MANAGEMENT_HOME_1.Visible = False
                COMPONENT_MANAGEMENT_HOME_2.Visible = False
                COMPONENT_MANAGEMENT_HOME_3.Visible = False
                COMPONENT_MANAGEMENT_HOME_4.Visible = False
                COMPONENT_MANAGEMENT_HOME_5.Visible = False

                Me.lblTitle.Text = "CUSTOMER MANAGEMENT"
                Me.lblTitle.Font.Size = "11"
                REQUEST_Panel_1.Visible = False
                REQUEST_Panel_2.Visible = False
                If HF_CUSMAN_1.Value = 1 Then
                    CUSTOMER_MANAGEMENT_HOME_1.Visible = True
                    CUSTOMER_MANAGEMENT_HOME_1.CssClass = "roundcorners"
                Else
                    CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                End If
                If HF_CUSMAN_2.Value = 1 Then
                    CUSTOMER_MANAGEMENT_HOME_2.Visible = True
                    CUSTOMER_MANAGEMENT_HOME_2.CssClass = "roundcorners"
                Else
                    CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                End If
                If HF_CUSMAN_3.Value = 1 Then
                    CUSTOMER_MANAGEMENT_HOME_3.Visible = True
                    CUSTOMER_MANAGEMENT_HOME_3.CssClass = "roundcorners"
                Else
                    CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                End If
                If HF_CUSMAN_4.Value = 1 Then
                    CUSTOMER_MANAGEMENT_HOME_4.Visible = True
                    CUSTOMER_MANAGEMENT_HOME_4.CssClass = "roundcorners"
                Else
                    CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                End If
                If HF_CUSMAN_5.Value = 1 Then
                    CUSTOMER_MANAGEMENT_HOME_5.Visible = True
                    CUSTOMER_MANAGEMENT_HOME_5.CssClass = "roundcorners"
                Else
                    CUSTOMER_MANAGEMENT_HOME_5.Visible = False
                End If
                EVENT_MANAGEMENT_HOME_1.Visible = False
                EVENT_MANAGEMENT_HOME_2.Visible = False
                EVENT_MANAGEMENT_HOME_3.Visible = False
                EVENT_MANAGEMENT_HOME_4.Visible = False
                EVENT_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_6.Visible = False
                ADMIN_HOME_1.Visible = False
                ADMIN_HOME_2.Visible = False
                ADMIN_HOME_3.Visible = False
                ADMIN_HOME_4.Visible = False
                ADMIN_HOME_5.Visible = False
                ADMIN_HOME_6.Visible = False
                ADMIN_HOME_7.Visible = False
                ADMIN_HOME_8.Visible = False
                ADMIN_HOME_9.Visible = False
            Case "Event Management"
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.T4.Visible = True
                Me.T5.Visible = True
                Me.T6.Visible = True
                Me.T7.Visible = True
                Me.T8.Visible = True
                Me.T9.Visible = True
                Me.T10.Visible = True
                Me.T13.Visible = True
                'Me.T14.Visible = True
                Me.ANALYSIS_Panel_1.Visible = False
                Me.CONDITION_MONITORING_Panel_1.Visible = False
                Me.EVENT_DASHBOARD_Panel_1.Visible = False
                Me.DATA_INPUT_Panel_1.Visible = False
                Me.REPORT_Panel_1.Visible = False
                Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                Me.SERVICING_Panel_1.Visible = False
                Me.PLANT_ACTIVITY_Panel_1.Visible = False
                If HF_ADMIN_0.Value = 1 Then
                    Select Case HF_PQQ_Permission.Value
                        Case 3
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 4
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 5
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case Else
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                    End Select
                End If
                ANALYSIS_HOME_1.Visible = False
                ANALYSIS_HOME_2.Visible = False
                ANALYSIS_HOME_3.Visible = False
                ANALYSIS_HOME_4.Visible = False
                ANALYSIS_HOME_5.Visible = False
                ANALYSIS_HOME_6.Visible = False
                ANALYSIS_HOME_7.Visible = False
                ANALYSIS_HOME_8.Visible = False
                ANALYSIS_HOME_9.Visible = False
                ANALYSIS_HOME_10.Visible = False
                ANALYSIS_HOME_11.Visible = False
                ANALYSIS_HOME_12.Visible = False
                ANALYSIS_HOME_13.Visible = False
                CONDITION_MONITORING_HOME_1.Visible = False
                CONDITION_MONITORING_HOME_2.Visible = False
                CONDITION_MONITORING_HOME_3.Visible = False
                CONDITION_MONITORING_HOME_4.Visible = False
                CONDITION_MONITORING_HOME_5.Visible = False
                CONDITION_MONITORING_HOME_6.Visible = False
                CONDITION_MONITORING_HOME_7.Visible = False
                CONDITION_MONITORING_HOME_8.Visible = False
                DATA_INPUT_HOME_1.Visible = False
                DATA_INPUT_HOME_2.Visible = False
                DATA_INPUT_HOME_3.Visible = False
                DATA_INPUT_HOME_4.Visible = False
                DATA_INPUT_HOME_5.Visible = False
                DATA_INPUT_HOME_6.Visible = False
                DATA_INPUT_HOME_7.Visible = False
                DATA_INPUT_HOME_8.Visible = False
                REPORT_HOME_1.Visible = False
                REPORT_HOME_2.Visible = False
                REPORT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_1.Visible = False
                ASSET_MANAGEMENT_HOME_2.Visible = False
                ASSET_MANAGEMENT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_4.Visible = False
                ASSET_MANAGEMENT_HOME_5.Visible = False
                ASSET_MANAGEMENT_HOME_6.Visible = False
                COMPONENT_MANAGEMENT_HOME_1.Visible = False
                COMPONENT_MANAGEMENT_HOME_2.Visible = False
                COMPONENT_MANAGEMENT_HOME_3.Visible = False
                COMPONENT_MANAGEMENT_HOME_4.Visible = False
                COMPONENT_MANAGEMENT_HOME_5.Visible = False
                CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                CUSTOMER_MANAGEMENT_HOME_5.Visible = False

                Me.lblTitle.Text = "EVENT MANAGEMENT"
                Me.lblTitle.Font.Size = "14"
                REQUEST_Panel_1.Visible = False
                REQUEST_Panel_2.Visible = False
                If HF_EVENTMAN_1.Value = 1 Then
                    EVENT_MANAGEMENT_HOME_1.Visible = True
                    EVENT_MANAGEMENT_HOME_1.CssClass = "roundcorners"
                Else
                    EVENT_MANAGEMENT_HOME_1.Visible = False
                End If
                If HF_EVENTMAN_2.Value = 1 Then
                    EVENT_MANAGEMENT_HOME_2.Visible = True
                    EVENT_MANAGEMENT_HOME_2.CssClass = "roundcorners"
                Else
                    EVENT_MANAGEMENT_HOME_2.Visible = False
                End If
                If HF_EVENTMAN_3.Value = 1 Then
                    EVENT_MANAGEMENT_HOME_3.Visible = True
                    EVENT_MANAGEMENT_HOME_3.CssClass = "roundcorners"
                Else
                    EVENT_MANAGEMENT_HOME_3.Visible = False
                End If
                If HF_EVENTMAN_4.Value = 1 Then
                    EVENT_MANAGEMENT_HOME_4.Visible = True
                    EVENT_MANAGEMENT_HOME_4.CssClass = "roundcorners"
                Else
                    EVENT_MANAGEMENT_HOME_4.Visible = False
                End If
                If HF_EVENTMAN_5.Value = 1 Then
                    EVENT_MANAGEMENT_HOME_5.Visible = True
                    EVENT_MANAGEMENT_HOME_5.CssClass = "roundcorners"
                Else
                    EVENT_MANAGEMENT_HOME_5.Visible = False
                End If
                If HF_EVENTMAN_6.Value = 1 Then
                    EVENT_MANAGEMENT_HOME_6.Visible = True
                    EVENT_MANAGEMENT_HOME_6.CssClass = "roundcorners"
                Else
                    EVENT_MANAGEMENT_HOME_6.Visible = False
                End If
                ADMIN_HOME_1.Visible = False
                ADMIN_HOME_2.Visible = False
                ADMIN_HOME_3.Visible = False
                ADMIN_HOME_4.Visible = False
                ADMIN_HOME_5.Visible = False
                ADMIN_HOME_6.Visible = False
                ADMIN_HOME_7.Visible = False
                ADMIN_HOME_8.Visible = False
                ADMIN_HOME_9.Visible = False
            Case "Admin"
                Me.T1.Visible = True
                Me.T2.Visible = True
                Me.T3.Visible = True
                Me.T4.Visible = True
                Me.T5.Visible = True
                Me.T6.Visible = True
                Me.T7.Visible = True
                Me.T8.Visible = True
                Me.T9.Visible = True
                Me.T10.Visible = True
                Me.T13.Visible = True
                'Me.T14.Visible = True
                Me.ANALYSIS_Panel_1.Visible = False
                Me.CONDITION_MONITORING_Panel_1.Visible = False
                Me.EVENT_DASHBOARD_Panel_1.Visible = False
                Me.DATA_INPUT_Panel_1.Visible = False
                Me.REPORT_Panel_1.Visible = False
                Me.ASSET_MANAGEMENT_Panel_1.Visible = False
                Me.COMPONENT_MANAGEMENT_Panel_1.Visible = False
                Me.CUSTOMER_MANAGEMENT_Panel_1.Visible = False
                Me.EVENT_MANAGEMENT_Panel_1.Visible = False
                Me.SERVICING_Panel_1.Visible = False
                Me.PLANT_ACTIVITY_Panel_1.Visible = False
                If HF_ADMIN_0.Value = 1 Then
                    Select Case HF_PQQ_Permission.Value
                        Case 3
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 4
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case 5
                            Me.ADMINISTRATION_Panel_1.Visible = True
                        Case Else
                            If HF_EXCEPTION_11_R.Value = 1 Or HF_EXCEPTION_11_RW.Value = 1 Then
                                Me.ADMINISTRATION_Panel_1.Visible = True
                            Else
                                Me.ADMINISTRATION_Panel_1.Visible = False
                            End If
                    End Select
                End If
                ANALYSIS_HOME_1.Visible = False
                ANALYSIS_HOME_2.Visible = False
                ANALYSIS_HOME_3.Visible = False
                ANALYSIS_HOME_4.Visible = False
                ANALYSIS_HOME_5.Visible = False
                ANALYSIS_HOME_6.Visible = False
                ANALYSIS_HOME_7.Visible = False
                ANALYSIS_HOME_8.Visible = False
                ANALYSIS_HOME_9.Visible = False
                ANALYSIS_HOME_10.Visible = False
                ANALYSIS_HOME_11.Visible = False
                ANALYSIS_HOME_12.Visible = False
                ANALYSIS_HOME_13.Visible = False
                CONDITION_MONITORING_HOME_1.Visible = False
                CONDITION_MONITORING_HOME_2.Visible = False
                CONDITION_MONITORING_HOME_3.Visible = False
                CONDITION_MONITORING_HOME_4.Visible = False
                CONDITION_MONITORING_HOME_5.Visible = False
                CONDITION_MONITORING_HOME_6.Visible = False
                CONDITION_MONITORING_HOME_7.Visible = False
                CONDITION_MONITORING_HOME_8.Visible = False
                DATA_INPUT_HOME_1.Visible = False
                DATA_INPUT_HOME_2.Visible = False
                DATA_INPUT_HOME_3.Visible = False
                DATA_INPUT_HOME_4.Visible = False
                DATA_INPUT_HOME_5.Visible = False
                DATA_INPUT_HOME_6.Visible = False
                DATA_INPUT_HOME_7.Visible = False
                DATA_INPUT_HOME_8.Visible = False
                REPORT_HOME_1.Visible = False
                REPORT_HOME_2.Visible = False
                REPORT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_1.Visible = False
                ASSET_MANAGEMENT_HOME_2.Visible = False
                ASSET_MANAGEMENT_HOME_3.Visible = False
                ASSET_MANAGEMENT_HOME_4.Visible = False
                ASSET_MANAGEMENT_HOME_5.Visible = False
                ASSET_MANAGEMENT_HOME_6.Visible = False
                COMPONENT_MANAGEMENT_HOME_1.Visible = False
                COMPONENT_MANAGEMENT_HOME_2.Visible = False
                COMPONENT_MANAGEMENT_HOME_3.Visible = False
                COMPONENT_MANAGEMENT_HOME_4.Visible = False
                COMPONENT_MANAGEMENT_HOME_5.Visible = False
                CUSTOMER_MANAGEMENT_HOME_1.Visible = False
                CUSTOMER_MANAGEMENT_HOME_2.Visible = False
                CUSTOMER_MANAGEMENT_HOME_3.Visible = False
                CUSTOMER_MANAGEMENT_HOME_4.Visible = False
                CUSTOMER_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_1.Visible = False
                EVENT_MANAGEMENT_HOME_2.Visible = False
                EVENT_MANAGEMENT_HOME_3.Visible = False
                EVENT_MANAGEMENT_HOME_4.Visible = False
                EVENT_MANAGEMENT_HOME_5.Visible = False
                EVENT_MANAGEMENT_HOME_6.Visible = False

                Me.lblTitle.Text = "SYSTEM ADMINISTRATION"
                Me.lblTitle.Font.Size = "12"
                REQUEST_Panel_1.Visible = False
                REQUEST_Panel_2.Visible = False
                If HF_ADMIN_1.Value = 1 Then
                    ADMIN_HOME_1.Visible = True
                    ADMIN_HOME_1.CssClass = "roundcorners"
                Else
                    ADMIN_HOME_1.Visible = False
                End If
                If HF_ADMIN_2.Value = 1 Then
                    ADMIN_HOME_2.Visible = True
                    ADMIN_HOME_2.CssClass = "roundcorners"
                Else
                    ADMIN_HOME_2.Visible = False
                End If
                If HF_ADMIN_3.Value = 1 Then
                    ADMIN_HOME_3.Visible = True
                    ADMIN_HOME_3.CssClass = "roundcorners"
                Else
                    ADMIN_HOME_3.Visible = False
                End If
                If HF_ADMIN_4.Value = 1 Then
                    ADMIN_HOME_4.Visible = True
                    ADMIN_HOME_4.CssClass = "roundcorners"
                Else
                    ADMIN_HOME_4.Visible = False
                End If
                If HF_ADMIN_5.Value = 1 Then
                    ADMIN_HOME_5.Visible = True
                    ADMIN_HOME_5.CssClass = "roundcorners"
                Else
                    ADMIN_HOME_5.Visible = False
                End If
                If HF_ADMIN_7.Value = 1 Then
                    ADMIN_HOME_7.Visible = True
                    ADMIN_HOME_7.CssClass = "roundcorners"
                Else
                    ADMIN_HOME_7.Visible = False
                End If
                Select Case HF_PQQ_Permission.Value
                    Case 3
                        If HF_ADMIN_6.Value = 1 Then
                            Me.ADMIN_HOME_6.Visible = True
                            Me.ADMIN_HOME_6.CssClass = "roundcorners"
                        Else
                            ADMIN_HOME_6.Visible = False
                        End If
                        If HF_ADMIN_8.Value = 1 Then
                            Me.ADMIN_HOME_8.Visible = True
                            Me.ADMIN_HOME_8.CssClass = "roundcorners"
                        Else
                            ADMIN_HOME_8.Visible = False
                        End If
                    Case 4
                        If HF_ADMIN_6.Value = 1 Then
                            Me.ADMIN_HOME_6.Visible = True
                            Me.ADMIN_HOME_6.CssClass = "roundcorners"
                        Else
                            ADMIN_HOME_6.Visible = False
                        End If
                        If HF_ADMIN_8.Value = 1 Then
                            Me.ADMIN_HOME_8.Visible = True
                            Me.ADMIN_HOME_8.CssClass = "roundcorners"
                        Else
                            ADMIN_HOME_8.Visible = False
                        End If
                    Case 5
                        If HF_ADMIN_6.Value = 1 Then
                            Me.ADMIN_HOME_6.Visible = True
                            Me.ADMIN_HOME_6.CssClass = "roundcorners"
                        Else
                            ADMIN_HOME_6.Visible = False
                        End If
                        If HF_ADMIN_8.Value = 1 Then
                            Me.ADMIN_HOME_8.Visible = True
                            Me.ADMIN_HOME_8.CssClass = "roundcorners"
                        Else
                            ADMIN_HOME_8.Visible = False
                        End If
                        If HF_ADMIN_9.Value = 1 Then
                            Me.ADMIN_HOME_9.Visible = True
                            Me.ADMIN_HOME_9.CssClass = "roundcorners"
                        Else
                            ADMIN_HOME_9.Visible = False
                        End If
                    Case Else
                        Me.T4.Visible = False
                        Me.T9.Visible = False
                        Me.T5.Visible = False
                End Select
        End Select
    End Sub
    Sub Box1()
        WT_No.Value = "1"
        GetThresholdFromWidget()
        Label1.Text = WT_Name.Value
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.Widget_HOME_AVERAGE_ENGINEER_UTILISATION_SP()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            CountI = drvSql("ThisCount").ToString()
        End If
        Me.lblCount_1.Text = CountI + "%"
        If lblCount_1.Text = "100.00%" Then
            lblCount_1.Font.Size = 16
        Else
            lblCount_1.Font.Size = 18
        End If
        Dim qryLW As New Database.Queries
        qryLW.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt2 As DataTable = qry.Widget_HOME_AVERAGE_ENGINEER_UTILISATION_LW_SP()
        If dt2.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            LWCountI = drvSql("ThisCount").ToString()
        End If
        If CDbl(CountI) < CDbl(LWCountI) Then
            Me.img_Arrow_1.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_1.ToolTip = LWCountI
        ElseIf CDbl(CountI) = CDbl(LWCountI) Then
            Me.img_Arrow_1.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_1.ToolTip = LWCountI
        Else
            Me.img_Arrow_1.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_1.ToolTip = LWCountI
        End If
        If CDbl(CountI) >= CDbl(WT_Green.Value) Then
            Me.ID_1_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_1_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CDbl(CountI) >= CDbl(WT_Amber.Value) And CDbl(CountI) < CDbl(WT_Green.Value) Then
            Me.ID_1_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_1_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CDbl(CountI) < CDbl(WT_Red.Value) Then
            Me.ID_1_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_1_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box2()
        WT_No.Value = "2"
        GetThresholdFromWidget()
        Label2.Text = WT_Name.Value
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.Widget_HOME_CORRECT_PARTS_SP()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            CountI = drvSql("ThisCount").ToString()
        End If
        Me.lblCount_2.Text = CountI + "%"
        If lblCount_2.Text = "100.00%" Then
            lblCount_2.Font.Size = 16
        Else
            lblCount_2.Font.Size = 18
        End If
        Dim qryLW As New Database.Queries
        qryLW.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt2 As DataTable = qry.Widget_HOME_CORRECT_PARTS_LW_SP()
        If dt2.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            LWCountI = drvSql("ThisCount").ToString()
        End If
        If CDbl(CountI) < CDbl(LWCountI) Then
            Me.img_Arrow_2.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_2.ToolTip = LWCountI
        ElseIf CDbl(CountI) = CDbl(LWCountI) Then
            Me.img_Arrow_2.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_2.ToolTip = LWCountI
        Else
            Me.img_Arrow_2.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_2.ToolTip = LWCountI
        End If
        If CDbl(CountI) >= CDbl(WT_Green.Value) Then
            Me.ID_2_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_2_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CDbl(CountI) >= CDbl(WT_Amber.Value) And CDbl(CountI) < CDbl(WT_Green.Value) Then
            Me.ID_2_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_2_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CDbl(CountI) < CDbl(WT_Red.Value) Then
            Me.ID_2_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_2_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box3()
        WT_No.Value = "3"
        GetThresholdFromWidget()
        Label3.Text = WT_Name.Value
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.Widget_HOME_FIRST_TIME_FIX_RATIO_SP()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            CountI = drvSql("ThisCount").ToString()
        End If
        Me.lblCount_3.Text = CountI + "%"
        If lblCount_3.Text = "100.00%" Then
            lblCount_3.Font.Size = 16
        Else
            lblCount_3.Font.Size = 18
        End If
        Dim qryLW As New Database.Queries
        qryLW.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt2 As DataTable = qry.Widget_HOME_FIRST_TIME_FIX_RATIO_LW_SP()
        If dt2.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            LWCountI = drvSql("ThisCount").ToString()
        End If
        If CDbl(CountI) < CDbl(LWCountI) Then
            Me.img_Arrow_3.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_3.ToolTip = LWCountI
        ElseIf CDbl(CountI) = CDbl(LWCountI) Then
            Me.img_Arrow_3.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_3.ToolTip = LWCountI
        Else
            Me.img_Arrow_3.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_3.ToolTip = LWCountI
        End If
        If CDbl(CountI) >= CDbl(WT_Green.Value) Then
            Me.ID_3_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_3_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CDbl(CountI) >= CDbl(WT_Amber.Value) And CDbl(CountI) < CDbl(WT_Green.Value) Then
            Me.ID_3_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_3_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CDbl(CountI) < CDbl(WT_Red.Value) Then
            Me.ID_3_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_3_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box4()
        WT_No.Value = "4"
        GetThresholdFromWidget()
        Label4.Text = WT_Name.Value
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.Widget_HOME_JOB_COMPLETION_SP()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            CountI = drvSql("ThisCount").ToString()
        End If
        Me.lblCount_4.Text = CountI + "%"
        If lblCount_4.Text = "100.00%" Then
            lblCount_4.Font.Size = 16
        Else
            lblCount_4.Font.Size = 18
        End If
        Dim qryLW As New Database.Queries
        qryLW.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt2 As DataTable = qry.Widget_HOME_JOB_COMPLETION_LW_SP()
        If dt2.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            LWCountI = drvSql("ThisCount").ToString()
        End If
        If CDbl(CountI) < CDbl(LWCountI) Then
            Me.img_Arrow_4.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_4.ToolTip = LWCountI
        ElseIf CDbl(CountI) = CDbl(LWCountI) Then
            Me.img_Arrow_4.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_4.ToolTip = LWCountI
        Else
            Me.img_Arrow_4.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_4.ToolTip = LWCountI
        End If
        If CDbl(CountI) >= CDbl(WT_Green.Value) Then
            Me.ID_4_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_4_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CDbl(CountI) >= CDbl(WT_Amber.Value) And CDbl(CountI) < CDbl(WT_Green.Value) Then
            Me.ID_4_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_4_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CDbl(CountI) < CDbl(WT_Red.Value) Then
            Me.ID_4_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_4_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box5()
        WT_No.Value = "5"
        GetThresholdFromWidget()
        Label5.Text = WT_Name.Value
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.Widget_HOME_CUSTOMER_SERVICE_SP()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            CountI = drvSql("ThisCount").ToString()
        End If
        Me.lblCount_5.Text = CountI + "%"
        If lblCount_5.Text = "100.00%" Then
            lblCount_5.Font.Size = 16
        Else
            lblCount_5.Font.Size = 18
        End If
        Dim qryLW As New Database.Queries
        qryLW.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt2 As DataTable = qry.Widget_HOME_CUSTOMER_SERVICE_LW_SP()
        If dt2.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            LWCountI = drvSql("ThisCount").ToString()
        End If
        If CDbl(CountI) < CDbl(LWCountI) Then
            Me.img_Arrow_5.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_5.ToolTip = LWCountI
        ElseIf CDbl(CountI) = CDbl(LWCountI) Then
            Me.img_Arrow_5.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_5.ToolTip = LWCountI
        Else
            Me.img_Arrow_5.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_5.ToolTip = LWCountI
        End If
        If CDbl(CountI) >= CDbl(WT_Green.Value) Then
            Me.ID_5_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_5_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CDbl(CountI) >= CDbl(WT_Amber.Value) And CDbl(CountI) < CDbl(WT_Green.Value) Then
            Me.ID_5_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_5_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CDbl(CountI) < CDbl(WT_Red.Value) Then
            Me.ID_5_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_5_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    'Sub Box6()
    '    'WT_No.Value = "6"
    '    'GetThresholdFromWidget()
    '    'Label6.Text = WT_Name.Value
    '    Dim CountI As String = "0"
    '    Dim LWCountI As String = "0"
    '    Dim dvSqlSession As DataView = DirectCast(SqlDS_Box6.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In dvSqlSession
    '        CountI = drvSql("ThisCount").ToString()
    '    Next
    '    Me.lblCount_6.Text = CountI
    '    'If lblCount_6.Text = "0" Then lblCount_6.Text = "N/A"
    '    Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box6_LW.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In LMdvSqlSession
    '        LWCountI = drvSql("ThisCount").ToString()
    '    Next
    '    If CInt(CountI) < CInt(LWCountI) Then
    '        Me.img_Arrow_6.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
    '        Me.img_Arrow_6.ToolTip = LWCountI
    '    ElseIf CInt(CountI) = CInt(LWCountI) Then
    '        Me.img_Arrow_6.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
    '        Me.img_Arrow_6.ToolTip = LWCountI
    '    Else
    '        Me.img_Arrow_6.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
    '        Me.img_Arrow_6.ToolTip = LWCountI
    '    End If
    '    If CInt(lblCount_6.Text) < 15 Then
    '        Me.ID_6_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
    '        Me.img_6_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
    '    ElseIf CInt(lblCount_6.Text) >= 15 And CInt(lblCount_6.Text) < 30 Then
    '        Me.ID_6_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
    '        Me.img_6_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
    '    ElseIf CInt(lblCount_6.Text) >= 30 Then
    '        Me.ID_6_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
    '        Me.img_6_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
    '    End If
    'End Sub
    'Sub Box7()
    '    'WT_No.Value = "7"
    '    'GetThresholdFromWidget()
    '    'Label7.Text = WT_Name.Value
    '    Dim CountI As String = "0"
    '    Dim LWCountI As String = "0"
    '    Dim dvSqlSession As DataView = DirectCast(SqlDS_Box7.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In dvSqlSession
    '        CountI = drvSql("ThisCount").ToString()
    '    Next
    '    Me.lblCount_7.Text = CountI
    '    'If lblCount_7.Text = "0" Then lblCount_7.Text = "N/A"
    '    Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box7_LW.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In LMdvSqlSession
    '        LWCountI = drvSql("ThisCount").ToString()
    '    Next
    '    If CInt(CountI) < CInt(LWCountI) Then
    '        Me.img_Arrow_7.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
    '        Me.img_Arrow_7.ToolTip = LWCountI
    '    ElseIf CInt(CountI) = CInt(LWCountI) Then
    '        Me.img_Arrow_7.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
    '        Me.img_Arrow_7.ToolTip = LWCountI
    '    Else
    '        Me.img_Arrow_7.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
    '        Me.img_Arrow_7.ToolTip = LWCountI
    '    End If
    '    If CInt(lblCount_7.Text) < 5 Then
    '        Me.ID_7_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
    '        Me.img_7_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
    '    ElseIf CInt(lblCount_7.Text) >= 5 And CInt(lblCount_7.Text) < 10 Then
    '        Me.ID_7_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
    '        Me.img_7_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
    '    ElseIf CInt(lblCount_7.Text) >= 10 Then
    '        Me.ID_7_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
    '        Me.img_7_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
    '    End If
    'End Sub
    'Sub Box8()
    '    'WT_No.Value = "8"
    '    'GetThresholdFromWidget()
    '    'Label8.Text = WT_Name.Value
    '    Dim CountI As String = "0"
    '    Dim LWCountI As String = "0"
    '    Dim dvSqlSession As DataView = DirectCast(SqlDS_Box8.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In dvSqlSession
    '        CountI = drvSql("ThisCount").ToString()
    '    Next
    '    Me.lblCount_8.Text = CountI
    '    'If lblCount_8.Text = "0" Then lblCount_8.Text = "N/A"
    '    Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box8_LW.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In LMdvSqlSession
    '        LWCountI = drvSql("ThisCount").ToString()
    '    Next
    '    If CInt(CountI) < CInt(LWCountI) Then
    '        Me.img_Arrow_8.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
    '        Me.img_Arrow_8.ToolTip = LWCountI
    '    ElseIf CInt(CountI) = CInt(LWCountI) Then
    '        Me.img_Arrow_8.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
    '        Me.img_Arrow_8.ToolTip = LWCountI
    '    Else
    '        Me.img_Arrow_8.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
    '        Me.img_Arrow_8.ToolTip = LWCountI
    '    End If
    '    If CInt(lblCount_8.Text) < 1 Then
    '        Me.ID_8_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
    '        Me.img_8_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
    '    ElseIf CInt(lblCount_8.Text) >= 1 And CInt(lblCount_8.Text) < 2 Then
    '        Me.ID_8_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
    '        Me.img_8_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
    '    ElseIf CInt(lblCount_8.Text) >= 2 Then
    '        Me.ID_8_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
    '        Me.img_8_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
    '    End If
    'End Sub
    'Sub Box9()
    'WT_No.Value = "9"
    'GetThresholdFromWidget()
    'Label9.Text = WT_Name.Value
    '    Dim CountI As String = "0"
    '    Dim LWCountI As String = "0"
    '    Dim dvSqlSession As DataView = DirectCast(SqlDS_Box9.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In dvSqlSession
    '        CountI = drvSql("ThisCount").ToString()
    '    Next
    '    Me.lblCount_9.Text = CountI
    '    'If lblCount_9.Text = "0" Then lblCount_9.Text = "N/A"
    '    Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box9_LW.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In LMdvSqlSession
    '        LWCountI = drvSql("ThisCount").ToString()
    '    Next
    '    If CInt(CountI) < CInt(LWCountI) Then
    '        Me.img_Arrow_9.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
    '        Me.img_Arrow_9.ToolTip = LWCountI
    '    ElseIf CInt(CountI) = CInt(LWCountI) Then
    '        Me.img_Arrow_9.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
    '        Me.img_Arrow_9.ToolTip = LWCountI
    '    Else
    '        Me.img_Arrow_9.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
    '        Me.img_Arrow_9.ToolTip = LWCountI
    '    End If
    '    If CInt(lblCount_9.Text) < 10 Then
    '        Me.ID_9_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
    '        Me.img_9_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
    '    ElseIf CInt(lblCount_9.Text) >= 10 And CInt(lblCount_9.Text) < 15 Then
    '        Me.ID_9_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
    '        Me.img_9_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
    '    ElseIf CInt(lblCount_9.Text) >= 15 Then
    '        Me.ID_9_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
    '        Me.img_9_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
    '    End If
    'End Sub
End Class