Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Partial Class ASSET_MANAGEMENT_flt_AM_ASSET_MOVEMENTS
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        Get_Session_Info(SESSION_ID, 18)
        Me.RadCB_Asset.SelectedValue = "%"
        Me.RadDP_From.SelectedDate = DateAdd(DateInterval.Month, -6, Today)
        Me.RadDP_To.SelectedDate = Today
        Me.HF_From.Value = RadDP_From.SelectedDate.ToString()
        Dim ThisMonth As Date
        ThisMonth = RadDP_From.SelectedDate
        Me.HF_From.Value = DateAdd(DateInterval.Month, -6, ThisMonth).ToString()
        Me.HF_From.Value = DateTime.Parse(RadDP_From.SelectedDate).ToString("yyyy-MM-dd")
        Me.HF_To.Value = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
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
                                Select Case dr("EXCEPTION_ID").ToString()
                                    Case 73
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_2_R.Value = 1 'Asset Management - R
                                        End If
                                    Case 85
                                        If dr("Value") = Nothing Then
                                        Else
                                            Me.HF_EXCEPTION_2_RW.Value = 1 'Asset Management - RW
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
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "AM - Asset Movements"
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
                            Me.RadGrid_Asset_Movements.Rebind()
                            Me.RadGrid_Asset_Movements_Requests.Rebind()
                            WhichRowSelected()
                            SelectCorrectRecord()
                            WhichRowSelectedReq()
                            SelectCorrectRecordReq()
                        Case Else
                    End Select
                End If
            End If
        End If
    End Sub
    Sub WhichRowSelected()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Asset_Movements.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("AM_ID").Text)
            count = count + 1
            If item.Selected Then
                lbl_Test.Text = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecord()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Asset_Movements.Items
            Dim EventIDCell As TableCell = item("AM_ID")
            Dim EventID = EventIDCell.Text
            count = count + 1
            If Session("AM_ID") = "null" Then Session("AM_ID") = "0"

            If Session("AM_ID") = EventID Then
                item.Selected = True
            End If
        Next
    End Sub
    Sub WhichRowSelectedReq()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Asset_Movements_Requests.Items
            Dim intCategoryID As Integer = Convert.ToInt32(item("AM_ID").Text)
            count = count + 1
            If item.Selected Then
                lbl_Test.Text = count
            End If
        Next
    End Sub
    Sub SelectCorrectRecordReq()
        Dim count As Integer = 0
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid_Asset_Movements_Requests.Items
            Dim EventIDCell As TableCell = item("AM_ID")
            Dim EventID = EventIDCell.Text
            count = count + 1
            If Session("AM_ID") = "null" Then Session("AM_ID") = "0"

            If Session("AM_ID") = EventID Then
                item.Selected = True
            End If
        Next
    End Sub
    Protected Sub DateFrom_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDP_From.SelectedDateChanged
        Me.HF_From.Value = RadDP_From.SelectedDate.ToString()
        Dim ThisMonth As Date
        ThisMonth = RadDP_From.SelectedDate
        Me.HF_From.Value = DateTime.Parse(RadDP_From.SelectedDate).ToString("yyyy-MM-dd")
        RadDP_To.SelectedDate = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        Me.HF_To.Value = DateAdd(DateInterval.Month, 1, ThisMonth).ToString()
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        RadGrid_Asset_Movements.Rebind()
        RadGrid_Asset_Movements_Requests.Rebind()
        'Me.Radbtn_Export.Visible = True
    End Sub
    Protected Sub DateTo_SelectedDateChanged(sender As Object, e As Calendar.SelectedDateChangedEventArgs) Handles RadDP_To.SelectedDateChanged
        HF_To.Value = RadDP_To.SelectedDate.ToString()
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        'Me.Radbtn_Export.Visible = True
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 1
                If HF_EXCEPTION_2_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
                Me.T2.Visible = True
            Case 3
                If HF_EXCEPTION_2_RW.Value = 1 Then
                    Me.T1.Visible = True
                Else
                    Me.T1.Visible = False
                End If
                Me.T2.Visible = True
            Case 4
                Me.T1.Visible = True
                Me.T2.Visible = True
            Case 5
                Me.T1.Visible = True
                Me.T2.Visible = True
            Case Else
                Me.T1.Visible = False
                Me.T2.Visible = False
        End Select
    End Sub
End Class