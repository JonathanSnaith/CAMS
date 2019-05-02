Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class DASHBOARDS_flt_D_STATISTICS
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        Dim GetYear As Integer
        Dim GetMonth As Integer
        GetYear = DatePart(DateInterval.Year, DateTime.Now)
        GetMonth = DatePart(DateInterval.Month, DateTime.Now)
        'If GetMonth < 10 Then GetYear = GetYear - 1
        HF_FY.Value = GetYear
        ''''Me.RadCB_FY.SelectedValue = GetYear
        Box1()
        Box2()
        Box3()
        Box4()
        Box5()
        'Box6()
        'Box7()
        'Box8()
        'Box9()
        Apply_Permissions()
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
        With btn1
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn2
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn3
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn4
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn5
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        'With btn6
        '    .Width = 1
        '    .Height = 1
        '    .BorderStyle = BorderStyle.None
        '    .CssClass = "hideitem"
        'End With
        'With btn7
        '    .Width = 1
        '    .Height = 1
        '    .BorderStyle = BorderStyle.None
        '    .CssClass = "hideitem"
        'End With
        'With btn8
        '    .Width = 1
        '    .Height = 1
        '    .BorderStyle = BorderStyle.None
        '    .CssClass = "hideitem"
        'End With
        'With btn9
        '    .Width = 1
        '    .Height = 1
        '    .BorderStyle = BorderStyle.None
        '    .CssClass = "hideitem"
        'End With
        'With Me.ID_1_A.Attributes
        '    .Add("onClick", "fn_1()")
        'End With
        With Me.ID_1_B.Attributes
            .Add("onClick", "fn_1_b()")
        End With
        'With Me.ID_2_A.Attributes
        '    .Add("onClick", "fn_2()")
        'End With
        With Me.ID_2_B.Attributes
            .Add("onClick", "fn_2_b()")
        End With
        'With Me.ID_3_A.Attributes
        '    .Add("onClick", "fn_3()")
        'End With
        With Me.ID_3_B.Attributes
            .Add("onClick", "fn_3_b()")
        End With
        'With Me.ID_4_A.Attributes
        '    .Add("onClick", "fn_4()")
        'End With
        With Me.ID_4_B.Attributes
            .Add("onClick", "fn_4_b()")
        End With
        'With Me.ID_5_A.Attributes
        '    .Add("onClick", "fn_5()")
        'End With
        With Me.ID_5_B.Attributes
            .Add("onClick", "fn_5_b()")
        End With
        'With Me.ID_6_A.Attributes
        '    .Add("onClick", "fn_6()")
        'End With
        'With Me.ID_6_B.Attributes
        '    .Add("onClick", "fn_6_b()")
        'End With
        'With Me.ID_7_A.Attributes
        '    .Add("onClick", "fn_7()")
        'End With
        'With Me.ID_7_B.Attributes
        '    .Add("onClick", "fn_7_b()")
        'End With
        'With Me.ID_8_A.Attributes
        '    .Add("onClick", "fn_8()")
        'End With
        'With Me.ID_8_B.Attributes
        '    .Add("onClick", "fn_8_b()")
        'End With
        'With Me.ID_9_A.Attributes
        '    .Add("onClick", "fn_9()")
        'End With
        'With Me.ID_9_B.Attributes
        '    .Add("onClick", "fn_9_b()")
        'End With
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "Dashboards - Statistics"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
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
            Me.WT_SP_Statistics_Name.Value = drvSql("WT_SP_Statistics_Name").ToString()
        End If
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
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 0
                Me.Table101.Visible = False
                Me.Table102.Visible = False
                Me.Table103.Visible = False
                Me.Table104.Visible = False
                Me.Table105.Visible = False
                'Me.Table106.Visible = False
                'Me.Table107.Visible = False
                'Me.Table108.Visible = False
                'Me.Table109.Visible = False
            Case 1
                Me.Table101.Visible = False
                Me.Table102.Visible = False
                Me.Table103.Visible = False
                Me.Table104.Visible = False
                Me.Table105.Visible = False
                'Me.Table106.Visible = False
                'Me.Table107.Visible = False
                'Me.Table108.Visible = False
                'Me.Table109.Visible = False
            Case 2
                Me.Table101.Visible = False
                Me.Table102.Visible = False
                Me.Table103.Visible = False
                Me.Table104.Visible = False
                Me.Table105.Visible = False
                'Me.Table106.Visible = False
                'Me.Table107.Visible = False
                'Me.Table108.Visible = False
               ' Me.Table109.Visible = False
            Case 3
                Me.Table101.Visible = True
                Me.Table102.Visible = True
                Me.Table103.Visible = True
                Me.Table104.Visible = True
                Me.Table105.Visible = True
                'Me.Table106.Visible = True
                'Me.Table107.Visible = True
                'Me.Table108.Visible = True
                'Me.Table109.Visible = True
            Case 4
                Me.Table101.Visible = True
                Me.Table102.Visible = True
                Me.Table103.Visible = True
                Me.Table104.Visible = True
                Me.Table105.Visible = True
                'Me.Table106.Visible = True
                'Me.Table107.Visible = True
                'Me.Table108.Visible = True
               ' Me.Table109.Visible = True
            Case 5
                Me.Table101.Visible = True
                Me.Table102.Visible = True
                Me.Table103.Visible = True
                Me.Table104.Visible = True
                Me.Table105.Visible = True
                'Me.Table106.Visible = True
                'Me.Table107.Visible = True
                'Me.Table108.Visible = True
                ' Me.Table109.Visible = True
            Case Else
                Me.Table101.Visible = False
                Me.Table102.Visible = False
                Me.Table103.Visible = False
                Me.Table104.Visible = False
                Me.Table105.Visible = False
                'Me.Table106.Visible = False
                'Me.Table107.Visible = False
                'Me.Table108.Visible = False
                'Me.Table109.Visible = False
        End Select
    End Sub
#Region "Internal Methods"
    Private Sub GetChart_StatisticsChart(ChartName As String)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetChart_StatisticsChart(ChartName)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadChart1.DataSource = dtMain
        RadChart1.DataBind()
    End Sub
#End Region
    Protected Sub btn1_Click(sender As Object, e As ImageClickEventArgs) Handles btn1.Click
        Box1()
        GetChart_StatisticsChart(WT_SP_Statistics_Name.Value)
        Me.RadChart1.ChartTitle.Text = WT_Name.Value
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn2_Click(sender As Object, e As ImageClickEventArgs) Handles btn2.Click
        Box2()
        GetChart_StatisticsChart(WT_SP_Statistics_Name.Value)
        Me.RadChart1.ChartTitle.Text = WT_Name.Value
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn3_Click(sender As Object, e As ImageClickEventArgs) Handles btn3.Click
        Box3()
        GetChart_StatisticsChart(WT_SP_Statistics_Name.Value)
        Me.RadChart1.ChartTitle.Text = WT_Name.Value
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn4_Click(sender As Object, e As ImageClickEventArgs) Handles btn4.Click
        Box4()
        GetChart_StatisticsChart(WT_SP_Statistics_Name.Value)
        Me.RadChart1.ChartTitle.Text = WT_Name.Value
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn5_Click(sender As Object, e As ImageClickEventArgs) Handles btn5.Click
        Box5()
        GetChart_StatisticsChart(WT_SP_Statistics_Name.Value)
        Me.RadChart1.ChartTitle.Text = WT_Name.Value
        Me.RadChart1.Visible = True
    End Sub
    'Protected Sub btn6_Click(sender As Object, e As ImageClickEventArgs) Handles btn6.Click
    '    GetChart_StatisticsChart(WT_SP_Statistics_Name.Value)
    '    Me.RadChart1.ChartTitle.Text = WT_Name.Value
    '    Me.RadChart1.Visible = True
    'End Sub
    'Protected Sub btn7_Click(sender As Object, e As ImageClickEventArgs) Handles btn7.Click
    '    GetChart_StatisticsChart(WT_SP_Statistics_Name.Value)
    '    Me.RadChart1.ChartTitle.Text = WT_Name.Value
    '    Me.RadChart1.Visible = True
    'End Sub
    'Protected Sub btn8_Click(sender As Object, e As ImageClickEventArgs) Handles btn8.Click
    '    GetChart_StatisticsChart(WT_SP_Statistics_Name.Value)
    '    Me.RadChart1.ChartTitle.Text = WT_Name.Value
    '    Me.RadChart1.Visible = True
    'End Sub
    'Protected Sub btn9_Click(sender As Object, e As ImageClickEventArgs) Handles btn9.Click
    '    Me.HF_WhichChart.Value = "HOME_COMPONENTS_DUE_INSPECTION_SP_WEEKLY"
    '    InsertChartData()
    '    Me.RadChart1.DataBind()
    '    Me.RadChart1.ChartTitle.Text = "tbc"
    '    Me.RadChart1.Visible = True
    'End Sub
    'Protected Sub Timer_Tick(ByVal sender As Object, ByVal e As EventArgs)
    '    RotateWidgets()
    'End Sub
    'Sub RotateWidgets()
    '    If HF_Toggle.Value = 0 Then
    '        Me.Table101.Visible = True
    '        Me.Table102.Visible = True
    '        Me.Table103.Visible = True
    '        Me.Table104.Visible = True
    '        Me.Table105.Visible = True
    '        Me.Table106.Visible = True
    '        Me.Table107.Visible = True
    '        Me.Table108.Visible = True
    '        'Me.Table109.Visible = False
    '        Box1()
    '        Box2()
    '        Box3()
    '        Box4()
    '        Box5()
    '        Box6()
    '        Box7()
    '        Box8()
    '        RadChart1.Visible = False
    '        HF_Toggle.Value = 1
    '        Exit Sub
    '    ElseIf HF_Toggle.Value = 1 Then
    '        Me.Table101.Visible = False
    '        Me.Table102.Visible = False
    '        Me.Table103.Visible = False
    '        Me.Table104.Visible = False
    '        Me.Table105.Visible = False
    '        Me.Table106.Visible = False
    '        Me.Table107.Visible = False
    '        Me.Table108.Visible = False
    '        'Me.Table109.Visible = True
    '        'Box9()
    '        RadChart1.Visible = False
    '        HF_Toggle.Value = 0
    '    End If
    'End Sub
    'Protected Sub ImgBtn_Left_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtn_Left.Click
    '    RotateWidgets()
    'End Sub
    'Protected Sub ImgBtn_Right_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtn_Right.Click
    '    RotateWidgets()
    'End Sub
End Class

