Imports System.Data
Imports System.Data.SqlClient
Partial Class REPORTS_flt_REPORT_EVENT
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        Me.HF_SessionIP.Value = Request.UserHostAddress
        Me.lblPageName.Text = "*Not Specified"
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        Me.lbl_Select.Text = ""
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
        Dim FLT_Username As String = Request.QueryString("FLT_Username")
        If Request.QueryString("GUID") = "" Then
            OKtoContinue = False
        End If
        Session("Cancel") = Nothing
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
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 0 'OTHER
                Me.RadBtn_Events_Open.Visible = False
                Me.RadBtn_Jobs_Open.Visible = False
                Me.RadBtn_Events_Open_Month.Visible = False
                Me.RadBtn_Service.Visible = False
                Me.RadBtn_Blank_JobCard.Visible = False
                Me.RadBtn_Blank_Plug.Visible = False
                Me.RadBtn_JobCard.Visible = False
                Me.RadBtn_Changeout_Report.Visible = False
                Me.RadBtn_Timesheet_Summary_Report.Visible = False
                Me.RadBtn_Event_Costing.Visible = False
                Me.RadBtn_Event_Costing_Event_Only.Visible = False
                Me.RadBtn_Component_Life.Visible = False
                Me.RadBtn_Event_MTBS.Visible = False
                Me.RadBtn_Service_Archive.Visible = False
                Me.RadBtn_JobCard_Complete.Visible = False
            Case 1 'GU
                Me.RadBtn_Events_Open.Visible = True
                Me.RadBtn_Jobs_Open.Visible = True
                Me.RadBtn_Events_Open_Month.Visible = True
                Me.RadBtn_Service.Visible = True
                Me.RadBtn_Blank_JobCard.Visible = True
                Me.RadBtn_Blank_Plug.Visible = True
                Me.RadBtn_JobCard.Visible = True
                Me.RadBtn_Changeout_Report.Visible = True
                Me.RadBtn_Timesheet_Summary_Report.Visible = False
                Me.RadBtn_Event_Costing.Visible = False
                Me.RadBtn_Event_Costing_Event_Only.Visible = False
                Me.RadBtn_Component_Life.Visible = False
                Me.RadBtn_Event_MTBS.Visible = False
                Me.RadBtn_Service_Archive.Visible = False
                Me.RadBtn_JobCard_Complete.Visible = False
            Case 2 'MANAGER
                Me.RadBtn_Events_Open.Visible = True
                Me.RadBtn_Jobs_Open.Visible = True
                Me.RadBtn_Events_Open_Month.Visible = True
                Me.RadBtn_Service.Visible = True
                Me.RadBtn_Blank_JobCard.Visible = True
                Me.RadBtn_Blank_Plug.Visible = True
                Me.RadBtn_JobCard.Visible = True
                Me.RadBtn_Changeout_Report.Visible = True
                Me.RadBtn_Timesheet_Summary_Report.Visible = False
                Me.RadBtn_Event_Costing.Visible = False
                Me.RadBtn_Event_Costing_Event_Only.Visible = False
                Me.RadBtn_Component_Life.Visible = False
                Me.RadBtn_Event_MTBS.Visible = False
                Me.RadBtn_Service_Archive.Visible = False
                Me.RadBtn_JobCard_Complete.Visible = False
            Case 3 'DIVISIONAL
                Me.RadBtn_Events_Open.Visible = True
                Me.RadBtn_Jobs_Open.Visible = True
                Me.RadBtn_Events_Open_Month.Visible = True
                Me.RadBtn_Service.Visible = True
                Me.RadBtn_Blank_JobCard.Visible = True
                Me.RadBtn_Blank_Plug.Visible = True
                Me.RadBtn_JobCard.Visible = True
                Me.RadBtn_Changeout_Report.Visible = True
                Me.RadBtn_Timesheet_Summary_Report.Visible = True
                Me.RadBtn_Event_Costing.Visible = True
                Me.RadBtn_Event_Costing_Event_Only.Visible = True
                Me.RadBtn_Component_Life.Visible = True
                Me.RadBtn_Event_MTBS.Visible = True
                Me.RadBtn_Service_Archive.Visible = True
                Me.RadBtn_JobCard_Complete.Visible = True
            Case 4 'ADMIN
                Me.RadBtn_Events_Open.Visible = True
                Me.RadBtn_Jobs_Open.Visible = True
                Me.RadBtn_Events_Open_Month.Visible = True
                Me.RadBtn_Service.Visible = True
                Me.RadBtn_Blank_JobCard.Visible = True
                Me.RadBtn_Blank_Plug.Visible = True
                Me.RadBtn_JobCard.Visible = True
                Me.RadBtn_Changeout_Report.Visible = True
                Me.RadBtn_Timesheet_Summary_Report.Visible = True
                Me.RadBtn_Event_Costing.Visible = True
                Me.RadBtn_Event_Costing_Event_Only.Visible = True
                Me.RadBtn_Component_Life.Visible = True
                Me.RadBtn_Event_MTBS.Visible = True
                Me.RadBtn_Service_Archive.Visible = True
                Me.RadBtn_JobCard_Complete.Visible = True
            Case 5 'SA
                Me.RadBtn_Events_Open.Visible = True
                Me.RadBtn_Jobs_Open.Visible = True
                Me.RadBtn_Events_Open_Month.Visible = True
                Me.RadBtn_Service.Visible = True
                Me.RadBtn_Blank_JobCard.Visible = True
                Me.RadBtn_Blank_Plug.Visible = True
                Me.RadBtn_JobCard.Visible = True
                Me.RadBtn_Changeout_Report.Visible = True
                Me.RadBtn_Timesheet_Summary_Report.Visible = True
                Me.RadBtn_Event_Costing.Visible = True
                Me.RadBtn_Event_Costing_Event_Only.Visible = True
                Me.RadBtn_Component_Life.Visible = True
                Me.RadBtn_Event_MTBS.Visible = True
                Me.RadBtn_Service_Archive.Visible = True
                Me.RadBtn_JobCard_Complete.Visible = True
            Case Else
                Me.RadBtn_Events_Open.Visible = False
                Me.RadBtn_Jobs_Open.Visible = False
                Me.RadBtn_Events_Open_Month.Visible = False
                Me.RadBtn_Service.Visible = False
                Me.RadBtn_Blank_JobCard.Visible = False
                Me.RadBtn_Blank_Plug.Visible = False
                Me.RadBtn_JobCard.Visible = False
                Me.RadBtn_Changeout_Report.Visible = False
                Me.RadBtn_Timesheet_Summary_Report.Visible = False
                Me.RadBtn_Event_Costing.Visible = False
                Me.RadBtn_Event_Costing_Event_Only.Visible = False
                Me.RadBtn_Component_Life.Visible = False
                Me.RadBtn_Event_MTBS.Visible = False
                Me.RadBtn_Service_Archive.Visible = False
                Me.RadBtn_JobCard_Complete.Visible = False
        End Select
    End Sub
    Sub HideItems()
        Me.RadBtn_Submit.Visible = False
        Me.RadCB_Site.ClearSelection()
        Me.lbl_EventType.Visible = False
        Me.RadCB_EventType.Visible = False
        Me.RadCB_EventType_Jobs.Visible = False
        Me.lbl_Site.Visible = False
        Me.RadCB_Site.Visible = False
        Me.lbl_From.Visible = False
        Me.RadDP_From.Visible = False
        Me.lbl_To.Visible = False
        Me.RadDP_To.Visible = False
        Me.lbl_EventID_2.Visible = False
        Me.lbl_JobID_2.Visible = False
        Me.RadTxt_EventID.Visible = False
        Me.RadTxt_JobID.Visible = False
        Me.lbl_Company.Visible = False
        Me.RadCB_Company.Visible = False
        Me.RadCB_Model_Company.Visible = False
        Me.lbl_Asset.Visible = False
        Me.RadCB_Asset.Visible = False
        Me.RadCB_Asset_Jobs.Visible = False
        Me.RadCB_Asset_Event_Plus.Visible = False
        Me.RadCB_Asset_MTBS.Visible = False
        Me.lbl_Model.Visible = False
        Me.RadCB_Model.Visible = False
        Me.lbl_Asset_Model.Visible = False
        Me.RadCB_Asset_Model.Visible = False
        Me.RadCB_Model_ECR.Visible = False
        Me.RadCB_Asset_Model_ECR.Visible = False
        Me.lbl_Level3.Visible = False
        Me.RadCB_Level3.Visible = False
        Me.lbl_Status.Visible = False
        Me.RadCB_Status.Visible = False
        lblPageName.Text = "Reports - " & lbl_Select.Text
        Me.lblParam1.Text = "N/A"
        Me.lblParam2.Text = "N/A"
        Me.lblParam3.Text = "N/A"
        Me.lblParam4.Text = "N/A"
        Me.lblParam5.Text = "N/A"
        Me.lblParam6.Text = "N/A"
    End Sub
    Protected Sub RadBtn_Reset_Click(sender As Object, e As EventArgs) Handles RadBtn_Reset.Click
        Me.lbl_Select.Text = ""
        Me.RadCB_Site.ClearSelection()
        Me.RadCB_EventType.ClearSelection()
        Me.RadCB_EventType_Jobs.ClearSelection()
        Me.RadCB_Company.ClearSelection()
        Me.RadCB_Model_Company.ClearSelection()
        Me.RadCB_Asset.ClearSelection()
        Me.RadCB_Asset_Jobs.ClearSelection()
        Me.RadCB_Asset_Event_Plus.ClearSelection()
        Me.RadCB_Asset_MTBS.ClearSelection()
        Me.RadCB_Model.ClearSelection()
        Me.RadCB_Asset_Model.ClearSelection()
        Me.RadCB_Model_ECR.ClearSelection()
        Me.RadCB_Asset_Model_ECR.ClearSelection()
        Me.RadDP_From.SelectedDate = Nothing
        Me.RadDP_To.SelectedDate = Nothing
        Me.RadTxt_EventID.Text = ""
        Me.RadTxt_JobID.Text = ""
        HideItems()
    End Sub
    Protected Sub RadBtn_Events_Open_Click(sender As Object, e As EventArgs) Handles RadBtn_Events_Open.Click
        Me.lbl_Select.Text = "Open Events"
        HideItems()
        Me.lbl_EventType.Visible = True
        Me.RadCB_EventType.Visible = True
        Me.lbl_Site.Visible = True
        Me.RadCB_Site.Visible = True
        Me.lbl_Status.Visible = True
        Me.RadCB_Status.Visible = True
    End Sub
    Protected Sub RadBtn_Jobs_Open_Click(sender As Object, e As EventArgs) Handles RadBtn_Jobs_Open.Click
        Me.lbl_Select.Text = "Open Jobs"
        HideItems()
        Me.lbl_EventType.Visible = True
        Me.RadCB_EventType_Jobs.Visible = True
        Me.lbl_Site.Visible = True
        Me.RadCB_Site.Visible = True
        Me.lbl_Asset.Visible = True
        Me.RadCB_Asset_Jobs.Visible = True
    End Sub
    Protected Sub RadBtn_Events_250_Click(sender As Object, e As EventArgs) Handles RadBtn_Events_250.Click
        Me.lbl_Select.Text = "Event + 250hrs"
        HideItems()
        Me.lbl_EventType.Visible = True
        Me.RadCB_EventType_Jobs.Visible = True
        Me.lbl_Site.Visible = True
        Me.RadCB_Site.Visible = True
        Me.lbl_Asset.Visible = True
        Me.RadCB_Asset_Event_Plus.Visible = True
    End Sub
    Protected Sub RadBtn_Service_Click(sender As Object, e As EventArgs) Handles RadBtn_Service.Click
        Me.lbl_Select.Text = "Service Report"
        HideItems()
        Me.lbl_Site.Visible = True
        Me.RadCB_Site.Visible = True
    End Sub
    Protected Sub RadBtn_Blank_Plug_Click(sender As Object, e As EventArgs) Handles RadBtn_Blank_Plug.Click
        Me.lbl_Select.Text = "Blank Magnetic Plug Report"
        HideItems()
        Me.lbl_Site.Visible = True
        Me.RadCB_Site.Visible = True
    End Sub
    Protected Sub RadBtn_Events_Open_Month_Click(sender As Object, e As EventArgs) Handles RadBtn_Events_Open_Month.Click
        Me.lbl_Select.Text = "Open Events (between dates)"
        HideItems()
        Me.lbl_EventType.Visible = True
        Me.RadCB_EventType.Visible = True
        Me.lbl_From.Visible = True
        Me.lbl_From.Text = "From:"
        Me.RadDP_From.Visible = True
        Me.lbl_To.Visible = True
        Me.lbl_To.Text = "To:"
        Me.RadDP_To.Visible = True
        Me.lbl_Status.Visible = True
        Me.RadCB_Status.Visible = True
    End Sub
    Protected Sub RadBtn_Changeout_Report_Click(sender As Object, e As EventArgs) Handles RadBtn_Changeout_Report.Click
        Me.lbl_Select.Text = "Estimated Changeout Report"
        HideItems()
        Me.lbl_From.Visible = True
        Me.lbl_From.Text = "From:"
        Me.RadDP_From.Visible = True
        Me.lbl_To.Visible = True
        Me.lbl_To.Text = "To:"
        Me.RadDP_To.Visible = True
        Me.lbl_Model.Visible = True
        Me.lbl_Asset_Model.Visible = True
        Me.RadCB_Asset_Model_ECR.Visible = True
        Me.RadCB_Model_ECR.Visible = True
        Me.lbl_Level3.Visible = True
        Me.RadCB_Level3.Visible = True
    End Sub
    Protected Sub RadBtn_JobCard_Click(sender As Object, e As EventArgs) Handles RadBtn_JobCard.Click
        Me.lbl_Select.Text = "Job Card"
        HideItems()
        Me.lbl_EventID_2.Visible = True
        Me.lbl_JobID_2.Visible = True
        Me.RadTxt_EventID.Visible = True
        Me.RadTxt_JobID.Visible = True
    End Sub
    Protected Sub RadBtn_JobCard_Complete_Click(sender As Object, e As EventArgs) Handles RadBtn_JobCard_Complete.Click
        Me.lbl_Select.Text = "Job Card (Complete)"
        HideItems()
        Me.lbl_EventID_2.Visible = True
        Me.lbl_JobID_2.Visible = True
        Me.RadTxt_EventID.Visible = True
        Me.RadTxt_JobID.Visible = True
    End Sub
    Protected Sub RadBtn_Timesheet_Summary_Report_Click(sender As Object, e As EventArgs) Handles RadBtn_Timesheet_Summary_Report.Click
        Me.lbl_Select.Text = "Timesheet Summary Report"
        HideItems()
        Me.lbl_Site.Visible = True
        Me.RadCB_Site.Visible = True
        Me.lbl_From.Visible = True
        Me.RadDP_From.Visible = True
        Me.lbl_To.Visible = True
        Me.RadDP_To.Visible = True
        Me.lbl_Asset.Visible = True
        Me.RadCB_Asset.Visible = True
    End Sub
    Protected Sub RadBtn_Event_Costing_Click(sender As Object, e As EventArgs) Handles RadBtn_Event_Costing.Click
        Me.lbl_Select.Text = "Event Costing"
        HideItems()
        Me.lbl_Site.Visible = True
        Me.RadCB_Site.Visible = True
        Me.lbl_From.Visible = True
        Me.lbl_From.Text = "From:"
        Me.RadDP_From.Visible = True
        Me.lbl_To.Visible = True
        Me.lbl_To.Text = "To:"
        Me.RadDP_To.Visible = True
        Me.lbl_EventID_2.Visible = True
        Me.RadTxt_EventID.Visible = True
        Me.lbl_Asset.Visible = True
        Me.RadCB_Asset.Visible = True
        If HF_EventID.Value = "" Then HF_EventID.Value = "%"
    End Sub
    Protected Sub RadBtn_Event_Costing_Event_Only_Click(sender As Object, e As EventArgs) Handles RadBtn_Event_Costing_Event_Only.Click
        Me.lbl_Select.Text = "Event Costing (Event Search Only)"
        HideItems()
        Me.lbl_EventID_2.Visible = True
        Me.RadTxt_EventID.Visible = True
        If HF_EventID.Value = "" Then HF_EventID.Value = "%"
    End Sub
    Protected Sub RadBtn_Component_Life_Click(sender As Object, e As EventArgs) Handles RadBtn_Component_Life.Click
        Me.lbl_Select.Text = "Component Changeout History"
        HideItems()
        Me.lbl_From.Visible = True
        Me.lbl_From.Text = "From:"
        Me.RadDP_From.Visible = True
        Me.lbl_To.Visible = True
        Me.lbl_To.Text = "To:"
        Me.RadDP_To.Visible = True
        Me.lbl_Model.Visible = True
        Me.RadCB_Model.Visible = True
        Me.lbl_Asset_Model.Visible = True
        Me.RadCB_Asset_Model.Visible = True
    End Sub
    Protected Sub RadBtn_Event_MTBS_Click(sender As Object, e As EventArgs) Handles RadBtn_Event_MTBS.Click
        Me.lbl_Select.Text = "Event MTBS"
        HideItems()
        Me.lbl_From.Visible = True
        Me.RadDP_From.Visible = True
        Me.lbl_To.Visible = True
        Me.RadDP_To.Visible = True
        Me.lbl_Asset.Visible = True
        Me.RadCB_Asset_MTBS.Visible = True
    End Sub
    Protected Sub RadBtn_Service_Archive_Click(sender As Object, e As EventArgs) Handles RadBtn_Service_Archive.Click
        Me.lbl_Select.Text = "Service Archive"
        HideItems()
        Me.lbl_Site.Visible = True
        Me.RadCB_Site.Visible = True
        Me.lbl_From.Visible = True
        Me.RadDP_From.Visible = True
        Me.lbl_To.Visible = True
        Me.RadDP_To.Visible = True
    End Sub
    Protected Sub RadBtn_Breakdown_Events_Click(sender As Object, e As EventArgs) Handles RadBtn_Breakdown_Events.Click
        Me.lbl_Select.Text = "Breakdown Events"
        HideItems()
        Me.lbl_Company.Visible = True
        Me.RadCB_Company.Visible = True
        Me.lbl_Site.Visible = True
        Me.RadCB_Site.Visible = True
        Me.lbl_Model.Visible = True
        Me.RadCB_Model_Company.Visible = True
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Select Case lbl_Select.Text
            Case "Open Events"
                Me.RadBtn_Submit.Visible = True
                Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
                Me.lblParam1.Text = RadCB_Site.Text
            Case "Open Jobs"
                Me.RadBtn_Submit.Visible = True
                Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
                Me.lblParam1.Text = RadCB_Site.Text
                Me.RadCB_EventType.SelectedValue = "%"
                Me.HF_ET_ID.Value = Me.RadCB_EventType.SelectedValue
                Me.lblParam3.Text = RadCB_EventType.Text
                Me.RadCB_EventType_Jobs.SelectedValue = "%"
                Me.HF_ET_ID.Value = Me.RadCB_EventType_Jobs.SelectedValue
                Me.lblParam3.Text = RadCB_EventType_Jobs.Text
                Me.RadCB_Asset_Jobs.SelectedValue = "%"
                Me.RadCB_Asset_Jobs.DataBind()
                Me.HF_A_ID.Value = Me.RadCB_Asset_Jobs.SelectedValue
                Me.lblParam4.Text = RadCB_Asset_Jobs.Text
            Case "Event + 250hrs"
                Me.RadBtn_Submit.Visible = True
                Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
                Me.lblParam1.Text = RadCB_Site.Text
                Me.RadCB_EventType.SelectedValue = "%"
                Me.HF_ET_ID.Value = Me.RadCB_EventType.SelectedValue
                Me.lblParam3.Text = RadCB_EventType.Text
                Me.RadCB_EventType_Jobs.SelectedValue = "%"
                Me.HF_ET_ID.Value = Me.RadCB_EventType_Jobs.SelectedValue
                Me.lblParam3.Text = RadCB_EventType_Jobs.Text
                Me.RadCB_Asset_Event_Plus.DataBind()
                Me.HF_A_ID.Value = Me.RadCB_Asset_Event_Plus.SelectedValue
                Me.lblParam4.Text = RadCB_Asset_Event_Plus.Text
            Case "Service Report"
                Me.RadBtn_Submit.Visible = True
                Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
                Me.lblParam1.Text = RadCB_Site.Text
            Case "Blank Magnetic Plug Report"
                Me.RadBtn_Submit.Visible = True
                Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
                Me.lblParam1.Text = RadCB_Site.Text
            Case "Timesheet Summary Report"
                Me.RadBtn_Submit.Visible = True
                Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
                Me.lblParam3.Text = RadCB_Site.Text
            Case "Event Costing"
                Me.RadBtn_Submit.Visible = True
                Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
                Me.lblParam3.Text = RadCB_Site.Text
            Case "Service Archive"
                Me.RadBtn_Submit.Visible = True
                Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
                Me.lblParam1.Text = RadCB_Site.Text
            Case "Breakdown Events"
                Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
                Me.lblParam1.Text = RadCB_Site.Text
        End Select
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Select Case lbl_Select.Text
            Case "Timesheet Summary Report"
                Me.RadBtn_Submit.Visible = True
                Me.HF_A_ID.Value = Me.RadCB_Asset.SelectedValue
                Me.lblParam4.Text = RadCB_Asset.Text
            Case "Event Costing"
                Me.RadBtn_Submit.Visible = True
                Me.HF_A_ID.Value = Me.RadCB_Asset.SelectedValue
                Me.lblParam4.Text = RadCB_Asset.Text
        End Select
    End Sub
    Protected Sub RadCB_Asset_MTBS_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset_MTBS.SelectedIndexChanged
        Select Case lbl_Select.Text
            Case "Event MTBS"
                Me.RadBtn_Submit.Visible = True
                Me.HF_A_ID.Value = Me.RadCB_Asset_MTBS.SelectedValue
                Me.lblParam3.Text = RadCB_Asset_MTBS.Text
        End Select
    End Sub
    Protected Sub RadCB_Model_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Model.SelectedIndexChanged
        Select Case lbl_Select.Text
            Case "Component Changeout History"
                Me.HF_MOD_ID.Value = Me.RadCB_Model.SelectedValue
                Me.lblParam3.Text = RadCB_Model.Text
                RadCB_Asset_Model.SelectedValue = "%"
                Me.RadCB_Asset_Model.DataBind()
                Me.HF_A_ID.Value = Me.RadCB_Asset_Model.SelectedValue
                'Me.lblParam4.Text = RadCB_Asset_Model.Text
                Me.lblParam4.Text = "*All Assets"
        End Select
    End Sub
    Protected Sub RadCB_Company_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Company.SelectedIndexChanged
        Select Case lbl_Select.Text
            Case "Breakdown Events"
                Me.HF_COM_ID.Value = Me.RadCB_Company.SelectedValue
                Me.lblParam2.Text = RadCB_Company.Text
                RadCB_Model_Company.SelectedValue = "%"
                Me.RadCB_Model_Company.DataBind()
                Me.HF_MOD_ID.Value = Me.RadCB_Model_Company.SelectedValue
                Me.lblParam3.Text = "*All Models"
                Me.RadBtn_Submit.Visible = True
        End Select
    End Sub
    Protected Sub RadCB_Asset_Model_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset_Model.SelectedIndexChanged
        Select Case lbl_Select.Text
            Case "Component Changeout History"
                Me.RadBtn_Submit.Visible = True
                Me.HF_A_ID.Value = Me.RadCB_Asset_Model.SelectedValue
                Me.lblParam4.Text = RadCB_Asset_Model.Text
        End Select
    End Sub
    Protected Sub RadCB_Asset_Jobs_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset_Jobs.SelectedIndexChanged
        Select Case lbl_Select.Text
            Case "Open Jobs"
                Me.RadBtn_Submit.Visible = True
                Me.HF_A_ID.Value = Me.RadCB_Asset_Jobs.SelectedValue
                Me.lblParam4.Text = RadCB_Asset_Jobs.Text
        End Select
    End Sub
    Protected Sub RadCB_Asset_Event_Plus_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset_Event_Plus.SelectedIndexChanged
        Select Case lbl_Select.Text
            Case "Event + 250hrs"
                Me.RadBtn_Submit.Visible = True
                Me.HF_A_ID.Value = Me.RadCB_Asset_Event_Plus.SelectedValue
                Me.lblParam4.Text = RadCB_Asset_Event_Plus.Text
        End Select
    End Sub
    Protected Sub RadCB_Asset_Model_ECR_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset_Model_ECR.SelectedIndexChanged
        Select Case lbl_Select.Text
            Case "Estimated Changeout Report"
                Me.RadBtn_Submit.Visible = True
                Me.HF_A_ID.Value = Me.RadCB_Asset_Model_ECR.SelectedValue
                Me.lblParam4.Text = RadCB_Asset_Model_ECR.Text
        End Select
    End Sub
    Protected Sub RadCB_EventType_Jobs_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_EventType_Jobs.SelectedIndexChanged
        Me.HF_ET_ID.Value = Me.RadCB_EventType_Jobs.SelectedValue
        Me.lblParam3.Text = RadCB_EventType_Jobs.Text
        Me.RadCB_Asset_Event_Plus.DataBind()
        Me.HF_A_ID.Value = Me.RadCB_Asset_Event_Plus.SelectedValue
        Me.lblParam4.Text = RadCB_Asset_Event_Plus.Text
    End Sub
    Protected Sub RadCB_EventType_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_EventType.SelectedIndexChanged
        Me.HF_ET_ID.Value = Me.RadCB_EventType.SelectedValue
        Me.lblParam3.Text = RadCB_EventType.Text
    End Sub
    Protected Sub RadCB_Model_ECR_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Model_ECR.SelectedIndexChanged
        Me.HF_MOD_ID.Value = Me.RadCB_Model_ECR.SelectedValue
        Me.lblParam3.Text = RadCB_Model_ECR.Text
        RadCB_Asset_Model_ECR.SelectedValue = "%"
        Me.RadCB_Asset_Model_ECR.DataBind()
        Me.HF_A_ID.Value = Me.RadCB_Asset_Model_ECR.SelectedValue
        Me.lblParam4.Text = RadCB_Asset_Model_ECR.Text
    End Sub
    Protected Sub RadCB_Model_Company_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Model_Company.SelectedIndexChanged
        Me.HF_MOD_ID.Value = Me.RadCB_Model_Company.SelectedValue
        Me.lblParam3.Text = RadCB_Model_Company.Text
        Me.RadBtn_Submit.Visible = True
    End Sub
    Protected Sub RadDP_From_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_From.SelectedDateChanged
        Dim ThisMonth As Date
        ThisMonth = RadDP_From.SelectedDate
        RadDP_To.SelectedDate = DateAdd(DateInterval.Month, 1, ThisMonth)
        Me.RadBtn_Submit.Visible = True
        Me.HF_From.Value = DateTime.Parse(RadDP_From.SelectedDate).ToString("yyyy-MM-dd")
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        Me.lblParam1.Text = Me.HF_From.Value
        Me.lblParam2.Text = Me.HF_To.Value
        Select Case lbl_Select.Text
            Case "Estimated Changeout Report"
                Me.HF_MOD_ID.Value = "%"
                Me.RadCB_Model_ECR.SelectedValue = "%"
                Me.HF_A_ID.Value = "%"
                Me.RadCB_Asset_Model_ECR.SelectedValue = "%"
                Me.HF_Level3.Value = "%"
                Me.RadCB_Level3.SelectedValue = "%"
                Me.lblParam3.Text = "*All Models"
                Me.lblParam4.Text = "*All Assets"
                Me.lblParam5.Text = "*All"
            Case "Component Changeout History"
                Me.lblParam3.Text = "*All Models"
                Me.lblParam4.Text = "*All Assets"
        End Select
    End Sub
    Protected Sub RadDP_To_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_To.SelectedDateChanged
        Me.RadBtn_Submit.Visible = True
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        Me.lblParam2.Text = Me.HF_To.Value
        Select Case lbl_Select.Text
            Case "Estimated Changeout Report"
                Me.HF_MOD_ID.Value = "%"
                Me.RadCB_Model_ECR.SelectedValue = "%"
                Me.HF_A_ID.Value = "%"
                Me.RadCB_Asset_Model_ECR.SelectedValue = "%"
                Me.HF_Level3.Value = "%"
                Me.RadCB_Level3.SelectedValue = "%"
                Me.lblParam3.Text = "*All Models"
                Me.lblParam4.Text = "*All Assets"
                Me.lblParam5.Text = "*All"
            Case "Component Changeout History"
                Me.lblParam3.Text = "*All Models"
                Me.lblParam4.Text = "*All Assets"
        End Select
    End Sub
    Protected Sub RadTxt_EventID_TextChanged(sender As Object, e As EventArgs) Handles RadTxt_EventID.TextChanged
        Me.HF_EventID.Value = RadTxt_EventID.Text
        Me.RadBtn_Submit.Visible = True
        Select Case lbl_Select.Text
            Case "Event Costing"
                If HF_EventID.Value = "" Then HF_EventID.Value = "%"
                Me.lblParam5.Text = Me.HF_EventID.Value
            Case "Event Costing (Event Search Only)"
                If HF_EventID.Value = "" Then HF_EventID.Value = "%"
                Me.lblParam1.Text = Me.HF_EventID.Value
            Case Else
                Me.lblParam1.Text = Me.HF_EventID.Value
        End Select
    End Sub
    Protected Sub RadTxt_JobID_TextChanged(sender As Object, e As EventArgs) Handles RadTxt_JobID.TextChanged
        Me.HF_JobID.Value = RadTxt_JobID.Text
        Me.RadBtn_Submit.Visible = True
        Me.lblParam2.Text = Me.HF_JobID.Value
    End Sub
    Protected Sub RadBtn_Submit_Click(sender As Object, e As EventArgs) Handles RadBtn_Submit.Click
        Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
    End Sub
    Protected Sub RadCB_Level3_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level3.SelectedIndexChanged
        Me.HF_Level3.Value = Me.RadCB_Level3.SelectedValue
        Me.lblParam5.Text = RadCB_Level3.Text
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        Me.HF_Status.Value = Me.RadCB_Status.SelectedValue
        Me.lblParam3.Text = RadCB_Status.Text
    End Sub
End Class