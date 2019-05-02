Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class EVENT_MANAGEMENT_flt_EM_FITTERS_TIMESHEETS
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
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadCB_Status.SelectedValue = "Open"
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
        If HF_PageCount.Value = 0 Then
            HF_PageCount.Value = 1
            HF_PageName.Value = "EM - Timesheets"
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
            Setup_Engineers_Combo()
            Setup_FTStatus_Combo()
            GetFTEM(-1, -1, -1, -1, "Open", "", "")
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
                        Case "Refresh_Combo"
                            Dim valuepassed As String = eventArgument
                        Case "Refresh_Grid_Combo"
                            Dim valuepassed As String = eventArgument
                            GetFTEM(-1, -1, -1, -1, "Open", "", "")
                            Me.RadGrid_Active_FT.Rebind()
                            WhichRowSelectedFT()
                            SelectCorrectRecordFT()
                        Case Else
                    End Select
                End If
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
#Region "Internal Methods"
    Private Sub Setup_Customer_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Customer = Setup.Populate_CustomerNames_EventManagement(RadCB_Customer, True, 4)
    End Sub
    Private Sub Setup_Site_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Site = Setup.Populate_SiteNames_EventManagement(RadCB_Site, RadCB_Customer.SelectedValue, True, 4)
    End Sub
    Private Sub Setup_Asset_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Asset = Setup.Populate_AssetNames_EventManagement(RadCB_Asset, RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, True, 4)
    End Sub
    Private Sub Setup_Engineers_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Engineer = Setup.Populate_Engineers_EventManagement(RadCB_Engineer, RadCB_Asset.SelectedValue, RadCB_Site.SelectedValue, True, 4)
    End Sub
    Private Sub Setup_FTStatus_Combo()
        Dim Setup As New Setup.Combo
        RadCB_Status = Setup.Populate_Status_FT_EventManagement(RadCB_Status)
    End Sub
    Private Sub GetFTEM(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal A_ID As Integer, ByVal PER_EMP_ID As Integer, ByVal FT_Status As String, ByVal E_ID As String, ByVal J_ID As String)
        Dim qry As New Database.Queries
        qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
        Dim ds1 As DataSet = qry.GetFTEM(CUS_ID, SITE_ID, A_ID, PER_EMP_ID, FT_Status, E_ID, J_ID)
        Dim dtMain1 As DataTable
        dtMain1 = ds1.Tables(0)
        RadGrid_Active_FT.DataSource = dtMain1
        RadGrid_Active_FT.DataBind()
    End Sub
#End Region
    Protected Sub btn_Refresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Refresh.Click
        Me.RadCB_Customer.SelectedValue = -1
        Me.RadCB_Site.SelectedValue = -1
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadCB_Status.SelectedValue = "Open"
        Me.RadTxt_Number.Text = ""
        Me.RadTxt_JobNumber.Text = ""
        Me.RadGrid_Active_FT.DataBind()

        Setup_Customer_Combo()
        Setup_Site_Combo()
        Setup_Asset_Combo()
        Setup_Engineers_Combo()
        Setup_FTStatus_Combo()
        GetFTEM(-1, -1, -1, -1, "Open", "", "")
    End Sub
    Protected Sub RadCB_Customer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Customer.SelectedIndexChanged
        Me.RadCB_Site.SelectedValue = -1
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadCB_Status.SelectedValue = "Open"
        Me.RadTxt_Number.Text = ""
        Me.RadTxt_JobNumber.Text = ""

        Setup_Site_Combo()
        Setup_Asset_Combo()
        Setup_Engineers_Combo()
        GetFTEM(RadCB_Customer.SelectedValue, -1, -1, -1, "Open", "", "")
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadCB_Status.SelectedValue = "Open"
        Me.RadTxt_Number.Text = ""
        Me.RadTxt_JobNumber.Text = ""
        Me.HF_Site.Value = RadCB_Site.SelectedValue

        Setup_Asset_Combo()
        Setup_Engineers_Combo()
        GetFTEM(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, -1, -1, "Open", "", "")
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadCB_Status.SelectedValue = "Open"
        Me.RadTxt_Number.Text = ""
        Me.RadTxt_JobNumber.Text = ""

        Setup_Engineers_Combo()
        GetFTEM(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadCB_Asset.SelectedValue, -1, "Open", "", "")
    End Sub
    Protected Sub RadCB_Engineer_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Engineer.SelectedIndexChanged
        Me.RadCB_Status.SelectedValue = "Open"
        Me.RadTxt_Number.Text = ""
        Me.RadTxt_JobNumber.Text = ""
        Me.HF_Engineer.Value = RadCB_Engineer.SelectedValue

        GetFTEM(RadCB_Customer.SelectedValue, RadCB_Site.SelectedValue, RadCB_Asset.SelectedValue, RadCB_Engineer.SelectedValue, "Open", "", "")
    End Sub
    Protected Sub RadCB_Status_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Status.SelectedIndexChanged
        Me.RadTxt_Number.Text = ""
        Me.RadTxt_JobNumber.Text = ""
        GetFTEM(-1, -1, -1, -1, RadCB_Status.SelectedValue, "", "")
    End Sub
    Protected Sub RadTxt_Number_TextChanged(sender As Object, e As System.EventArgs) Handles RadTxt_Number.TextChanged
        Me.RadCB_Customer.SelectedValue = -1
        Me.RadCB_Site.SelectedValue = -1
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadCB_Status.SelectedValue = -1
        Me.RadTxt_JobNumber.Text = ""
        GetFTEM(-1, -1, -1, -1, "Open", RadTxt_Number.Text, "")
    End Sub
    Protected Sub RadTxt_JobNumber_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadTxt_JobNumber.TextChanged
        Me.RadCB_Customer.SelectedValue = -1
        Me.RadCB_Site.SelectedValue = -1
        Me.RadCB_Asset.SelectedValue = -1
        Me.RadCB_Engineer.SelectedValue = -1
        Me.RadCB_Status.SelectedValue = -1
        Me.RadTxt_Number.Text = ""
        GetFTEM(-1, -1, -1, -1, "Open", "", RadTxt_JobNumber.Text)
    End Sub
    Sub GridFormatting()
        For Each item As GridDataItem In RadGrid_Active_FT.Items
            Dim myTotalCell4 As TableCell = item("FT_Status")
            Dim ThisTotal4 = myTotalCell4.Text
            Dim myTotalCell5 As TableCell = item("J_Status")
            Dim ThisTotal5 = myTotalCell5.Text
            Dim TimeDiff As TableCell = item("J_Time_Diff")
            Dim TimeDiffMins As TableCell = item("J_Time_Diff_Minutes")
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
            If item.OwnerTableView.Name = "Timesheets" Then
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
            End If
            Select Case TimeDiffMinsText
                Case <= 0
                    TimeDiff.ForeColor = Drawing.Color.FromName("#9bd562")
                    TimeDiff.Font.Bold = True
                Case > 0
                    TimeDiff.ForeColor = Drawing.Color.Tomato
                    TimeDiff.Font.Bold = True
            End Select
            If ThisTotal4 = "Open" And ThisTotal5 = "Complete" Then
                item.BackColor = Drawing.Color.FromName("#FF4848")
                item.ForeColor = Drawing.Color.Black
            End If
        Next
    End Sub
    Protected Sub RadGrid_Active_FT_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_Active_FT.ItemDataBound
        GridFormatting()

    End Sub

    Private Sub RadGrid_Active_FT_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadGrid_Active_FT.SelectedIndexChanged
        GridFormatting()
    End Sub
End Class