Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class DASHBOARD_flt_D_ASSET
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
        Me.lblSliderText.Visible = False
        Me.RadSlider1.Style("Display") = "None"
        Setup_Customer_Combo()
        Me.RadCB_Activity_Status.SelectedValue = "Active"
        GetSYS()
        ' Apply_Permissions()
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
                                Select Case dr("EXCEPTION_ID").ToString()
                                    Case 154
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_18_R.Value = 1 'Financial - R
                                        End If
                                    Case 155
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_18_RW.Value = 1 'Financial - W
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
    Protected Sub RadGrid_Active_Events_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_Events.ItemDataBound
        For Each item As GridDataItem In RadGrid_Active_Events.Items
            Dim myTotalCell4 As TableCell = item("E_Status")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                Dim ThisTotal4 = myTotalCell4.Text
                If ThisTotal4 = "*New" Then
                    item.BackColor = Drawing.Color.LightBlue
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Complete" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                End If
            End If
        Next
    End Sub
    Protected Sub RadGrid_Active_Jobs_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_Jobs.ItemDataBound
        For Each item As GridDataItem In RadGrid_Active_Jobs.Items
            Dim myTotalCell4 As TableCell = item("J_Status")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                Dim ThisTotal4 = myTotalCell4.Text
                If ThisTotal4 = "Complete" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Cancelled" Then
                    item.BackColor = Drawing.Color.LightSalmon
                    item.ForeColor = Drawing.Color.Black
                End If
            End If
        Next
    End Sub
    Protected Sub RadGrid_Archive_Jobs_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Archive_Jobs.ItemDataBound
        For Each item As GridDataItem In RadGrid_Archive_Jobs.Items
            Dim myTotalCell4 As TableCell = item("J_Status")
            Dim myTotalCell5 As TableCell = item("E_Status")
            Dim ThisTotal4 = myTotalCell4.Text
            Dim ThisTotal5 = myTotalCell5.Text
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                If ThisTotal4 = "Complete" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Cancelled" Then
                    item.BackColor = Drawing.Color.LightSalmon
                    item.ForeColor = Drawing.Color.Black
                End If
            End If
            If ThisTotal4 = "Open" And ThisTotal5 = "Complete" Then
                item.BackColor = Drawing.Color.FromName("#FF4848")
                item.ForeColor = Drawing.Color.Black
            End If
        Next
    End Sub
    'Protected Sub RadGrid_Planning_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_PLANNING.ItemDataBound
    '    For Each item As GridDataItem In RadGrid_PLANNING.Items
    '        Dim myTotalCell2 As TableCell = item("STM_SMU_Value")
    '        Dim myTotalCell3 As TableCell = item("STM_Date_Estimate")
    '        If InStr(myTotalCell2.Text, "&nbsp;") Then
    '        Else
    '            If myTotalCell3.Text <> Nothing And myTotalCell3.Text <> "&nbsp;" Then
    '                If Format(CDate(myTotalCell3.Text) < DateTime.Now) Then 'Date_Estimate expired
    '                    item.BackColor = Drawing.Color.Tomato
    '                    item.ForeColor = Drawing.Color.Black
    '                Else
    '                End If
    '                If Format(CDate(myTotalCell3.Text) > DateAdd(DateInterval.Year, 100, DateTime.Now)) Then
    '                    item.BackColor = Drawing.Color.LightGray
    '                    item.ForeColor = Drawing.Color.Black
    '                Else
    '                End If
    '            End If
    '        End If
    '        Dim myTotalCell4 As TableCell = item("STM_Planning_Status")
    '        If InStr(myTotalCell4.Text, "&nbsp;") Then
    '        Else
    '            Dim ThisTotal4 = myTotalCell4.Text
    '            If ThisTotal4 = "*New" Then
    '                item.BackColor = Drawing.Color.MediumSeaGreen
    '                item.ForeColor = Drawing.Color.Black
    '            Else
    '            End If
    '            If ThisTotal4 = "*Planning" Then
    '                item.BackColor = Drawing.Color.Orange
    '                item.ForeColor = Drawing.Color.Black
    '            Else
    '            End If
    '            If ThisTotal4 = "*Event Cancelled" Then
    '                item.BackColor = Drawing.Color.Gold
    '                item.ForeColor = Drawing.Color.Black
    '            Else
    '            End If
    '        End If
    '    Next
    'End Sub
    'Private Sub RadGrid_Part_List_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid_Part_List.ItemDataBound
    '    For Each item As GridDataItem In RadGrid_Part_List.Items
    '        Dim myTotalCell3 As TableCell = item("ActualDays")
    '        Dim myTotalCell4 As TableCell = item("ExpectedDaysCalc")
    '        Dim myTotalCell5 As TableCell = item("PD_Location_Type")
    '        Dim myTotalCell6 As TableCell = item("CurrentLocation")
    '        If InStr(myTotalCell3.Text, "&nbsp;") Then
    '        Else
    '            Dim ThisTotal3 As Double
    '            ThisTotal3 = myTotalCell3.Text
    '            Dim ThisTotal4 As Double
    '            ThisTotal4 = myTotalCell4.Text
    '            Dim ThisTotal5 As String
    '            ThisTotal5 = myTotalCell5.Text
    '            Dim ThisTotal6 As String
    '            ThisTotal6 = myTotalCell6.Text
    '            If (ThisTotal3 > ThisTotal4 And ThisTotal5 <> "Asset") And (ThisTotal3 > ThisTotal4 And ThisTotal6 <> "Thrislington Yard - Stock") Then
    '                item("ActualDays").ForeColor = Drawing.Color.Red
    '            Else
    '                item("ActualDays").ForeColor = Drawing.Color.Black
    '            End If
    '        End If
    '    Next
    'End Sub
    'Protected Sub RadGrid_Warranty_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Warranty.ItemDataBound
    '    For Each item As GridDataItem In RadGrid_Warranty.Items
    '        Dim myTotalCell2 As TableCell = item("STM_SMU_Value")
    '        Dim ThisTotal2 = myTotalCell2.Text
    '        Dim myTotalCell5 As TableCell = item("STMC_Warranty_Expiry_Date")
    '        Dim ThisTotal5 = myTotalCell5.Text
    '        Dim myTotalCell4 As TableCell = item("STMC_Warranty_Expiry_Hours")
    '        Dim ThisTotal4 = myTotalCell4.Text
    '        If InStr(ThisTotal4, "&nbsp;") Then
    '            ThisTotal4 = 0
    '        End If
    '        If InStr(myTotalCell5.Text, "&nbsp;") Then
    '            '''HOURS CALC'''
    '            If ThisTotal2 >= (CInt(ThisTotal4) - 250) Then
    '                item.BackColor = Drawing.Color.Orange
    '                item.ForeColor = Drawing.Color.Black
    '            Else
    '            End If
    '            If ThisTotal2 >= CInt(ThisTotal4) Then
    '                item.BackColor = Drawing.Color.Red
    '                item.ForeColor = Drawing.Color.Black
    '            Else
    '            End If
    '        Else
    '            '''DATE CALC'''
    '            If ThisTotal5 <= DateAdd(DateInterval.Month, 1, Date.Now) Then
    '                item.BackColor = Drawing.Color.Orange
    '                item.ForeColor = Drawing.Color.Black
    '            Else
    '            End If
    '            If ThisTotal5 < Date.Now Then
    '                item.BackColor = Drawing.Color.Red
    '                item.ForeColor = Drawing.Color.Black
    '            Else
    '            End If
    '        End If
    '    Next
    'End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames(RadCB_Customer, True)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetsFromActivityStatus(RadCB_Asset, RadCB_Customer.SelectedValue, RadCB_Activity_Status.SelectedValue)
    End Sub
    Private Sub Setup_ArchiveJob_Site_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Site = Setup.Populate_SiteNames_AssetDashJobTab(RadCB_Site, RadCB_Asset.SelectedValue, True)
    End Sub
    Private Sub Setup_ArchiveJob_JobType_Combo()
        Dim Setup As New Setup.Combo
        RadCB_JobType = Setup.Populate_JobTypes_AssetDashJobTab(RadCB_JobType, RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, True)
    End Sub
    Private Sub Setup_ArchiveJob_JobStatus_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Status = Setup.Populate_JobStatus_AssetDashJobTab(RadCB_Status, RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, RadCB_JobType.SelectedValue, True)
    End Sub
    Private Sub Setup_ArchiveJob_Engineers_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers_AssetDashJobTab(RadCB_Engineer, RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, RadCB_JobType.SelectedValue, RadCB_Status.SelectedValue, True)
    End Sub
    Private Sub GetEvents(A_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetAssetDashActiveEvents(A_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_Active_Events.DataSource = dtMain
        RadGrid_Active_Events.DataBind()
    End Sub
    Private Sub GetJobs(E_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetActiveJobs(E_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_Active_Jobs.DataSource = dtMain
        RadGrid_Active_Jobs.DataBind()
    End Sub
    Private Sub GetServicing(A_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetAssetDashServicing(A_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_Active_SER.DataSource = dtMain
        RadGrid_Active_SER.DataBind()
    End Sub
    Private Sub GetServicingArchive(A_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetAssetDashServicingArchive(A_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_Servicing_Archive.DataSource = dtMain
        RadGrid_Servicing_Archive.DataBind()
    End Sub
    Private Sub GetArchiveJobs(A_ID As Integer, SITE_ID As Integer, ATT_ID As Integer, J_Status As String, PER_EMP_ID As Integer, E_ID As String)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetArchiveJobs(A_ID, SITE_ID, ATT_ID, J_Status, PER_EMP_ID, E_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_Archive_Jobs.DataSource = dtMain
        RadGrid_Archive_Jobs.DataBind()
    End Sub
    Private Sub GetChart_EventTypes(A_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetChart_AssetDash_EventTypes(A_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadP_EventTypes.DataSource = dtMain
        RadP_EventTypes.DataBind()
    End Sub
    Private Sub GetChart_GridEventTypes(A_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetChart_AssetDash_GridEventTypes(A_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadC_EventTimes.DataSource = dtMain
        RadC_EventTimes.DataBind()
    End Sub
    Private Sub GetChart_JobTypes(A_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetChart_AssetDash_JobTypes(A_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadP_JobTypes.DataSource = dtMain
        RadP_JobTypes.DataBind()
    End Sub
    Private Sub GetChart_ServicingTypes(A_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetChart_AssetDash_Servicing(A_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadC_ServiceHistory.DataSource = dtMain
        RadC_ServiceHistory.DataBind()
    End Sub
#End Region
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        If RadCB_Activity_Status.SelectedValue = "" Then
            RadCB_Activity_Status.SelectedValue = "-1"
        End If
        Me.RadCB_Asset.ClearSelection()
        Setup_Asset_Combo()
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Me.AssetDetails.Visible = True
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.D_ASSET_DETAILS_SP(RadCB_Asset.SelectedValue)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lblBasic.Text = drvSql("AssetBasic").ToString()
            Me.lblLocation.Text = drvSql("Location").ToString()
            Me.lblActivityStatus.Text = drvSql("ActivityStatus").ToString()
            Me.lblSMU.Text = drvSql("SMU").ToString()
            Me.lblTrend.Text = drvSql("TrendRound").ToString()
            Me.HF_Trend.Value = drvSql("TrendRound").ToString()
            Me.lblCycle.Text = drvSql("Cycle").ToString()
            Me.lblSerCounter.Text = drvSql("SerCounter").ToString()
            Me.lblSerLeft.Text = drvSql("SerLeft").ToString()
            Me.lblStatus.Text = drvSql("Status").ToString()
            Me.Image1.ImageUrl = drvSql("A_Photo_Link").ToString()
        End If
        'Dim dvSqlSessionstats As DataView = DirectCast(SqlDS_AssetStats.Select(DataSourceSelectArguments.Empty), DataView)
        'For Each drvSql As DataRowView In dvSqlSessionstats
        '    Me.lblAvailability.Text = drvSql("Availability").ToString()
        '    Me.lblUtilisation.Text = drvSql("Utilisation").ToString()
        '    Me.lblProductionRate.Text = drvSql("ProductionRate").ToString()
        '    Me.lblPayLoad.Text = drvSql("PayLoad").ToString()
        '    Me.lblLitres.Text = drvSql("LitresPerSMU").ToString()
        '    Me.HF_LPH.Value = drvSql("LPHGauge").ToString()
        '    Me.lblCO2.Text = drvSql("CO2").ToString()
        'Next
        'If Me.lblPayLoad.Text = "N/A" Then
        '    Me.lblPayLoadText.Visible = False
        '    Me.lblPayLoad.Visible = False
        '    If Me.lblProductionRate.Text = "N/A" Then
        '        Me.lblProductionRateText.Visible = False
        '        Me.lblProductionRate.Visible = False
        '    Else
        '        Me.lblProductionRateText.Visible = True
        '        Me.lblProductionRate.Visible = True
        '    End If
        'Else
        '    Me.lblPayLoadText.Visible = True
        '    Me.lblPayLoad.Visible = True
        '    Me.lblProductionRateText.Visible = False
        '    Me.lblProductionRate.Visible = False
        'End If

        If lblTrend.Text = "N/A" Then
            Me.RadC_EventTimes.Visible = False
            Me.RadP_EventTypes.Visible = False
            'Me.RadC_MTBS.Visible = False
            ' Me.RadP_PlanVsUnPlan.Visible = False
            Me.RadC_ServiceHistory.Visible = False
            Me.RadG_NextService.Visible = False
            Me.RadP_JobTypes.Visible = False
            Me.lblCycleText.Visible = False
            Me.lblSerCounterText.Visible = False
            Me.lblSerLeftText.Visible = False
            Me.lblCycle.Visible = False
            Me.lblSerCounter.Visible = False
            Me.lblSerLeft.Visible = False
            Me.lblTrend.Text = "1"
            Image1.Visible = True
        Else
            Me.RadC_EventTimes.Visible = False
            Me.RadP_EventTypes.Visible = False
            'Me.RadC_MTBS.Visible = False
            ' Me.RadP_PlanVsUnPlan.Visible = False
            Me.RadC_ServiceHistory.Visible = False
            Me.RadG_NextService.Visible = False
            Me.RadP_JobTypes.Visible = False
            Me.lblCycleText.Visible = True
            Me.lblSerCounterText.Visible = True
            Me.lblSerLeftText.Visible = True
            Me.lblCycle.Visible = True
            Me.lblSerCounter.Visible = True
            Me.lblSerLeft.Visible = True
            Image1.Visible = True
        End If
        Me.lblTrend.ForeColor = Drawing.Color.Black
        GetTabStats()
        Me.RadTabStrip1.Visible = True
        PageViewStuff()

        If lblTrend.Text = "1" Then
            Me.lblTrendText.Visible = False
            Me.lblTrend.Visible = False
            Me.RadSlider1.Visible = False
            Me.lblSliderText.Visible = False

        End If
        Setup_ArchiveJob_Site_Combo()
    End Sub
    'Sub GetGaugeStuff()
    '    Dim LPH As Double
    '    If Me.HF_LPH.Value = "0" Or Me.HF_LPH.Value = "" Then
    '        LPH = Me.HF_LPH.Value
    '    Else
    '        LPH = Me.HF_LPH.Value
    '    End If
    '    Dim dvSqlLPH As DataView = DirectCast(SqlDS_LPH_Stats.Select(DataSourceSelectArguments.Empty), DataView)
    '    For Each drvSql As DataRowView In dvSqlLPH
    '        Me.HF_LOW_START.Value = drvSql("ELF_LOW_START").ToString()
    '        Me.HF_LOW_END.Value = drvSql("ELF_LOW_END").ToString()
    '        Me.HF_MED_START.Value = drvSql("ELF_MEDIUM_START").ToString()
    '        Me.HF_MED_END.Value = drvSql("ELF_MEDIUM_END").ToString()
    '        Me.HF_HIGH_START.Value = drvSql("ELF_HIGH_START").ToString()
    '        Me.HF_HIGH_END.Value = drvSql("ELF_HIGH_END").ToString()
    '    Next
    '    If HF_LOW_START.Value <> "" Then
    '        Me.lbl_LPH_Gauge.Visible = True
    '        'Create new RadialGauge object



    '        Dim radialGauge As New RadRadialGauge()
    '        radialGauge.ID = "radialGauge1"

    '        'Set Pointer properties
    '        radialGauge.Pointer.Value = LPH '0.95
    '        radialGauge.Pointer.Cap.Size = 0.1
    '        radialGauge.Pointer.Cap.Color = System.Drawing.Color.Black
    '        radialGauge.Pointer.Color = System.Drawing.Color.Black

    '        'Set Min and Max values of the Scale
    '        radialGauge.Scale.Min = Me.HF_LOW_START.Value

    '        'In order the Max value to be displayed it should be multiple of the MajorUnit
    '        radialGauge.Scale.Max = Me.HF_HIGH_END.Value
    '        'radialGauge.Scale.MinorUnit = LPH / 2
    '        'radialGauge.Scale.MajorUnit = LPH / 10

    '        'Set Minor and Major Ticks properties
    '        radialGauge.Scale.MinorTicks.Visible = False
    '        radialGauge.Scale.MajorTicks.Size = 10

    '        'Set Scale Labels properties
    '        radialGauge.Scale.Labels.Visible = True
    '        radialGauge.Scale.Labels.Font = "15px Arial,Helvetica,sans-serif"
    '        radialGauge.Scale.Labels.Color = System.Drawing.Color.Black
    '        'radialGauge.Scale.Labels.Format = "P0"
    '        radialGauge.Scale.Labels.Position = Telerik.Web.UI.Gauge.ScaleLabelsPosition.Outside
    '        radialGauge.Width = 680

    '        'Create new GaugeRange object
    '        Dim gr1 As New GaugeRange()

    '        'Set the properties of the new object
    '        gr1.From = Me.HF_LOW_START.Value '0
    '        gr1.To = Me.HF_LOW_END.Value 'LPH / 3
    '        gr1.Color = System.Drawing.Color.Green

    '        Dim gr2 As New GaugeRange()
    '        gr2.From = Me.HF_MED_START.Value 'LPH / 3
    '        gr2.To = Me.HF_MED_END.Value '(LPH / 3) * 2
    '        gr2.Color = System.Drawing.Color.Yellow

    '        Dim gr3 As New GaugeRange()
    '        gr3.From = Me.HF_HIGH_START.Value '(LPH / 3) * 2
    '        gr3.To = Me.HF_HIGH_END.Value 'LPH
    '        gr3.Color = System.Drawing.Color.FromArgb(225, 0, 0)

    '        'Add Gauge objects to the RadialGauge
    '        radialGauge.Scale.Ranges.Add(gr1)
    '        radialGauge.Scale.Ranges.Add(gr2)
    '        radialGauge.Scale.Ranges.Add(gr3)

    '        'Add RadialGauge object to the div wrapper
    '        Me.PlaceHolder1.Controls.Add(radialGauge)
    '    End If
    'End Sub
    Sub GetTabStats()
        Me.HF_Event_Job_Total.Value = 0
        Me.HF_Servicing_Total.Value = 0
        'Me.HF_SMU_Total.Value = 0
        'Me.HF_Changeout_Total.Value = 0
        'Me.HF_Parts_Total.Value = 0
        'Me.HF_Warranties_Total.Value = 0
        Me.HF_Jobs_Total.Value = 0
        Me.RadTabStrip1.Tabs.FindTabByValue(0).Selected = True
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.D_ASSET_ALL_EVENTS_RG_SELECT_SP(RadCB_Asset.SelectedValue)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_Event_Job_Total.Value = drvSql("Count").ToString()
        End If
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt2 As DataTable = qry.D_ASSET_ALL_SER_RG_SELECT_SP(RadCB_Asset.SelectedValue)
        If dt2.Rows.Count > 0 Then
            Dim drvSql2 As DataRow = dt.Rows(0)
            Me.HF_Servicing_Total.Value = drvSql2("Count").ToString()
            Me.HF_Trigger.Value = drvSql2("SER_Trigger").ToString()
        End If
        'Dim dvSql3 As DataView = DirectCast(SqlDS_RadGrid_SMU.Select(DataSourceSelectArguments.Empty), DataView)
        'For Each drvSql3 As DataRowView In dvSql3
        '    Me.HF_SMU_Total.Value = drvSql3("Count").ToString()
        'Next
        'Dim dvSql4 As DataView = DirectCast(SqlDS_RadGrid_FUEL.Select(DataSourceSelectArguments.Empty), DataView)
        'For Each drvSql4 As DataRowView In dvSql4
        '    Me.HF_FUEL_Total.Value = drvSql4("Count").ToString()
        'Next
        'Dim dvSql6 As DataView = DirectCast(SqlDS_RadGrid_PLANNING.Select(DataSourceSelectArguments.Empty), DataView)
        'For Each drvSql6 As DataRowView In dvSql6
        '    Me.HF_Changeout_Total.Value = drvSql6("Count").ToString()
        'Next
        'Dim dvSql7 As DataView = DirectCast(SqlDS_RadGrid_SP_PART_LIST.Select(DataSourceSelectArguments.Empty), DataView)
        'For Each drvSql7 As DataRowView In dvSql7
        '    Me.HF_Parts_Total.Value = drvSql7("Count").ToString()
        'Next
        'Dim dvSql8 As DataView = DirectCast(SqlDS_RadGrid_WARRANTY.Select(DataSourceSelectArguments.Empty), DataView)
        'For Each drvSql8 As DataRowView In dvSql8
        '    Me.HF_Warranties_Total.Value = drvSql8("Count").ToString()
        'Next
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt3 As DataTable = qry.D_ASSET_ARCHIVE_JOBS_RG_SELECT_SP(RadCB_Asset.SelectedValue, -1, -1, "-1", -1, "")
        If dt3.Rows.Count > 0 Then
            Dim drvSql3 As DataRow = dt.Rows(0)
            Me.HF_Jobs_Total.Value = drvSql3("Count").ToString()
        End If
        Me.RadTabStrip1.Tabs.FindTabByValue(0).Text = "Asset Details"
        Me.RadTabStrip1.Tabs.FindTabByValue(1).Text = "All Events & Jobs (" + Me.HF_Event_Job_Total.Value + ")"
        Me.RadTabStrip1.Tabs.FindTabByValue(2).Text = "Servicing (" + Me.HF_Servicing_Total.Value + ")"
        'Me.RadTabStrip1.Tabs.FindTabByValue(3).Text = "SMU Readings (" + Me.HF_SMU_Total.Value + ")"
        'Me.RadTabStrip1.Tabs.FindTabByValue(4).Text = "Fuel Quantities (" + Me.HF_SMU_Total.Value + ")"
        'Me.RadTabStrip1.Tabs.FindTabByValue(6).Text = "Change-Out Plan (" + Me.HF_Changeout_Total.Value + ")"
        'Me.RadTabStrip1.Tabs.FindTabByValue(7).Text = "Parts Assigned (" + Me.HF_Parts_Total.Value + ")"
        'Me.RadTabStrip1.Tabs.FindTabByValue(8).Text = "Warranties (" + Me.HF_Warranties_Total.Value + ")"
        Me.RadTabStrip1.Tabs.FindTabByValue(9).Text = "All Jobs (" + Me.HF_Jobs_Total.Value + ")"
        Me.RadTabStrip1.DataBind()
    End Sub
    'Sub GetRadialGauge()
    '    Dim Freq As Double
    '    If Me.lblCycle.Text = "0" Or Me.lblCycle.Text = "" Then
    '        Freq = Me.lblCycle.Text
    '    Else
    '        Freq = Me.lblCycle.Text
    '    End If

    '    If lblSerCounter.Text = "" Then lblSerCounter.Text = "0"

    '    'Create new RadialGauge object
    '    Dim radialGauge As New RadRadialGauge()
    '    radialGauge.ID = "radialGauge2"


    '    'Set Pointer properties
    '    radialGauge.Pointer.Value = lblSerCounter.Text '0.95
    '    radialGauge.Pointer.Cap.Size = 0.1
    '    radialGauge.Pointer.Cap.Color = System.Drawing.Color.Black
    '    radialGauge.Pointer.Color = System.Drawing.Color.Black

    '    'Set Min and Max values of the Scale
    '    radialGauge.Scale.Min = 0

    '    'In order the Max value to be displayed it should be multiple of the MajorUnit
    '    radialGauge.Scale.Max = Freq
    '    radialGauge.Scale.MinorUnit = Freq / 2
    '    radialGauge.Scale.MajorUnit = Freq / 10

    '    'Set Minor and Major Ticks properties
    '    radialGauge.Scale.MinorTicks.Visible = False
    '    radialGauge.Scale.MajorTicks.Size = 10

    '    'Set Scale Labels properties
    '    radialGauge.Scale.Labels.Visible = True
    '    radialGauge.Scale.Labels.Font = "15px Arial,Helvetica,sans-serif"
    '    radialGauge.Scale.Labels.Color = System.Drawing.Color.Black
    '    'radialGauge.Scale.Labels.Format = "P0"
    '    radialGauge.Scale.Labels.Position = Telerik.Web.UI.Gauge.ScaleLabelsPosition.Outside
    '    radialGauge.Width = 600

    '    'Create new GaugeRange object
    '    Dim gr1 As New GaugeRange()

    '    'Set the properties of the new object
    '    gr1.From = 0
    '    gr1.To = Freq / 3
    '    gr1.Color = System.Drawing.Color.Green

    '    Dim gr2 As New GaugeRange()
    '    gr2.From = Freq / 3
    '    gr2.To = (Freq / 3) * 2
    '    gr2.Color = System.Drawing.Color.Yellow

    '    Dim gr3 As New GaugeRange()
    '    gr3.From = (Freq / 3) * 2
    '    gr3.To = Freq
    '    gr3.Color = System.Drawing.Color.FromArgb(225, 0, 0)

    '    'Add Gauge objects to the RadialGauge
    '    radialGauge.Scale.Ranges.Add(gr1)
    '    radialGauge.Scale.Ranges.Add(gr2)
    '    radialGauge.Scale.Ranges.Add(gr3)


    '    'Add RadialGauge object to the div wrapper
    '    Me.RadG_NextService.Controls.Add(radialGauge)
    'End Sub
    Protected Sub RadTabStrip1_TabClick(sender As Object, e As Telerik.Web.UI.RadTabStripEventArgs) Handles RadTabStrip1.TabClick
        PageViewStuff()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.D_ASSET_DETAILS_SP(RadCB_Asset.SelectedValue)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lblBasic.Text = drvSql("AssetBasic").ToString()
            Me.lblLocation.Text = drvSql("Location").ToString()
            Me.lblActivityStatus.Text = drvSql("ActivityStatus").ToString()
            Me.lblSMU.Text = drvSql("SMU").ToString()
            Me.lblTrend.Text = drvSql("TrendRound").ToString()
            Me.HF_Trend.Value = drvSql("TrendRound").ToString()
            Me.lblCycle.Text = drvSql("Cycle").ToString()
            Me.lblSerCounter.Text = drvSql("SerCounter").ToString()
            Me.lblSerLeft.Text = drvSql("SerLeft").ToString()
            Me.lblStatus.Text = drvSql("Status").ToString()
        End If
        Me.lblTrend.ForeColor = Drawing.Color.Black
    End Sub
    Protected Sub PageViewStuff()
        If Me.RadTabStrip1.SelectedTab.PageViewID = "RadPV_Asset_Details" Then
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dt As DataTable = qry.AM_ASSET_LIST_RG_SELECT_RW_SP(RadCB_Asset.SelectedValue)
            If dt.Rows.Count > 0 Then
                Dim drvSql As DataRow = dt.Rows(0)
                Me.lblPrimary.Text = drvSql("PrimaryGroup").ToString()
                Me.lblSecondary.Text = drvSql("SecondaryGroup").ToString()
                Me.lblModel.Text = drvSql("Model").ToString()
                Me.lblManufacturer.Text = drvSql("Company").ToString()
                Me.lblCategory.Text = drvSql("Category").ToString()
                Me.lblType.Text = drvSql("AssetType").ToString()
                Me.lblSerial.Text = drvSql("A_Serial_No").ToString()
                Me.lblYear.Text = drvSql("A_Year").ToString()
                Me.lblEngine.Text = drvSql("A_Engine").ToString()
                Me.lblHired.Text = drvSql("Hired").ToString()
                Me.lblHireRate.Text = drvSql("A_Hire_Rate").ToString()
                Me.lblHireRateExternal.Text = drvSql("A_Hire_Rate_External").ToString()
                Me.lblHireUnit.Text = drvSql("A_Hire_Rate_Unit").ToString()
                Me.lblSpecType.Text = drvSql("A_Spec_Type").ToString()
                Me.lblBodyType.Text = drvSql("A_Body_Type").ToString()
                Me.lblBlade.Text = drvSql("A_Blade_Bucket_Size").ToString()
                Me.lblTrack.Text = drvSql("A_Track_Tyre_Size").ToString()
                Me.lblBodyCapacity.Text = drvSql("A_Body_Capacity").ToString()
                Me.lblWeight.Text = drvSql("A_Operating_Weight").ToString()
            End If
        Me.AssetMainDetails.Visible = True
            Me.RadC_EventTimes.Visible = False
            Me.RadP_EventTypes.Visible = False
            'Me.RadC_MTBS.Visible = False
            ' Me.RadP_PlanVsUnPlan.Visible = False
            Me.RadC_ServiceHistory.Visible = False
            Me.RadG_NextService.Visible = False
            Me.RadSlider1.Style("Display") = "None"
            Me.lblSliderText.Visible = False
            Me.RadP_JobTypes.Visible = False
            Image1.Visible = True
            'If HF_LPH.Value <> "N/A" Then

            '    If HF_LPH.Value > 1 Then
            '        Me.PlaceHolder1.Dispose()
            '        Me.PlaceHolder1.Visible = True
            '        Me.PlaceHolder1.DataBind()
            '        GetGaugeStuff()
            '        Me.PlaceHolder1.DataBind()
            '    Else
            '        Me.lbl_LPH_Gauge.Visible = False
            '        Me.PlaceHolder1.Visible = False
            '    End If
            'End If

        End If
        If Me.RadTabStrip1.SelectedTab.PageViewID = "RadPV_Events_Jobs" Then
            If lblActivityStatus.Text <> "Disposed" Then
                Me.RadC_EventTimes.Visible = True
                GetChart_GridEventTypes(RadCB_Asset.SelectedValue)
                Me.RadP_EventTypes.Visible = True
                GetChart_EventTypes(RadCB_Asset.SelectedValue)
                'Me.RadC_MTBS.Visible = False
                ' Me.RadP_PlanVsUnPlan.Visible = False
                Me.RadC_ServiceHistory.Visible = False
                Me.RadG_NextService.Visible = False
                Me.RadSlider1.Style("Display") = "None"
                Me.lblSliderText.Visible = False
                Me.RadP_JobTypes.Visible = False
                'Me.lbl_LPH_Gauge.Visible = False
                Me.PlaceHolder1.Visible = False
                Image1.Visible = False
            Else
                Me.RadC_EventTimes.Visible = False
                Me.RadP_EventTypes.Visible = False
                'Me.RadC_MTBS.Visible = False
                ' Me.RadP_PlanVsUnPlan.Visible = False
                Me.RadC_ServiceHistory.Visible = False
                Me.RadG_NextService.Visible = False
                Me.RadSlider1.Style("Display") = "None"
                Me.lblSliderText.Visible = False
                Me.RadP_JobTypes.Visible = False
                'Me.lbl_LPH_Gauge.Visible = False
                Me.PlaceHolder1.Visible = False
                Image1.Visible = False
            End If
            GetEvents(RadCB_Asset.SelectedValue)
            Me.RadGrid_Active_Events.Visible = True
        Else
            Me.RadGrid_Active_Events.Visible = False
        End If
        If Me.RadTabStrip1.SelectedTab.PageViewID = "RadPV_Servicing" Then
            'Me.RadC_MTBS.Visible = False
            'Me.RadP_PlanVsUnPlan.Visible = False
            If lblActivityStatus.Text <> "Disposed" And lblTrend.Text <> "N/A" Then
                Me.RadC_EventTimes.Visible = False
                Me.RadP_EventTypes.Visible = False
                'Me.RadC_MTBS.Visible = False
                ' Me.RadP_PlanVsUnPlan.Visible = False
                Me.RadC_ServiceHistory.Visible = True
                GetChart_ServicingTypes(RadCB_Asset.SelectedValue)
                Me.RadG_NextService.Dispose()
                Me.RadG_NextService.Visible = True
                Me.RadG_NextService.DataBind()
                'GetRadialGauge()
                Me.RadG_NextService.DataBind()
                Me.RadSlider1.Style("Display") = "None"
                Me.lblSliderText.Visible = False
                Me.RadP_JobTypes.Visible = False
                'Me.lbl_LPH_Gauge.Visible = False
                Me.PlaceHolder1.Visible = False
                Image1.Visible = False
            Else
                Me.RadC_EventTimes.Visible = False
                Me.RadP_EventTypes.Visible = False
                'Me.RadC_MTBS.Visible = False
                ' Me.RadP_PlanVsUnPlan.Visible = False
                Me.RadC_ServiceHistory.Visible = False
                Me.RadG_NextService.Visible = False
                Me.RadSlider1.Style("Display") = "None"
                Me.lblSliderText.Visible = False
                Me.RadP_JobTypes.Visible = False
                ' Me.lbl_LPH_Gauge.Visible = False
                Me.PlaceHolder1.Visible = False
                Image1.Visible = False
            End If
            If HF_Trigger.Value = "SMU" Then
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_SMU_Counter").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_SMU_Left").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cycle").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Trend").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Sample").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Oil_Weeks").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Service_Weeks").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("ServiceType").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Event_Status").Display = True

                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cal_Date_Due").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cal_Event_Type").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cal_Status").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Exam_Date").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Exam_Status").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Fire_Date").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Fire_Status").Display = False
            End If
            If HF_Trigger.Value = "Calendar" Then
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_SMU_Counter").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_SMU_Left").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cycle").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Trend").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Sample").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Oil_Weeks").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Service_Weeks").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("ServiceType").Display = False
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Event_Status").Display = False

                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cal_Date_Due").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cal_Event_Type").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cal_Status").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Exam_Date").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Exam_Status").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Fire_Date").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Fire_Status").Display = True
            End If
            If HF_Trigger.Value = "SMU and Calendar" Then
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_SMU_Counter").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_SMU_Left").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cycle").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Trend").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Sample").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Oil_Weeks").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Service_Weeks").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("ServiceType").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Event_Status").Display = True

                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cal_Date_Due").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cal_Event_Type").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Cal_Status").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Exam_Date").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Exam_Status").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Fire_Date").Display = True
                RadGrid_Active_SER.MasterTableView.GetColumnSafe("SER_Fire_Status").Display = True
            End If
            GetServicing(RadCB_Asset.SelectedValue)
            Me.RadGrid_Active_SER.Visible = True
            GetServicingArchive(RadCB_Asset.SelectedValue)
            Me.RadGrid_Servicing_Archive.Visible = True
        Else
            Me.RadGrid_Active_SER.Visible = False
            Me.RadGrid_Servicing_Archive.Visible = False
        End If
        'If Me.RadTabStrip1.SelectedTab.PageViewID = "RadPV_SMU" Then
        '    If lblActivityStatus.Text <> "Disposed" Then
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.RadSlider1.Style("Display") = "None"
        '        Me.lblSliderText.Visible = False
        '        Me.RadP_JobTypes.Visible = False
        ''        Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    Else
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.RadSlider1.Style("Display") = "None"
        '        Me.lblSliderText.Visible = False
        '        Me.RadP_JobTypes.Visible = False
        ''        Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    End If
        '    Me.RadGrid_SMU.DataBind()
        '    Me.RadGrid_SMU.Visible = True
        'Else
        '    Me.RadGrid_SMU.Visible = False
        'End If
        'If Me.RadTabStrip1.SelectedTab.PageViewID = "RadPV_FUEL" Then
        '    If lblActivityStatus.Text <> "Disposed" Then
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.RadSlider1.Style("Display") = "None"
        '        Me.lblSliderText.Visible = False
        '        Me.RadP_JobTypes.Visible = False
        ''        Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    Else
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.RadSlider1.Style("Display") = "None"
        '        Me.lblSliderText.Visible = False
        '        Me.RadP_JobTypes.Visible = False
        ''        Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    End If
        '    Me.RadGrid_FUEL.DataBind()
        '    Me.RadGrid_FUEL.Visible = True
        'Else
        '    Me.RadGrid_FUEL.Visible = False
        'End If
        'If Me.RadTabStrip1.SelectedTab.PageViewID = "RadPV_ChangeOutPlan" Then
        '    If lblActivityStatus.Text <> "Disposed" Then
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.lblSliderText.Visible = True
        '        Me.RadSlider1.Style("Display") = "Block"
        '        Me.RadSlider1.DataBind()
        '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Date_Estimate").Display = False
        '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("Original_Estimate").Display = False
        '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("EstimateDiff").Display = False
        '        Me.RadP_JobTypes.Visible = False
        ''        Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    Else
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.RadSlider1.Style("Display") = "None"
        '        Me.lblSliderText.Visible = False
        '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Date_Estimate").Display = True
        '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("Original_Estimate").Display = True
        '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("EstimateDiff").Display = True
        '        Me.RadP_JobTypes.Visible = False
        ''        Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    End If
        '    Me.RadGrid_PLANNING.DataBind()
        '    Me.RadGrid_PLANNING.Visible = True
        'Else
        '    ''REMOVE LINE
        '    Me.RadGrid_PLANNING.Visible = False
        'End If
        'If Me.RadTabStrip1.SelectedTab.PageViewID = "RadPV_Parts" Then
        '    If lblActivityStatus.Text <> "Disposed" Then
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.RadSlider1.Style("Display") = "None"
        '        Me.lblSliderText.Visible = False
        '        Me.RadP_JobTypes.Visible = False
        ''        Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    Else
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.RadSlider1.Style("Display") = "None"
        '        Me.lblSliderText.Visible = False
        '        Me.RadP_JobTypes.Visible = False
        ''        Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    End If
        '    Me.RadGrid_Part_List.DataBind()
        '    Me.RadGrid_Part_List.Visible = True
        'Else
        '    Me.RadGrid_Part_List.Visible = False
        'End If
        'If Me.RadTabStrip1.SelectedTab.PageViewID = "RadPV_Warranties" Then
        '    If lblActivityStatus.Text <> "Disposed" Then
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.RadSlider1.Style("Display") = "None"
        '        Me.lblSliderText.Visible = False
        '        Me.RadP_JobTypes.Visible = False
        ''       Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    Else
        '        Me.RadC_EventTimes.Visible = False
        '        Me.RadP_EventTypes.Visible = False
        ''        Me.RadC_MTBS.Visible = False
        ''        Me.RadP_PlanVsUnPlan.Visible = False
        '        Me.RadC_ServiceHistory.Visible = False
        '        Me.RadG_NextService.Visible = False
        '        Me.RadSlider1.Style("Display") = "None"
        '        Me.lblSliderText.Visible = False
        '        Me.RadP_JobTypes.Visible = False
        ''        Me.lbl_LPH_Gauge.Visible = False
        '        Me.PlaceHolder1.Visible = False
        '        Image1.Visible = False
        '    End If
        '    Me.RadGrid_Warranty.DataBind()
        '    Me.RadGrid_Warranty.Visible = True
        'Else
        '    Me.RadGrid_Warranty.Visible = False
        'End If
        If Me.RadTabStrip1.SelectedTab.PageViewID = "RadPV_Jobs" Then
            If lblActivityStatus.Text <> "Disposed" Then
                Me.RadC_EventTimes.Visible = False
                Me.RadP_EventTypes.Visible = False
                'Me.RadC_MTBS.Visible = True
                'Me.RadC_MTBS.DataBind()
                'Me.RadP_PlanVsUnPlan.Visible = False
                Me.RadC_ServiceHistory.Visible = False
                Me.RadG_NextService.Visible = False
                Me.RadSlider1.Style("Display") = "None"
                Me.lblSliderText.Visible = False
                Me.RadP_JobTypes.Visible = True
                GetChart_JobTypes(RadCB_Asset.SelectedValue)
                'Me.lbl_LPH_Gauge.Visible = False
                Me.PlaceHolder1.Visible = False
                Image1.Visible = False
            Else
                Me.RadC_EventTimes.Visible = False
                Me.RadP_EventTypes.Visible = False
                'Me.RadC_MTBS.Visible = False
                ' Me.RadP_PlanVsUnPlan.Visible = False
                Me.RadC_ServiceHistory.Visible = False
                Me.RadG_NextService.Visible = False
                Me.RadSlider1.Style("Display") = "None"
                Me.lblSliderText.Visible = False
                Me.RadP_JobTypes.Visible = False
                'Me.lbl_LPH_Gauge.Visible = False
                Me.PlaceHolder1.Visible = False
                Image1.Visible = False
            End If
            Setup_ArchiveJob_Site_Combo()
            Me.RadCB_Site.SelectedValue = -1
                Setup_ArchiveJob_JobType_Combo()
                Me.RadCB_JobType.SelectedValue = -1
                Setup_ArchiveJob_JobStatus_Combo()
                Me.RadCB_Status.SelectedValue = "-1"
                Setup_ArchiveJob_Engineers_Combo()
            Me.RadCB_Engineer.SelectedValue = -1
            GetArchiveJobs(RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, RadCB_JobType.SelectedValue, RadCB_Status.SelectedValue, RadCB_Engineer.SelectedValue, RadTxt_Number.Text)
            Me.RadGrid_Archive_Jobs.Visible = True
        Else
            Me.RadGrid_Archive_Jobs.Visible = False
        End If
    End Sub
    Protected Sub RadGrid_Active_Events_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadGrid_Active_Events.SelectedIndexChanged
        GetJobs(RadGrid_Active_Events.SelectedValue)
        Me.RadGrid_Active_Jobs.Visible = True
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Setup_ArchiveJob_JobType_Combo()
        Me.RadCB_JobType.SelectedValue = -1
        Setup_ArchiveJob_JobStatus_Combo()
        Me.RadCB_Status.SelectedValue = "-1"
        Setup_ArchiveJob_Engineers_Combo()
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadTxt_Number.Text = ""
        GetArchiveJobs(RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, RadCB_JobType.SelectedValue, RadCB_Status.SelectedValue, RadCB_Engineer.SelectedValue, RadTxt_Number.Text)
    End Sub
    Protected Sub RadCB_JobType_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_JobType.SelectedIndexChanged
        Me.RadCB_Status.SelectedValue = "-1"
        Setup_ArchiveJob_Engineers_Combo()
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadTxt_Number.Text = ""
        GetArchiveJobs(RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, RadCB_JobType.SelectedValue, RadCB_Status.SelectedValue, RadCB_Engineer.SelectedValue, RadTxt_Number.Text)
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        Setup_ArchiveJob_Engineers_Combo()
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadTxt_Number.Text = ""
        GetArchiveJobs(RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, RadCB_JobType.SelectedValue, RadCB_Status.SelectedValue, RadCB_Engineer.SelectedValue, RadTxt_Number.Text)
    End Sub
    Protected Sub RadCB_Engineer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Engineer.SelectedIndexChanged
        Me.RadTxt_Number.Text = ""
        GetArchiveJobs(RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, RadCB_JobType.SelectedValue, RadCB_Status.SelectedValue, RadCB_Engineer.SelectedValue, RadTxt_Number.Text)
    End Sub

    Protected Sub RadTxt_Number_TextChanged(sender As Object, e As System.EventArgs) Handles RadTxt_Number.TextChanged
        Setup_ArchiveJob_Site_Combo()
        Me.RadCB_Site.SelectedValue = -1
        Setup_ArchiveJob_JobType_Combo()
        Me.RadCB_JobType.SelectedValue = -1
        Setup_ArchiveJob_JobStatus_Combo()
        Me.RadCB_Status.SelectedValue = "-1"
        Setup_ArchiveJob_Engineers_Combo()
        Me.RadCB_Engineer.SelectedValue = -1
        GetArchiveJobs(RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, RadCB_JobType.SelectedValue, RadCB_Status.SelectedValue, RadCB_Engineer.SelectedValue, RadTxt_Number.Text)
    End Sub
    Protected Sub RadGrid_Active_SER_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_SER.ItemDataBound
        For Each item As GridDataItem In RadGrid_Active_SER.Items
            Dim myTotalCell2 As TableCell = item("SER_Status_Flag")
            Dim myTotalCell4 As TableCell = item("SER_Service_Weeks")
            Dim ThisTotal2 = myTotalCell2.Text
            Dim ThisTotal4 = myTotalCell4.Text
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                If ThisTotal4 <= "0" And ThisTotal2 <> "NOT_IN_USE" Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal4 <= "0" And ThisTotal2 = "NOT_IN_USE" Then
                    item.BackColor = Drawing.Color.LightGray
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
            Dim myTotalCell3 As TableCell = item("SER_Event_Status")
            If InStr(myTotalCell3.Text, "&nbsp;") Then
            Else
                Dim ThisTotal3 = myTotalCell3.Text
                If ThisTotal3 = "Servicing" Then
                    item.BackColor = Drawing.Color.Orange
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "New (Cycle Change)" Then
                    item.BackColor = Drawing.Color.MediumSeaGreen
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "New" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Sample" Then
                    item.BackColor = Drawing.Color.BurlyWood
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Sample 2" Then
                    item.BackColor = Drawing.Color.BurlyWood
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Sample Event Created" Then
                    item.BackColor = Drawing.Color.BurlyWood
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Service Cancelled" Then
                    item.BackColor = Drawing.Color.Wheat
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal3 = "Service Overdue" Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
        Next
    End Sub
    'Private Sub RadSlider1_DataBound(sender As Object, e As EventArgs) Handles RadSlider1.DataBound
    '    RadSlider1.ItemType = SliderItemType.Tick
    '    RadSlider1.MaximumValue = 200
    '    RadSlider1.MinimumValue = 1
    '    RadSlider1.SmallChange = 1
    '    RadSlider1.LargeChange = 20
    '    RadSlider1.AnimationDuration = 400
    '    RadSlider1.Height = 40
    '    RadSlider1.Width = 500
    '    RadSlider1.ForeColor = Drawing.Color.White
    '    RadSlider1.AutoPostBack = True
    '    RadSlider1.Value = Me.lblTrend.Text
    'End Sub
    'Private Sub RadSlider1_ValueChanged(sender As Object, e As EventArgs) Handles RadSlider1.ValueChanged
    '    Me.lblTrend.Text = RadSlider1.Value
    '    Me.SqlDS_RadGrid_PLANNING.Select(DataSourceSelectArguments.Empty)
    '    Me.RadGrid_PLANNING.DataBind()
    '    If lblTrend.Text <> HF_Trend.Value Then
    '        Me.lblTrend.ForeColor = Drawing.Color.Red
    '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Date_Estimate").Display = True
    '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("Original_Estimate").Display = True
    '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("EstimateDiff").Display = True
    '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Date_Estimate2").Display = False
    '    Else
    '        Me.lblTrend.ForeColor = Drawing.Color.Black
    '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Date_Estimate").Display = False
    '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("Original_Estimate").Display = False
    '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("EstimateDiff").Display = False
    '        RadGrid_PLANNING.MasterTableView.GetColumnSafe("STM_Date_Estimate2").Display = True
    '    End If

    'End Sub
    'Sub Apply_Permissions()
    '    Select Case HF_PQQ_Permission.Value
    '        Case 5
    '            Me.RadTabStrip1.Tabs(10).Visible = True
    '        Case Else
    '            If Me.HF_EXCEPTION_18_R.Value = 1 Or Me.HF_EXCEPTION_18_RW.Value = 1 Then
    '                Me.RadTabStrip1.Tabs(10).Visible = True
    '            Else
    '                Me.RadTabStrip1.Tabs(10).Visible = False
    '            End If
    '    End Select
    'End Sub
End Class