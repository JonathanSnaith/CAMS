Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI

Partial Class EVENT_MANAGEMENT_flt_EM_EVENTS_EDIT_RW
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.HF_E_ID.Value = Request.QueryString("E_ID")
        Me.HF_GUID.Value = Request.QueryString("FLT_GUID")
        Me.HF_PreviousPage.Value = Request.QueryString("PreviousPage")
        Session("J_E_ID") = Me.HF_E_ID.Value
        Dim SESSION_ID As Integer
        If HttpContext.Current.Request.IsLocal Then
            SESSION_ID = 1
        Else
            SESSION_ID = Request.QueryString("FLT_GUID")
        End If
        Get_Session_Info(SESSION_ID, 133)
        ' GetData()
        Apply_Permissions()

        If Me.HF_E_ID.Value = 0 Then
            lblTitle.Text = "ADD EVENT"
            Me.Title = lblTitle.Text
            Me.lbl_Created.Visible = False
            Me.lbl_Created_By.Visible = False
            Me.lbl_Modified.Visible = False
            Me.lbl_Modified_By.Visible = False
            Me.lbl_Latest_SMU.Visible = False
            Me.lbl_Trend.Visible = False
            Me.lbl_Subtotal_Text.Visible = False
            Me.lbl_Subtotal.Visible = False
            Me.lbl_Discount.Visible = False
            Me.RadNumTxt_Discount.Visible = False
            Me.lbl_Total_Text.Visible = False
            Me.lbl_Total.Visible = False
            RadGrid_Items.Visible = False
            RadBtn_Add_Item.Visible = False
            RadDP_From.SelectedDate = DateTime.Now
            RadNumTxt_Months.Text = 1
            CalcToDate()
            RadCB_Payment_Terms.SelectedValue = "30 Days"
            Me.lbl_Time_Diff_Text.Visible = False
            Me.lbl_Time_Diff.Visible = False
        Else
            lblTitle.Text = "EDIT EVENT"
            Me.Title = lblTitle.Text
            Me.lbl_Created.Visible = True
            Me.lbl_Created_By.Visible = True
            Me.lbl_Modified.Visible = True
            Me.lbl_Modified_By.Visible = True
            Me.lbl_Latest_SMU.Visible = False
            Me.lbl_Trend.Visible = False
            GetDocumentsfromEvent(HF_E_ID.Value)
            Me.lbl_Time_Diff_Text.Visible = True
            Me.lbl_Time_Diff.Visible = True
        End If
        ShowHideSave()
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
                                            Me.HF_EXCEPTION_6_R.Value = 1 'Event Dashboard R
                                        End If
                                    Case 145
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_6_RW.Value = 1 'Event Dashboard RW
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
        Dim ThisID As String = HF_E_ID.Value
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "EM - Events - Add/Edit" & " (" & ThisID & ")"
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            qry.SavePageCount(Me.HF_PageName.Value _
                            , HF_Username.Value)
        End If
        If Not Me.IsPostBack Then
            If HF_E_ID.Value = 0 Then
            Else
                GetData()
                CalcTotals()
            End If
            Setup_Customer_Combo()
            Setup_EventCats_Combo()
            Setup_EventTypes_Combo()
            Setup_Engineers_Combo()
        End If
        If Me.IsPostBack Then
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
                        Case "Refresh_Grid"
                            Dim valuepassed As String = eventArgument
                            'Me.RadGrid_Items.Rebind()
                            GetEIAll(HF_E_ID.Value)
                            WhichRowSelected()
                            SelectCorrectRecord()
                            CalcTotals()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub WhichRowSelected()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Items.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("EI_ID").Text)
            count = count + 1
            If item.Selected Then
                HF_PageEI.Value = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecord()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Items.Items
            Dim EIIDCell As TableCell = item("EI_ID")
            Dim EIID = EIIDCell.Text
            count = count + 1
            If Session("EI_ID") = "null" Then Session("EI_ID") = "0"

            If Session("EI_ID") = EIID Then
                item.Selected = True
            End If
        Next
    End Sub
    Sub GetData()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.EM_EVENTS_RG_SELECT_RW_SP(HF_E_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lbl_Created.Text = "Created: " + DateTime.Parse(drvSql("E_Created")).ToString("dd MMM yyyy HH:mm")
            Me.lbl_Created_By.Text = "by " + drvSql("E_Created_By").ToString()
            Me.lbl_Modified.Text = "Modified: " + DateTime.Parse(drvSql("E_Modified")).ToString("dd MMM yyyy HH:mm")
            Me.lbl_Modified_By.Text = "by " + drvSql("E_Modified_By").ToString()
            Me.RadCB_Customer.SelectedValue = drvSql("E_CUS_ID").ToString()
            Setup_Site_Combo()
            Me.RadCB_Site.SelectedValue = drvSql("E_SITE_ID").ToString()
            Setup_Asset_Combo()
            Me.RadCB_Asset.SelectedValue = drvSql("E_A_ID").ToString()
            lblModel.Text = drvSql("Model").ToString()
            Setup_EventCats_Combo()
            Me.RadCB_EventCat.SelectedValue = drvSql("E_EC_ID").ToString()
            Setup_EventTypes_Combo()
            If drvSql("E_ET_ID").ToString() = 0 Then
                RadCB_EventType.SelectedValue = Nothing
            Else
                Me.RadCB_EventType.SelectedValue = drvSql("E_ET_ID").ToString()
                Me.HF_ET_ID.Value = drvSql("E_ET_ID").ToString()
            End If
            Setup_Engineers_Combo()
            Me.RadCB_Engineer.SelectedValue = drvSql("E_Engineer_ID").ToString()

            If IsDBNull(drvSql("E_Date_Estimated")) = False Then
                Me.RadDP_Estimated_Date.SelectedDate = DateTime.Parse(drvSql("E_Date_Estimated")).ToString("dd MMM yyyy")
            End If
            If IsDBNull(drvSql("E_Date_Ended")) = False Then
                Me.RadDP_Ended_Date.SelectedDate = DateTime.Parse(drvSql("E_Date_Ended")).ToString("dd MMM yyyy")
            End If
            If IsDBNull(drvSql("E_Planned_Start_Date")) = False Then
                Me.RadDP_Planned_Start_Date.SelectedDate = DateTime.Parse(drvSql("E_Planned_Start_Date")).ToString("dd MMM yyyy")
            End If
            If RadCB_EventType.SelectedValue = "621" Then
                lbl_Start.Visible = True
                RadDTP_Start.Visible = True
                If IsDBNull(drvSql("E_Date_Started")) = False Then
                    Me.RadDTP_Start.SelectedDate = DateTime.Parse(drvSql("E_Date_Started")).ToString("dd MMM yyyy HH:mm")
                End If
            Else
                lbl_Start.Visible = False
                RadDTP_Start.Visible = False
                Me.RadDTP_Start.Clear()
            End If
            Me.HF_Previous_Status.Value = drvSql("E_Status").ToString()
            If Me.HF_Previous_Status.Value = "Complete" Or Me.HF_Previous_Status.Value = "Cancelled" Then
                Me.RadCB_Status.Visible = False
                Me.RadCB_Status_Archive.Visible = True
                Me.RadCB_Status_Archive.SelectedValue = drvSql("E_Status").ToString()
                Me.HF_Status.Value = drvSql("E_Status").ToString()
            Else
                Me.RadCB_Status.Visible = True
                Me.RadCB_Status_Archive.Visible = False
                Me.RadCB_Status.SelectedValue = drvSql("E_Status").ToString()
                Me.HF_Status.Value = drvSql("E_Status").ToString()
            End If
            'If RadCB_EventCat.SelectedValue <> 3289 Then
            If drvSql("E_Discount").ToString() = Nothing Then
                Me.RadNumTxt_Discount.Text = drvSql("CUS_Discount").ToString()
            Else
                Me.RadNumTxt_Discount.Text = drvSql("E_Discount").ToString()
            End If
            If drvSql("E_Subtotal").ToString() <> Nothing Then
                Me.lbl_Subtotal.Text = Format(drvSql("E_Subtotal"), "£#,##0.00")
            End If
            If drvSql("E_Total").ToString() <> Nothing Then
                Me.lbl_Total.Text = Format(drvSql("E_Total"), "£#,##0.00")
            End If
            'End If
            Me.lbl_Trend.Text = "Trend: " + drvSql("SER_Trend").ToString()
            Me.lbl_Latest_SMU.Text = "SMU: " + drvSql("LatestSMU").ToString()
            Me.RadTxt_Description.Text = drvSql("E_Description").ToString()
            If IsDBNull(drvSql("E_Date_From")) = False Then
                Me.RadDP_From.SelectedDate = DateTime.Parse(drvSql("E_Date_From")).ToString("dd MMM yyyy")
            End If
            Me.RadNumTxt_Months.Text = drvSql("E_Months").ToString()
            If IsDBNull(drvSql("E_Date_To")) = False Then
                Me.RadDP_To.SelectedDate = DateTime.Parse(drvSql("E_Date_To")).ToString("dd MMM yyyy")
            End If
            lbl_Estimated_Hours.Text = drvSql("E_Estimated_Time").ToString()
            lbl_Actual_Hours.Text = drvSql("E_Total_Time").ToString()
            lbl_Time_Diff.Text = drvSql("E_Time_Diff").ToString()
            lbl_Engineer_Rate.Text = Format(drvSql("E_Engineer_Rate"), "£#,##0.00")
            Dim DiffMins As Integer
            DiffMins = drvSql("E_Time_Diff_Minutes").ToString()
            Select Case DiffMins
                Case <= 0
                    lbl_Time_Diff.ForeColor = Drawing.Color.FromName("#9bd562")
                    lbl_Time_Diff.Font.Bold = True
                Case > 0
                    lbl_Time_Diff.ForeColor = Drawing.Color.Tomato
                    lbl_Time_Diff.Font.Bold = True
            End Select
            Me.RadCB_Payment_Terms.SelectedValue = drvSql("E_Payment_Terms").ToString()
            Me.RadTxt_Special_Note.Text = drvSql("E_Special_Note").ToString()
            Me.RadTxt_Notes.Text = drvSql("E_Notes").ToString()
            CheckDates()
            If Me.RadCB_Status.SelectedValue = "Complete" Or Me.RadCB_Status.SelectedValue = "Cancelled" Then
                Me.lbl_Ended.Visible = True
                Me.RadDP_Ended_Date.Visible = True
            Else
                Me.lbl_Ended.Visible = False
                Me.RadDP_Ended_Date.Visible = False

            End If
            If Me.RadCB_Status_Archive.SelectedValue = "Complete" Or Me.RadCB_Status_Archive.SelectedValue = "Cancelled" Then
                Me.lbl_Ended.Visible = True
                Me.RadDP_Ended_Date.Visible = True
            Else
                Me.lbl_Ended.Visible = False
                Me.RadDP_Ended_Date.Visible = False
            End If
            If HF_E_ID.Value = 0 Then
                ShowHideTime()
            Else
                ShowHideItemsGrid()
            End If
        End If
    End Sub
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames_EventManagement(RadCB_Customer, False, 1)
    End Sub
    Private Sub Setup_Site_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Site = Setup.Populate_SiteNames_EventManagement(RadCB_Site, RadCB_Customer.SelectedValue, False, 1)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames_EventManagement(RadCB_Asset, RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, False, 1)
    End Sub
    Private Sub Setup_EventCats_Combo()
        Dim Setup As New Setup.Combo
        RadCB_EventCat = Setup.Populate_AttributeDropdown(RadCB_EventCat, False, "Event_Category")
    End Sub
    Private Sub Setup_EventTypes_Combo()
        Dim Setup As New Setup.Combo
        RadCB_EventType = Setup.Populate_AttributeDropdown(RadCB_EventType, False, "Event_Type")
    End Sub
    Private Sub Setup_Engineers_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers(RadCB_Engineer, False, HF_E_ID.Value)
    End Sub
    Private Sub GetDocumentsfromEvent(E_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetDocumentsfromEvent(E_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_Attachments.DataSource = dtMain
        RadGrid_Attachments.DataBind()
    End Sub
    Private Sub GetEIAll(E_ID As Integer)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds As DataSet = qry.GetEIAll(E_ID)
        Dim dtMain As DataTable
        dtMain = ds.Tables(0)
        RadGrid_Items.DataSource = dtMain
        RadGrid_Items.DataBind()
        CalcTotals()
    End Sub
    Private Sub GetNextEventID()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetNextEventID()
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.HF_E_ID.Value = drvSql("E_ID").ToString()
        End If
    End Sub
#End Region
    Protected Sub Btn_Save_Click(sender As Object, e As System.EventArgs) Handles Btn_Save.Click
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        qry.SaveEvent(Me.HF_E_ID.Value _
                        , RadCB_Customer.SelectedValue _
                        , RadCB_Site.SelectedValue _
                        , RadCB_Asset.SelectedValue _
                        , RadCB_EventCat.SelectedValue _
                        , RadCB_EventType.SelectedValue _
                        , RadCB_Engineer.SelectedValue _
                        , RadTxt_Description.Text _
                        , If(IsNothing(RadDP_Estimated_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Estimated_Date.SelectedDate) _
                        , If(IsNothing(RadDTP_Start.SelectedDate), DateTime.Parse("1900-01-01"), RadDTP_Start.SelectedDate) _
                        , If(IsNothing(RadDP_Planned_Start_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Planned_Start_Date.SelectedDate) _
                        , If(IsNothing(RadDP_From.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_From.SelectedDate) _
                        , RadNumTxt_Months.Text _
                        , If(IsNothing(RadDP_To.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_To.SelectedDate) _
                        , RadCB_Payment_Terms.SelectedValue _
                        , RadTxt_Special_Note.Text _
                        , If(IsNothing(RadDP_Ended_Date.SelectedDate), DateTime.Parse("1900-01-01"), RadDP_Ended_Date.SelectedDate) _
                        , HF_Status.Value _
                        , RadTxt_Notes.Text _
                        , CDbl(lbl_Subtotal.Text) _
                        , RadNumTxt_Discount.Text _
                        , CDbl(lbl_Total.Text) _
                        , HF_Event_ReOpen.Value _
                        , HF_Username.Value _
                        , HF_Username.Value)
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "saveandcloseWindow();", True)
        Session("J_E_ID") = Me.HF_E_ID.Value
    End Sub
    Sub GetDefaultDiscount()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetDefaultDiscount(RadCB_Customer.SelectedValue)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.RadNumTxt_Discount.Text = drvSql("CUS_Discount").ToString()
        End If
    End Sub
    Sub CalcTotals()
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim dt As DataTable = qry.GetEventItemsTotals(HF_E_ID.Value)
        If dt.Rows.Count > 0 Then
            Dim drvSql As DataRow = dt.Rows(0)
            Me.lbl_Subtotal.Text = Format(drvSql("EI_Total"), "£#,##0.00")
        End If
        Dim DiscountPCT As Double
        If RadNumTxt_Discount.Text = "" Then RadNumTxt_Discount.Text = "0"
        DiscountPCT = (100 - CDbl(RadNumTxt_Discount.Text)) / 100
        If DiscountPCT = Nothing Then DiscountPCT = 0
        If DiscountPCT = 0 Then
            lbl_Total.Text = Format(CDbl(lbl_Subtotal.Text), "£#,##0.00")
        Else
            lbl_Total.Text = Format(CDbl(lbl_Subtotal.Text) * DiscountPCT, "£#,##0.00")
        End If
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        RadCB_Site.ClearSelection()
        Setup_Site_Combo()
        RadCB_Asset.ClearSelection()
        ShowHideSave()
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        RadCB_Asset.ClearSelection()
        Setup_Asset_Combo()
        ShowHideSave()
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        ShowHideSave()
    End Sub
    Protected Sub RadCB_EventCat_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_EventCat.SelectedIndexChanged
        ShowHideItemsGrid()
        ShowHideSave()
    End Sub
    Protected Sub RadCB_EventType_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_EventType.SelectedIndexChanged
        ShowHideTime()
        If RadCB_EventType.SelectedValue = "" Then
            ShowHideSave()
        Else
            If RadCB_Status.SelectedValue = "Planning" And RadCB_EventType.SelectedValue = 621 Then
                Me.RadNotification2.Visible = True
                Me.RadNotification2.Text = "Cannot save Breakdown Event in Planning"
                Me.Btn_Save.Visible = False
            Else
                Me.RadNotification2.Visible = False
                Me.Btn_Save.Visible = True
                ShowHideSave()
            End If
            If HF_E_ID.Value <> 0 Then
                If RadCB_EventType.SelectedValue = 636 Or RadCB_EventType.SelectedValue = 623 Or RadCB_EventType.SelectedValue = 635 Then
                    Me.Btn_Save.Visible = False
                Else
                    Me.Btn_Save.Visible = True
                    ShowHideSave()
                End If
            End If
        End If
    End Sub
    Protected Sub RadCB_Engineer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Engineer.SelectedIndexChanged
        ShowHideSave()
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        StatusRules()
        Me.HF_Status.Value = Me.RadCB_Status.SelectedValue
    End Sub
    Protected Sub RadCB_Status_Archive_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status_Archive.SelectedIndexChanged
        StatusRules()
        Me.HF_Status.Value = Me.RadCB_Status_Archive.SelectedValue
        If RadCB_Status_Archive.SelectedValue = "Planning" Or RadCB_Status_Archive.SelectedValue = "Open" Then
            ReOpenEvent()
        End If
    End Sub
    Sub StatusRules()
        If Me.RadCB_Status_Archive.SelectedValue = "Complete" Or Me.RadCB_Status_Archive.SelectedValue = "Cancelled" Then
            Me.lbl_Ended.Visible = True
            Me.RadDP_Ended_Date.Visible = True
            Me.RadDP_Ended_Date.SelectedDate = DateTime.Now.ToString("dd MMM yyyy")
        Else
            Me.lbl_Ended.Visible = False
            Me.RadDP_Ended_Date.Visible = False
            Me.RadDP_Ended_Date.Clear()
        End If
        If RadCB_Status_Archive.SelectedValue = "Planning" And RadCB_EventType.SelectedValue = 621 Then
            Me.RadNotification2.Visible = True
            Me.RadNotification2.Text = "Cannot save Breakdown Event in Planning"
            Me.Btn_Save.Visible = False
        Else
            Me.RadNotification2.Visible = False
            Me.Btn_Save.Visible = True
            ShowHideSave()
        End If

    End Sub
    Sub ReOpenEvent()
        If HF_Previous_Status.Value = "Complete" Or HF_Previous_Status.Value = "Cancelled" Then
            Me.HF_Event_ReOpen.Value = 1
        Else
            Me.HF_Event_ReOpen.Value = 0
        End If
    End Sub
    Sub ShowHideSave()
        If RadCB_Customer.SelectedValue = "" Or RadCB_Site.SelectedValue = "" Or RadCB_Asset.SelectedValue = "" Or RadCB_EventCat.SelectedValue = "" Or RadCB_EventType.SelectedValue = "" Or RadCB_Engineer.SelectedValue = "" Then
            Me.Btn_Save.Visible = False
        Else
            Me.Btn_Save.Visible = True
            CheckDates()
        End If
    End Sub
    Sub ShowHideTime()
        If Me.RadCB_EventType.SelectedValue = 621 Then
            Me.lbl_Start.Visible = True
            Me.RadDTP_Start.Visible = True
            RadDTP_Start.SelectedDate = DateTime.Now
        Else
            Me.lbl_Start.Visible = False
            Me.RadDTP_Start.Visible = False
            Me.RadDTP_Start.Clear()
        End If
    End Sub
    Sub ShowHideItemsGrid()
        'If RadCB_EventCat.SelectedValue <> 3289 Then
        If RadNumTxt_Discount.Text = "" Then
            GetDefaultDiscount()
        End If
        If HF_E_ID.Value = 0 Then
            GetNextEventID()
        End If
        If RadCB_Status_Archive.SelectedValue = "Complete" Then
            RadBtn_Add_Item.Visible = False
        Else
            RadBtn_Add_Item.Visible = True
        End If

        RadGrid_Items.Visible = True
        GetEIAll(HF_E_ID.Value)
        Me.lbl_Subtotal_Text.Visible = True
        Me.lbl_Subtotal.Visible = True
        Me.lbl_Discount.Visible = True
        Me.RadNumTxt_Discount.Visible = True
        Me.lbl_Total_Text.Visible = True
        Me.lbl_Total.Visible = True
        'End If
    End Sub

    Protected Sub RadNumTxt_Discount_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Discount.TextChanged
        CalcTotals()
    End Sub
    Sub CheckDates()
        If RadDP_Planned_Start_Date.IsEmpty Or RadDP_Estimated_Date.IsEmpty Then
            Me.Btn_Save.Visible = False
        Else
            If RadDP_Planned_Start_Date.SelectedDate > RadDP_Estimated_Date.SelectedDate Then
                RadNotification1.Visible = True
                RadNotification1.Text = "Planned Start Date is greater than Estimated Due Back date - This will cause an error on the Calendar. Please correct before continuing."
                Btn_Save.Visible = False
            Else
                RadNotification1.Visible = False
                Btn_Save.Visible = True
                Apply_Permissions()
            End If
        End If
    End Sub
    Sub CalcToDate()
        Dim D As Date = RadDP_From.SelectedDate
        Dim I As Integer = RadNumTxt_Months.Text
        Dim N As Date = DateAdd(DateInterval.Month, I, D)
        RadDP_To.SelectedDate = N
    End Sub
    Protected Sub RadNumTxt_Months_TextChanged(sender As Object, e As EventArgs) Handles RadNumTxt_Months.TextChanged
        CalcToDate()
    End Sub
    Protected Sub RadDP_From_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_From.SelectedDateChanged
        CalcToDate()
    End Sub
    Protected Sub RadDP_Planned_Start_Date_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_Planned_Start_Date.SelectedDateChanged
        CheckDates()
    End Sub
    Protected Sub RadDP_Estimated_Date_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_Estimated_Date.SelectedDateChanged
        CheckDates()
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_6_RW.Value = 1 Then
                    Me.Btn_Save.Visible = True
                Else
                    Me.Btn_Save.Visible = False
                End If
            Case 3
                If HF_EXCEPTION_6_RW.Value = 1 Then
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
    Sub FormatGrid()
        For Each item As GridDataItem In RadGrid_Items.Items
            Dim myTotalCell4 As TableCell = item("EI_Status")
            Dim ThisTotal4 = myTotalCell4.Text
            Dim EIDiff As TableCell = item("EI_Diff")
            Dim Diff = EIDiff.Text
            If ThisTotal4 = "Used" And Diff = "0" Then
                item.BackColor = Drawing.Color.LightGreen
                item.ForeColor = Drawing.Color.Black
            ElseIf ThisTotal4 = "Used" And Diff <> "0" Then
                item.BackColor = Drawing.Color.Chocolate
                item.ForeColor = Drawing.Color.Black
            End If
            If ThisTotal4 = "Unused" Then
                item.BackColor = Drawing.Color.LightSalmon
                item.ForeColor = Drawing.Color.Black
            End If
        Next
    End Sub
    Private Sub RadGrid_Items_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid_Items.ItemDataBound
        FormatGrid()
    End Sub
    Private Sub RadGrid_Items_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadGrid_Items.SelectedIndexChanged
        FormatGrid()
    End Sub
End Class