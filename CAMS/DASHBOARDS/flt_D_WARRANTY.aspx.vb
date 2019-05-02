Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient
Partial Class DASHBOARDS_flt_D_WARRANTY
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        RadCB_Model.SelectedValue = "%"
        RadCB_Asset.SelectedValue = "%"
        RadCB_Level3.SelectedValue = "%"
        RadCB_Status.SelectedValue = "%"
        Me.lbl_Asset.Text = "%"
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
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Dashboards - Warranty"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
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
                        Case "Calculate"
                            Dim valuePassed As String = eventArgument
                            'Me.CalculateSheet()
                        Case "Show_Buttons"
                            Dim valuepassed As String = eventArgument
                            'ShowPage1_Buttons(valuepassed)
                        Case "Refresh_Combo"
                            Dim valuepassed As String = eventArgument
                        Case "Refresh_Grid"
                            Dim valuepassed As String = eventArgument
                            Me.RadGrid_PLANNING.Rebind()
                            Me.RadGrid_PLANNING_HOURS.Rebind()
                            WhichRowSelected()
                            SelectCorrectRecord()
                            WhichRowSelectedHrs()
                            SelectCorrectRecordHrs()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub WhichRowSelected()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_PLANNING.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("STM_ID").Text)
            count = count + 1
            If item.Selected Then
                lbl_Test.Text = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecord()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_PLANNING.Items
            Dim EventIDCell As TableCell = item("STM_ID")
            Dim EventID = EventIDCell.Text
            count = count + 1
            If Session("STM_ID") = "null" Then Session("STM_ID") = "0"

            If Session("STM_ID") = EventID Then
                item.Selected = True
            End If
        Next
    End Sub
    Sub WhichRowSelectedHrs()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_PLANNING_HOURS.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("STM_ID").Text)
            count = count + 1
            If item.Selected Then
                lbl_Test.Text = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecordHrs()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_PLANNING_HOURS.Items
            Dim EventIDCell As TableCell = item("STM_ID")
            Dim EventID = EventIDCell.Text
            count = count + 1
            If Session("STM_ID") = "null" Then Session("STM_ID") = "0"

            If Session("STM_ID") = EventID Then
                item.Selected = True
            End If
        Next
    End Sub
    Protected Sub RadCB_Asset_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset.SelectedIndexChanged
        Me.HF_A_ID.Value = RadCB_Asset.SelectedValue
        Dim abc As String = RadCB_Asset.SelectedValue
        Me.lbl_Asset.Text = abc
        RadCB_Level3.SelectedValue = "%"
        RadCB_Status.SelectedValue = "%"
        RadGrid_PLANNING.DataBind()
        RadGrid_PLANNING_HOURS.DataBind()
    End Sub
    Protected Sub RadCB_Model_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Model.SelectedIndexChanged
        Me.HF_MOD_ID.Value = RadCB_Model.SelectedValue
        RadCB_Asset.SelectedValue = "%"
        RadCB_Level3.SelectedValue = "%"
        RadCB_Status.SelectedValue = "%"
        RadGrid_PLANNING.DataBind()
        RadGrid_PLANNING_HOURS.DataBind()
    End Sub
    Protected Sub RadCB_Level3_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Level3.SelectedIndexChanged
        Me.HF_Level3.Value = RadCB_Level3.SelectedValue
        RadCB_Status.SelectedValue = "%"
        RadGrid_PLANNING.DataBind()
        RadGrid_PLANNING_HOURS.DataBind()
    End Sub
    Protected Sub RadGrid_Planning_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_PLANNING.ItemDataBound
        For Each item As GridDataItem In RadGrid_PLANNING.Items
            Dim myTotalCell2 As TableCell = item("STM_SMU_Value")
            Dim ThisTotal2 = myTotalCell2.Text
            Dim myTotalCell5 As TableCell = item("STMC_Warranty_Expiry_Date")
            Dim ThisTotal5 = myTotalCell5.Text
            If InStr(myTotalCell5.Text, "&nbsp;") Then
            Else
                If ThisTotal5 <= DateAdd(DateInterval.Month, 1, Date.Now) Then
                    item.BackColor = Drawing.Color.Orange
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal5 < Date.Now Then
                    item.BackColor = Drawing.Color.Red
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
        Next
    End Sub
    Protected Sub RadGrid_Planning_Hours_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid_PLANNING_HOURS.ItemDataBound
        For Each item As GridDataItem In RadGrid_PLANNING_HOURS.Items
            Dim myTotalCell2 As TableCell = item("STM_SMU_Value")
            Dim ThisTotal2 = myTotalCell2.Text
            Dim myTotalCell4 As TableCell = item("STMC_Warranty_Expiry_Hours")
            Dim ThisTotal4 = myTotalCell4.Text
            If InStr(ThisTotal4, "&nbsp;") Then
                ThisTotal4 = 0
            End If
            If InStr(myTotalCell2.Text, "&nbsp;") Then
            Else
                If ThisTotal2 >= (CInt(ThisTotal4) - 250) Then
                    item.BackColor = Drawing.Color.Orange
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
                If ThisTotal2 >= CInt(ThisTotal4) Then
                    item.BackColor = Drawing.Color.Red
                    item.ForeColor = Drawing.Color.Black
                Else
                End If
            End If
        Next
    End Sub
    Protected Sub btn_Refresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_Refresh.Click
        RadCB_Model.SelectedValue = "%"
        RadCB_Asset.SelectedValue = "%"
        Me.lbl_Asset.Text = "%"
        RadCB_Level3.SelectedValue = "%"
        RadCB_Status.SelectedValue = "%"
        Me.DateFrom.SelectedDate = Nothing
        Me.DateTo.SelectedDate = Nothing
        Me.HF_A_ID.Value = "%"
        Me.HF_MOD_ID.Value = "%"
        Me.HF_Level3.Value = "%"
        Me.HF_From.Value = "1900-01-01"
        Me.HF_To.Value = "2100-01-01"
        Me.RadGrid_PLANNING.Rebind()
        Me.RadGrid_PLANNING_HOURS.Rebind()
        'Me.Radbtn_Export.Visible = False
    End Sub
    Protected Sub DateFrom_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles DateFrom.SelectedDateChanged
        Me.HF_From.Value = DateFrom.SelectedDate.ToString()
        Dim ThisMonth As Date
        ThisMonth = DateFrom.SelectedDate
        Me.HF_From.Value = DateTime.Parse(DateFrom.SelectedDate).ToString("yyyy-MM-dd")
        DateTo.SelectedDate = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        Me.HF_To.Value = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        Me.HF_To.Value = DateTime.Parse(DateTo.SelectedDate).ToString("yyyy-MM-dd")
        RadGrid_PLANNING.Rebind()
        'Me.Radbtn_Export.Visible = True
    End Sub
    Protected Sub DateTo_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles DateTo.SelectedDateChanged
        HF_To.Value = DateTo.SelectedDate.ToString()
        Me.HF_To.Value = DateTime.Parse(DateTo.SelectedDate).ToString("yyyy-MM-dd")
        'Me.Radbtn_Export.Visible = True
    End Sub
End Class