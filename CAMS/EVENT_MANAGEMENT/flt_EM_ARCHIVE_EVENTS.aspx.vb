Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class EVENT_MANAGEMENT_flt_EM_ARCHIVE_EVENTS
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
        Me.RadCB_Customer.SelectedValue = -1
        Me.RadCB_Site.SelectedValue = -1
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_EventType.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        DateFrom.SelectedDate = DateAdd(DateInterval.Year, -1, DateTime.Now).ToString()
        DateTo.SelectedDate = DateAdd(DateInterval.Day, 1, DateTime.Now).ToString()
        Me.RadGrid_Active_Jobs.Visible = False
        Me.RadGrid_Active_FT.Visible = False
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
                                Select Case dr("EXCEPTION_ID").ToString()
                                    Case 134
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_6_R.Value = 1 'Event Management R
                                        End If
                                    Case 145
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_6_RW.Value = 1 'Event Management RW
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
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "EM - Archive Events"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
        If Not Me.IsPostBack Then
            Setup_Customer_Combo()
            Setup_Site_Combo()
            Setup_Asset_Combo()
            Setup_EventTypes_Combo()
            Setup_Engineers_Combo()
            GetEventsArchive(-1, -1, -1, -1, -1, "", DateFrom.SelectedDate, DateTo.SelectedDate)
        Else
            Dim eventTarget As String
            Dim eventArgument As String
            If (Me.Request("__EVENTTARGET") Is Nothing) Then
                eventTarget = String.Empty
            Else
                eventTarget = Me.Request("__EVENTTARGET")
                If (Me.Request("__EVENTARGUMENT") Is Nothing) Then
                    eventArgument = String.Empty
                Else
                    eventArgument = Me.Request("__EVENTARGUMENT")
                    ' Call your VB method here...
                    Select Case eventTarget
                        Case "Calculate"
                            Dim valuePassed As String = eventArgument
                            'Me.CalculateSheet()
                        Case "Show_Buttons"
                            Dim valuepassed As String = eventArgument
                            'ShowPage1_Buttons(valuepassed)
                        Case "Refresh_Grid"
                            Dim valuepassed As String = eventArgument
                            GetEventsArchive(-1, -1, -1, -1, -1, "", DateFrom.SelectedDate, DateTo.SelectedDate)
                            Me.RadGrid_Archive_Events.Rebind()
                            GetJobs(HF_E_ID.Value)
                            'GetTimesheets(HF_J_ID.Value)
                            WhichRowSelected()
                            SelectCorrectRecord()
                            WhichRowSelectedJob()
                            SelectCorrectRecordJob()
                            WhichRowSelectedFT()
                            SelectCorrectRecordFT()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub WhichRowSelected()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Archive_Events.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("E_ID").Text)
            count = count + 1
            If item.Selected Then
                HF_Row.Value = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecord()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Archive_Events.Items
            Dim EventIDCell As TableCell = item("E_ID")
            Dim EventID = EventIDCell.Text
            count = count + 1
            If Session("J_E_ID") = "null" Then Session("J_E_ID") = "0"

            If Session("J_E_ID") = EventID Then
                item.Selected = True
            End If
        Next
    End Sub
    Sub WhichRowSelectedJob()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Active_Jobs.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("J_ID").Text)
            count = count + 1
            If item.Selected Then
                HF_PageJob.Value = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecordJob()
        Dim count As Integer = 0
        Dim JobType As Integer = Session("JobType")
        Dim Status As String = Session("Status")

        If Status = "Open" Then

            For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Active_Jobs.Items
                Dim JobIDCell As TableCell = item("J_ID")
                Dim JobID = JobIDCell.Text
                count = count + 1
                If Session("J_ID") = "null" Then Session("J_ID") = "0"

                If Session("J_ID") = JobID Then
                    item.Selected = True
                End If
            Next
        Else
            If JobType <> 660 Then
                For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Active_Jobs.Items
                    Dim JobIDCell As TableCell = item("J_ID")
                    Dim JobID = JobIDCell.Text
                    count = count + 1
                    If Session("J_ID") = "null" Then Session("J_ID") = "0"

                    If Session("J_ID") = JobID Then
                        item.Selected = True
                    End If
                Next
            Else
                Me.RadCB_Customer.SelectedValue = -1
                Me.RadCB_Site.SelectedValue = -1
                Me.RadCB_Asset.SelectedValue = -1
                Me.RadCB_EventType.SelectedValue = -1
                Me.RadCB_Engineer.SelectedValue = -1
                Me.RadGrid_Active_Jobs.Visible = False
                Me.RadGrid_Active_FT.Visible = False
                Me.lbl_Job_Text.Visible = False
                Me.T1.Visible = False
                Me.lbl_FT_Text.Visible = False
                Setup_Customer_Combo()
                Setup_Site_Combo()
                Setup_Asset_Combo()
                Setup_EventTypes_Combo()
                Setup_Engineers_Combo()
                GetEventsArchive(-1, -1, -1, -1, -1, "", DateFrom.SelectedDate, DateTo.SelectedDate)
            End If
        End If

    End Sub
    Sub WhichRowSelectedFT()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Active_FT.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("FT_ID").Text)
            count = count + 1
            If item.Selected Then
                HF_PageFT.Value = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecordFT()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Active_FT.Items
            Dim FTIDCell As TableCell = item("FT_ID")
            Dim FTID = FTIDCell.Text
            count = count + 1
            If Session("FT_ID") = "null" Then Session("FT_ID") = "0"

            If Session("FT_ID") = FTID Then
                item.Selected = True
            End If
        Next
    End Sub
    Protected Sub RadGrid_Archive_Events_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Archive_Events.ItemDataBound
        For Each item As GridDataItem In RadGrid_Archive_Events.Items
            Dim DateEst As TableCell = item("E_Date_Estimated")
            Dim TimeDiff As TableCell = item("E_Time_Diff")
            Dim TimeDiffMins As TableCell = item("E_Time_Diff_Minutes")
            Dim TimeDiffMinsText = TimeDiffMins.Text
            Dim lblassetid As RadLabel = DirectCast(item.FindControl("RadLbl_Asset_ID_Event"), RadLabel)
            With lblassetid
                If IsNumeric(item("E_A_ID").Text) Then
                    .Attributes.Add("onClick", "asset_details('" + item("E_A_ID").Text + "');")
                    .ToolTip = "Open Asset Details"
                Else
                    .Visible = False
                End If
            End With
            Dim lblcusid As RadLabel = DirectCast(item.FindControl("RadLbl_Customer_ID_Event"), RadLabel)
            With lblcusid
                If IsNumeric(item("E_CUS_ID").Text) Then
                    .Attributes.Add("onClick", "cus_details('" + item("E_CUS_ID").Text + "');")
                    .ToolTip = "Open Customer Details"
                Else
                    .Visible = False
                End If
            End With
            Select Case TimeDiffMinsText
                Case <= 0
                    TimeDiff.ForeColor = Drawing.Color.FromName("#9bd562")
                    TimeDiff.Font.Bold = True
                Case > 0
                    TimeDiff.ForeColor = Drawing.Color.Tomato
                    TimeDiff.Font.Bold = True
            End Select
            'Dim myTotalCell4 As TableCell = item("E_Status")
            'If InStr(myTotalCell4.Text, "&nbsp;") Then
            'Else
            '    Dim ThisTotal4 = myTotalCell4.Text
            '    If ThisTotal4 = "Complete" Then
            '        item.BackColor = Drawing.Color.LightGreen
            '        item.ForeColor = Drawing.Color.Black
            '    End If
            '    If ThisTotal4 = "Cancelled" Then
            '        item.BackColor = Drawing.Color.LightSalmon
            '        item.ForeColor = Drawing.Color.Black
            '    End If
            'End If
        Next
    End Sub
    Protected Sub RadGrid_Active_Jobs_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_Jobs.ItemDataBound
        For Each item As GridDataItem In RadGrid_Active_Jobs.Items
            Dim TimeDiff As TableCell = item("J_Time_Diff")
            Dim TimeDiffMins As TableCell = item("J_Time_Diff_Minutes")
            Dim TimeDiffMinsText = TimeDiffMins.Text
            Dim myTotalCell4 As TableCell = item("J_Status")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                Dim ThisTotal4 = myTotalCell4.Text
                If ThisTotal4 = "Open" Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Complete" Then
                    item.BackColor = Drawing.Color.LightGreen
                    item.ForeColor = Drawing.Color.Black
                End If
                If ThisTotal4 = "Cancelled" Then
                    item.BackColor = Drawing.Color.LightSalmon
                    item.ForeColor = Drawing.Color.Black
                End If
            End If
            'Select Case TimeDiffMinsText
            '    Case <= 0
            '        TimeDiff.ForeColor = Drawing.Color.FromName("#9bd562")
            '        TimeDiff.Font.Bold = True
            '    Case > 0
            '        TimeDiff.ForeColor = Drawing.Color.Tomato
            '        TimeDiff.Font.Bold = True
            'End Select
        Next
    End Sub
    Protected Sub RadGrid_Active_FT_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_FT.ItemDataBound
        For Each item As GridDataItem In RadGrid_Active_FT.Items
            Dim myTotalCell4 As TableCell = item("FT_Status")
            If InStr(myTotalCell4.Text, "&nbsp;") Then
            Else
                Dim ThisTotal4 = myTotalCell4.Text
                If ThisTotal4 = "Open" Then
                    item.BackColor = Drawing.Color.Tomato
                    item.ForeColor = Drawing.Color.Black
                End If
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
    Protected Sub RadGrid_Archive_Events_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadGrid_Archive_Events.SelectedIndexChanged
        Me.lbl_Job_Text.Visible = True
        Me.T1.Visible = True
        Apply_Permissions()
        GetJobs(RadGrid_Archive_Events.SelectedValue)
        Me.RadGrid_Active_Jobs.Visible = True
        Me.lbl_FT_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
    End Sub
    Protected Sub RadGrid_Active_Jobs_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadGrid_Active_Jobs.SelectedIndexChanged
        GetTimesheets(RadGrid_Active_Jobs.SelectedValue)
        Me.lbl_FT_Text.Visible = True
        Me.RadGrid_Active_FT.Visible = True
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames_EventManagement(RadCB_Customer, True, 2)
    End Sub
    Private Sub Setup_Site_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Site = Setup.Populate_SiteNames_EventManagement(RadCB_Site, RadCB_Customer.SelectedValue, True, 2)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames_EventManagement(RadCB_Asset, RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, True, 2)
    End Sub
    Private Sub Setup_EventTypes_Combo()
        Dim Setup As New Setup.Combo
        RadCB_EventType = Setup.Populate_EventTypes_EventManagement(RadCB_EventType, RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, True, 2)
    End Sub
    Private Sub Setup_Engineers_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers_EventManagement(RadCB_Engineer, RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, True, 2)
    End Sub
    Private Sub GetEventsArchive(ByVal CUS_ID As Integer, SITE_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID As Integer, ByVal PER_EMP_ID As Integer, ByVal E_Description As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetEventsArchive(CUS_ID, SITE_ID, A_ID, ATT_ID, PER_EMP_ID, E_Description, DateFrom, DateTo) '*ARCHIVE EVENTS
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadGrid_Archive_Events.DataSource = dtMain1
        RadGrid_Archive_Events.DataBind()
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
    Private Sub GetTimesheets(J_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetActiveTimesheets(J_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_Active_FT.DataSource = dtMain
        RadGrid_Active_FT.DataBind()
    End Sub
#End Region
    Protected Sub btn_Refresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Refresh.Click
        Me.RadCB_Customer.SelectedValue = -1
        Me.RadCB_Site.SelectedValue = -1
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_EventType.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadTxt_Instruction.Text = ""
        DateFrom.SelectedDate = DateAdd(DateInterval.Year, -1, DateTime.Now).ToString()
        DateTo.SelectedDate = DateAdd(DateInterval.Day, 1, DateTime.Now).ToString()

        Me.RadGrid_Archive_Events.DataBind()
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.T1.Visible = False

        Setup_Customer_Combo()
        Setup_Site_Combo()
        Setup_Asset_Combo()
        Setup_EventTypes_Combo()
        Setup_Engineers_Combo()
        GetEventsArchive(-1, -1, -1, -1, -1, "", DateFrom.SelectedDate, DateTo.SelectedDate)
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Me.RadCB_Site.SelectedValue = -1
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_EventType.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadTxt_Instruction.Text = ""
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.T1.Visible = False

        Setup_Site_Combo()
        Setup_Asset_Combo()
        Setup_EventTypes_Combo()
        Setup_Engineers_Combo()
        GetEventsArchive(RadCB_Customer.SelectedValue, -1, -1, -1, -1, "", DateFrom.SelectedDate, DateTo.SelectedDate)
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Dim abc As String = RadCB_Site.SelectedValue
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_EventType.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadTxt_Instruction.Text = ""
        Me.HF_Site.Value = abc
        Me.lbl_Job_Text.Visible = False
        Me.T1.Visible = False
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False

        Setup_Asset_Combo()
        Setup_EventTypes_Combo()
        Setup_Engineers_Combo()
        GetEventsArchive(RadCB_Customer.SelectedValue, -1, -1, -1, -1, "", DateFrom.SelectedDate, DateTo.SelectedDate)
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Me.RadCB_EventType.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadTxt_Instruction.Text = ""
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.T1.Visible = False

        Setup_EventTypes_Combo()
        Setup_Engineers_Combo()
        GetEventsArchive(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadCB_Asset.SelectedValue, -1, -1, "", DateFrom.SelectedDate, DateTo.SelectedDate)
    End Sub
    Protected Sub RadCB_EventType_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_EventType.SelectedIndexChanged
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadTxt_Instruction.Text = ""
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.T1.Visible = False

        Setup_Engineers_Combo()
        GetEventsArchive(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadCB_Asset.SelectedValue, RadCB_EventType.SelectedValue, -1, "", DateFrom.SelectedDate, DateTo.SelectedDate)
    End Sub
    Protected Sub RadCB_Engineer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Engineer.SelectedIndexChanged
        Me.RadTxt_Instruction.Text = ""
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.T1.Visible = False

        GetEventsArchive(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadCB_Asset.SelectedValue, RadCB_EventType.SelectedValue, RadCB_Engineer.SelectedValue, "", DateFrom.SelectedDate, DateTo.SelectedDate)
    End Sub
    Protected Sub RadBtn_EXPORT_Click(sender As Object, e As System.EventArgs) Handles RadBtn_EXPORT.Click
        RadGrid_Archive_Events.MasterTableView.ExportToExcel()
    End Sub
    Protected Sub RadTxt_Instruction_TextChanged(sender As Object, e As EventArgs) Handles RadTxt_Instruction.TextChanged
        GetEventsArchive(-1, -1, -1, -1, -1, RadTxt_Instruction.Text, DateFrom.SelectedDate, DateTo.SelectedDate)
    End Sub
    Protected Sub DateFrom_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles DateFrom.SelectedDateChanged
        DateTo.SelectedDate = DateAdd(DateInterval.Day, 1, DateTime.Now).ToString()
        Me.RadGrid_Archive_Events.DataBind()
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.T1.Visible = False

        GetEventsArchive(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadCB_Asset.SelectedValue, RadCB_EventType.SelectedValue, RadCB_Engineer.SelectedValue, "", DateFrom.SelectedDate, DateTo.SelectedDate)
    End Sub
    Protected Sub DateTo_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles DateTo.SelectedDateChanged
        Me.RadGrid_Archive_Events.DataBind()
        Me.RadGrid_Active_Jobs.Visible = False
        Me.lbl_Job_Text.Visible = False
        Me.RadGrid_Active_FT.Visible = False
        Me.lbl_FT_Text.Visible = False
        Me.T1.Visible = False

        GetEventsArchive(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadCB_Asset.SelectedValue, RadCB_EventType.SelectedValue, RadCB_Engineer.SelectedValue, "", DateFrom.SelectedDate, DateTo.SelectedDate)
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 4
                Me.T1.Visible = True
            Case 5
                Me.T1.Visible = True
            Case Else
                Me.T1.Visible = False
        End Select
    End Sub

End Class