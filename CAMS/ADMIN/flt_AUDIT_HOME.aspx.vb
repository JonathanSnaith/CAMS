Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class ADMIN_flt_AUDIT_HOME
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        Me.HF_SessionIP.Value = Request.UserHostAddress
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
        Box6()
        Box7()
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 133)
        Apply_Permissions()
        GetSYS()
    End Sub
    Sub GetSYS()
        Dim dvSql As DataView = DirectCast(SqlDS_SYS.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        Next
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
        Dim PQQ_Username As String = Request.QueryString("PQQ_Username")
        If Request.QueryString("GUID") = "" Then
            OKtoContinue = False
        End If
        Session("Cancel") = Nothing
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
        With btn6
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        With btn7
            .Width = 1
            .Height = 1
            .BorderStyle = BorderStyle.None
            .CssClass = "hideitem"
        End With
        'With btn8
        '    .Width = 1
        '    .Height = 1
        '    .BorderStyle = BorderStyle.None
        '    .CssClass = "hideitem"
        'End With
        With Me.ID_1_A.Attributes
            .Add("onClick", "fn_1()")
        End With
        With Me.ID_1_B.Attributes
            .Add("onClick", "fn_1_b()")
        End With
        With Me.ID_2_A.Attributes
            .Add("onClick", "fn_2()")
        End With
        With Me.ID_2_B.Attributes
            .Add("onClick", "fn_2_b()")
        End With
        With Me.ID_3_A.Attributes
            .Add("onClick", "fn_3()")
        End With
        With Me.ID_3_B.Attributes
            .Add("onClick", "fn_3_b()")
        End With
        With Me.ID_4_A.Attributes
            .Add("onClick", "fn_4()")
        End With
        With Me.ID_4_B.Attributes
            .Add("onClick", "fn_4_b()")
        End With
        With Me.ID_5_A.Attributes
            .Add("onClick", "fn_5()")
        End With
        With Me.ID_5_B.Attributes
            .Add("onClick", "fn_5_b()")
        End With
        With Me.ID_6_A.Attributes
            .Add("onClick", "fn_6()")
        End With
        With Me.ID_6_B.Attributes
            .Add("onClick", "fn_6_b()")
        End With
        With Me.ID_7_A.Attributes
            .Add("onClick", "fn_7()")
        End With
        With Me.ID_7_B.Attributes
            .Add("onClick", "fn_7_b()")
        End With
        'With Me.ID_8_A.Attributes
        '    .Add("onClick", "fn_8()")
        'End With
        'With Me.ID_8_B.Attributes
        '    .Add("onClick", "fn_8_b()")
        'End With
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Admin - Auditing"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Sub Box1()
        Dim CountI As String = "0"
        Dim LMCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box1.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_1.Text = CountI
        'If lblCount_1.Text = "0" Then lblCount_1.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box1_LM.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LMCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LMCountI) Then
            Me.img_Arrow_1.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_1.ToolTip = LMCountI
        ElseIf CInt(CountI) = CInt(LMCountI) Then
            Me.img_Arrow_1.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_1.ToolTip = LMCountI
        Else
            Me.img_Arrow_1.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_1.ToolTip = LMCountI
        End If
        If CountI < 100 Then
            Me.ID_1_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_1_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CountI >= 100 And CountI < 200 Then
            Me.ID_1_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_1_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CountI >= 200 Then
            Me.ID_1_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_1_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box2()
        Dim CountI As String = "0"
        Dim LMCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box2.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_2.Text = CountI
        'If lblCount_2.Text = "0" Then lblCount_2.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box2_LM.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LMCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LMCountI) Then
            Me.img_Arrow_2.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_2.ToolTip = LMCountI
        ElseIf CInt(CountI) = CInt(LMCountI) Then
            Me.img_Arrow_2.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_2.ToolTip = LMCountI
        Else
            Me.img_Arrow_2.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_2.ToolTip = LMCountI
        End If
        If CountI < 50 Then
            Me.ID_2_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_2_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CountI >= 50 And CountI < 100 Then
            Me.ID_2_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_2_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CountI >= 100 Then
            Me.ID_2_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_2_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box3()
        Dim CountI As String = "0"
        Dim LMCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box3.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_3.Text = CountI
        'If lblCount_3.Text = "0" Then lblCount_3.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box3_LM.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LMCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LMCountI) Then
            Me.img_Arrow_3.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_3.ToolTip = LMCountI
        ElseIf CInt(CountI) = CInt(LMCountI) Then
            Me.img_Arrow_3.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_3.ToolTip = LMCountI
        Else
            Me.img_Arrow_3.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_3.ToolTip = LMCountI
        End If
        If CountI < 250 Then
            Me.ID_3_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_3_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CountI >= 250 And CountI < 500 Then
            Me.ID_3_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_3_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CountI >= 500 Then
            Me.ID_3_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_3_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box4()
        Dim CountI As String = "0"
        Dim LMCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box4.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_4.Text = CountI
        'If lblCount_4.Text = "0" Then lblCount_4.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box4_LM.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LMCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LMCountI) Then
            Me.img_Arrow_4.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_4.ToolTip = LMCountI
        ElseIf CInt(CountI) = CInt(LMCountI) Then
            Me.img_Arrow_4.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_4.ToolTip = LMCountI
        Else
            Me.img_Arrow_4.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_4.ToolTip = LMCountI
        End If
        If CountI < 50 Then
            Me.ID_4_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_4_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CountI >= 50 And CountI < 100 Then
            Me.ID_4_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_4_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CountI >= 100 Then
            Me.ID_4_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_4_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box5()
        Dim CountI As String = "0"
        Dim LMCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box5.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_5.Text = CountI
        'If lblCount_5.Text = "0" Then lblCount_5.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box5_LM.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LMCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LMCountI) Then
            Me.img_Arrow_5.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_5.ToolTip = LMCountI
        ElseIf CInt(CountI) = CInt(LMCountI) Then
            Me.img_Arrow_5.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_5.ToolTip = LMCountI
        Else
            Me.img_Arrow_5.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_5.ToolTip = LMCountI
        End If
        If CountI < 5 Then
            Me.ID_5_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_5_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CountI >= 5 And CountI < 10 Then
            Me.ID_5_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_5_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CountI >= 10 Then
            Me.ID_5_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_5_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box6()
        Dim CountI As String = "0"
        Dim LMCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box6.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_6.Text = CountI
        'If lblCount_6.Text = "0" Then lblCount_6.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box6_LM.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LMCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LMCountI) Then
            Me.img_Arrow_6.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_6.ToolTip = LMCountI
        ElseIf CInt(CountI) = CInt(LMCountI) Then
            Me.img_Arrow_6.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_6.ToolTip = LMCountI
        Else
            Me.img_Arrow_6.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_6.ToolTip = LMCountI
        End If
        If CountI < 5 Then
            Me.ID_6_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_6_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CountI >= 5 And CountI < 10 Then
            Me.ID_6_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_6_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CountI >= 10 Then
            Me.ID_6_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_6_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box7()
        Dim CountI As String = "0"
        Dim LMCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box7.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_7.Text = CountI
        'If lblCount_7.Text = "0" Then lblCount_7.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box7_LM.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LMCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LMCountI) Then
            Me.img_Arrow_7.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_7.ToolTip = LMCountI
        ElseIf CInt(CountI) = CInt(LMCountI) Then
            Me.img_Arrow_7.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_7.ToolTip = LMCountI
        Else
            Me.img_Arrow_7.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_7.ToolTip = LMCountI
        End If
        If CountI < 5 Then
            Me.ID_7_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_7_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CountI >= 5 And CountI < 10 Then
            Me.ID_7_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_7_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CountI >= 10 Then
            Me.ID_7_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_7_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 0
                Me.Table101.Visible = False
                Me.Table102.Visible = False
                Me.Table103.Visible = False
                Me.Table104.Visible = False
                Me.Table105.Visible = False
                Me.Table106.Visible = False
                Me.Table107.Visible = False
            Case 1
                Me.Table101.Visible = False
                Me.Table102.Visible = False
                Me.Table103.Visible = False
                Me.Table104.Visible = False
                Me.Table105.Visible = False
                Me.Table106.Visible = False
                Me.Table107.Visible = False
            Case 2
                Me.Table101.Visible = False
                Me.Table102.Visible = False
                Me.Table103.Visible = False
                Me.Table104.Visible = False
                Me.Table105.Visible = False
                Me.Table106.Visible = False
                Me.Table107.Visible = False
            Case 3
                Me.Table101.Visible = False
                Me.Table102.Visible = False
                Me.Table103.Visible = False
                Me.Table104.Visible = False
                Me.Table105.Visible = False
                Me.Table106.Visible = False
                Me.Table107.Visible = False
            Case 4
                Me.Table101.Visible = True
                Me.Table102.Visible = True
                Me.Table103.Visible = True
                Me.Table104.Visible = True
                Me.Table105.Visible = True
                Me.Table106.Visible = True
                Me.Table107.Visible = True
            Case 5
                Me.Table101.Visible = True
                Me.Table102.Visible = True
                Me.Table103.Visible = True
                Me.Table104.Visible = True
                Me.Table105.Visible = True
                Me.Table106.Visible = True
                Me.Table107.Visible = True
            Case Else
                Me.Table101.Visible = False
                Me.Table102.Visible = False
                Me.Table103.Visible = False
                Me.Table104.Visible = False
                Me.Table105.Visible = False
                Me.Table106.Visible = False
                Me.Table107.Visible = False
        End Select
    End Sub
    Sub InsertChartData()
        Me.SqlDS_ChartData.Select(DataSourceSelectArguments.Empty)
    End Sub
    Protected Sub btn1_Click(sender As Object, e As ImageClickEventArgs) Handles btn1.Click
        Me.HF_WhichChart.Value = "REPORT_AUDIT_ASSET_INCOMPLETE_FIELDS_ARCHIVE_SP"
        InsertChartData()
        Me.RadChart1.DataBind()
        Me.RadChart1.ChartTitle.Text = "Asset - Incomplete Fields"
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn2_Click(sender As Object, e As ImageClickEventArgs) Handles btn2.Click
        Me.HF_WhichChart.Value = "REPORT_AUDIT_EVENT_INCOMPLETE_FIELDS_ARCHIVE_SP"
        InsertChartData()
        Me.RadChart1.DataBind()
        Me.RadChart1.ChartTitle.Text = "Event - Incomplete Fields"
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn3_Click(sender As Object, e As ImageClickEventArgs) Handles btn3.Click
        Me.HF_WhichChart.Value = "REPORT_AUDIT_JOB_INCOMPLETE_FIELDS_ARCHIVE_SP"
        InsertChartData()
        Me.RadChart1.DataBind()
        Me.RadChart1.ChartTitle.Text = "Job - Incomplete Fields"
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn4_Click(sender As Object, e As ImageClickEventArgs) Handles btn4.Click
        Me.HF_WhichChart.Value = "REPORT_AUDIT_EVENT_EXPIRED_ESTIMATED_ARCHIVE_SP"
        InsertChartData()
        Me.RadChart1.DataBind()
        Me.RadChart1.ChartTitle.Text = "Events with Expired Estimated Dates"
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn5_Click(sender As Object, e As ImageClickEventArgs) Handles btn5.Click
        Me.HF_WhichChart.Value = "REPORT_AUDIT_DEFECTS_NO_PLAN_DATE_SP"
        InsertChartData()
        Me.RadChart1.DataBind()
        Me.RadChart1.ChartTitle.Text = "Defect Events with no Planned Start Date"
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn6_Click(sender As Object, e As ImageClickEventArgs) Handles btn6.Click
        Me.HF_WhichChart.Value = "REPORT_AUDIT_DEFECTS_OVERDUE_SP"
        InsertChartData()
        Me.RadChart1.DataBind()
        Me.RadChart1.ChartTitle.Text = "Defect Events raised over 9 days ago"
        Me.RadChart1.Visible = True
    End Sub
    Protected Sub btn7_Click(sender As Object, e As ImageClickEventArgs) Handles btn7.Click
        Me.HF_WhichChart.Value = "REPORT_AUDIT_EVENT_ORDER_DELIVERY_DATES_SP"
        InsertChartData()
        Me.RadChart1.DataBind()
        Me.RadChart1.ChartTitle.Text = "Events with Order Delivery Dates"
        Me.RadChart1.Visible = True
    End Sub
    'Protected Sub btn8_Click(sender As Object, e As ImageClickEventArgs) Handles btn8.Click
    '    Me.HF_WhichChart.Value = "HOME_COMPONENTS_OVERDUE_CHANGEOUT_SP_WEEKLY"
    '    InsertChartData()
    '    Me.RadChart1.DataBind()
    '    Me.RadChart1.ChartTitle.Text = "Component Changeout Plans Overdue"
    '    Me.RadChart1.Visible = True
    'End Sub
End Class

