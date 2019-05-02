Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class ROTATOR_flt_STATISTICS
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Box1()
        Box2()
        Box3()
        Box4()
        Box5()
        Box6()
        Box7()
        Box8()
        GetSYS()
    End Sub
    Sub GetSYS()
        Dim dvSql As DataView = DirectCast(SqlDS_SYS.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSql
            Me.lblSysName.Text = drvSql("SYS_Name").ToString()
            Me.lblVersion.Text = drvSql("SYS_Version").ToString()
        Next
    End Sub
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim OKtoContinue As Boolean = True
        Dim PQQ_Username As String = Request.QueryString("PQQ_Username")
        If Request.QueryString("GUID") = "" Then
            OKtoContinue = False
        End If
        Session("Cancel") = Nothing
        With Me.ID_1_A.Attributes
            .Add("onClick", "fn_1()")
        End With
        With Me.ID_2_A.Attributes
            .Add("onClick", "fn_2()")
        End With
        With Me.ID_3_A.Attributes
            .Add("onClick", "fn_3()")
        End With
        With Me.ID_4_A.Attributes
            .Add("onClick", "fn_4()")
        End With
        With Me.ID_5_A.Attributes
            .Add("onClick", "fn_5()")
        End With
        With Me.ID_6_A.Attributes
            .Add("onClick", "fn_6()")
        End With
        With Me.ID_7_A.Attributes
            .Add("onClick", "fn_7()")
        End With
        With Me.ID_8_A.Attributes
            .Add("onClick", "fn_8()")
        End With
    End Sub
    Sub Box1()
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box1.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_1.Text = CountI
        'If lblCount_1.Text = "0" Then lblCount_1.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box1_LW.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LWCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LWCountI) Then
            Me.img_Arrow_1.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_1.ToolTip = LWCountI
        ElseIf CInt(CountI) = CInt(LWCountI) Then
            Me.img_Arrow_1.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_1.ToolTip = LWCountI
        Else
            Me.img_Arrow_1.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_1.ToolTip = LWCountI
        End If
        If CInt(lblCount_1.Text) < 12 Then
            Me.ID_1_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_1_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CInt(lblCount_1.Text) >= 12 And CInt(lblCount_1.Text) < 36 Then
            Me.ID_1_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_1_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CInt(lblCount_1.Text) >= 36 Then
            Me.ID_1_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_1_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box2()
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box2.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_2.Text = CountI
        'If lblCount_2.Text = "0" Then lblCount_2.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box2_LW.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LWCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LWCountI) Then
            Me.img_Arrow_2.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_2.ToolTip = LWCountI
        ElseIf CInt(CountI) = CInt(LWCountI) Then
            Me.img_Arrow_2.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_2.ToolTip = LWCountI
        Else
            Me.img_Arrow_2.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_2.ToolTip = LWCountI
        End If
        If CInt(lblCount_2.Text) < 15 Then
            Me.ID_2_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_2_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CInt(lblCount_2.Text) >= 15 And CInt(lblCount_2.Text) < 30 Then
            Me.ID_2_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_2_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CInt(lblCount_2.Text) >= 30 Then
            Me.ID_2_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_2_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box3()
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box3.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_3.Text = CountI
        'If lblCount_3.Text = "0" Then lblCount_3.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box3_LW.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LWCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LWCountI) Then
            Me.img_Arrow_3.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_3.ToolTip = LWCountI
        ElseIf CInt(CountI) = CInt(LWCountI) Then
            Me.img_Arrow_3.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_3.ToolTip = LWCountI
        Else
            Me.img_Arrow_3.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_3.ToolTip = LWCountI
        End If
        If CInt(lblCount_3.Text) < 10 Then
            Me.ID_3_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_3_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CInt(lblCount_3.Text) >= 10 And CInt(lblCount_3.Text) < 15 Then
            Me.ID_3_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_3_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CInt(lblCount_3.Text) >= 15 Then
            Me.ID_3_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_3_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box4()
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box4.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_4.Text = CountI
        'If lblCount_4.Text = "0" Then lblCount_4.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box4_LW.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LWCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LWCountI) Then
            Me.img_Arrow_4.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_4.ToolTip = LWCountI
        ElseIf CInt(CountI) = CInt(LWCountI) Then
            Me.img_Arrow_4.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_4.ToolTip = LWCountI
        Else
            Me.img_Arrow_4.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_4.ToolTip = LWCountI
        End If
        If CInt(lblCount_4.Text) < 15 Then
            Me.ID_4_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_4_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CInt(lblCount_4.Text) >= 15 And CInt(lblCount_4.Text) < 30 Then
            Me.ID_4_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_4_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CInt(lblCount_4.Text) >= 30 Then
            Me.ID_4_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_4_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box5()
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box5.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_5.Text = CountI
        'If lblCount_5.Text = "0" Then lblCount_5.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box5_LW.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LWCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LWCountI) Then
            Me.img_Arrow_5.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_5.ToolTip = LWCountI
        ElseIf CInt(CountI) = CInt(LWCountI) Then
            Me.img_Arrow_5.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_5.ToolTip = LWCountI
        Else
            Me.img_Arrow_5.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_5.ToolTip = LWCountI
        End If
        If CInt(lblCount_5.Text) < 5 Then
            Me.ID_5_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_5_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CInt(lblCount_5.Text) >= 5 And CInt(lblCount_5.Text) < 10 Then
            Me.ID_5_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_5_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CInt(lblCount_5.Text) >= 10 Then
            Me.ID_5_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_5_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box6()
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box6.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_6.Text = CountI
        'If lblCount_6.Text = "0" Then lblCount_6.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box6_LW.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LWCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LWCountI) Then
            Me.img_Arrow_6.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_6.ToolTip = LWCountI
        ElseIf CInt(CountI) = CInt(LWCountI) Then
            Me.img_Arrow_6.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_6.ToolTip = LWCountI
        Else
            Me.img_Arrow_6.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_6.ToolTip = LWCountI
        End If
        If CInt(lblCount_6.Text) < 15 Then
            Me.ID_6_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_6_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CInt(lblCount_6.Text) >= 15 And CInt(lblCount_6.Text) < 30 Then
            Me.ID_6_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_6_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CInt(lblCount_6.Text) >= 30 Then
            Me.ID_6_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_6_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box7()
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box7.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_7.Text = CountI
        'If lblCount_7.Text = "0" Then lblCount_7.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box7_LW.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LWCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LWCountI) Then
            Me.img_Arrow_7.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_7.ToolTip = LWCountI
        ElseIf CInt(CountI) = CInt(LWCountI) Then
            Me.img_Arrow_7.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_7.ToolTip = LWCountI
        Else
            Me.img_Arrow_7.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_7.ToolTip = LWCountI
        End If
        If CInt(lblCount_7.Text) < 5 Then
            Me.ID_7_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_7_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CInt(lblCount_7.Text) >= 5 And CInt(lblCount_7.Text) < 10 Then
            Me.ID_7_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_7_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CInt(lblCount_7.Text) >= 10 Then
            Me.ID_7_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_7_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
    Sub Box8()
        Dim CountI As String = "0"
        Dim LWCountI As String = "0"
        Dim dvSqlSession As DataView = DirectCast(SqlDS_Box8.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In dvSqlSession
            CountI = drvSql("ThisCount").ToString()
        Next
        Me.lblCount_8.Text = CountI
        'If lblCount_8.Text = "0" Then lblCount_8.Text = "N/A"
        Dim LMdvSqlSession As DataView = DirectCast(SqlDS_Box8_LW.Select(DataSourceSelectArguments.Empty), DataView)
        For Each drvSql As DataRowView In LMdvSqlSession
            LWCountI = drvSql("ThisCount").ToString()
        Next
        If CInt(CountI) < CInt(LWCountI) Then
            Me.img_Arrow_8.ImageUrl = "~/IMAGES/ARROW_DOWN_32_INV.png"
            Me.img_Arrow_8.ToolTip = LWCountI
        ElseIf CInt(CountI) = CInt(LWCountI) Then
            Me.img_Arrow_8.ImageUrl = "~/IMAGES/ARROW_LEVEL_32.png"
            Me.img_Arrow_8.ToolTip = LWCountI
        Else
            Me.img_Arrow_8.ImageUrl = "~/IMAGES/ARROW_UP_32_INV.png"
            Me.img_Arrow_8.ToolTip = LWCountI
        End If
        If CInt(lblCount_8.Text) < 1 Then
            Me.ID_8_B.BackColor = Drawing.Color.FromName("#00c663") 'GREEN
            Me.img_8_B.ImageUrl = "~/IMAGES/STATUS_GOOD_24X24.png"
        ElseIf CInt(lblCount_8.Text) >= 1 And CInt(lblCount_8.Text) < 2 Then
            Me.ID_8_B.BackColor = Drawing.Color.FromName("#e5a92f") 'AMBER
            Me.img_8_B.ImageUrl = "~/IMAGES/STATUS_WARNING_24X24.png"
        ElseIf CInt(lblCount_8.Text) >= 2 Then
            Me.ID_8_B.BackColor = Drawing.Color.FromName("#FF5050") 'RED
            Me.img_8_B.ImageUrl = "~/IMAGES/STATUS_BAD_24X24.png"
        End If
    End Sub
End Class

