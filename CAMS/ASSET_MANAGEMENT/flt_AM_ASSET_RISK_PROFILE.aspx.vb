Imports System.Data
Imports Telerik.Web.UI
Partial Class ASSET_MANAGEMENT_flt_AM_ASSET_RISK_PROFILE
    Inherits System.Web.UI.Page
    Private Sub DATA_INPUT_FUEL_flt_FUEL_INPUT_Init(sender As Object, e As EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        'Dim SESSION_ID As Integer = Request.QueryString("FLT_GUID")
        'Dim CLIENT_APP_ID As Integer = Request.QueryString("CLIENT_APP_ID")
        'Get_Session_Info(SESSION_ID, 133)
        RadCB_Site.SelectedValue = "%"
        Me.RadCB_Years.ClearSelection()
        'Me.RadGrid1.DataBind()
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
        Me.lblGUID.Text = Request.QueryString("FLT_GUID")
        Me.lblPreviousPage.Text = Request.QueryString("PreviousPage")
        Dim Setup As New SMUSetup
        'Get_Session_Info()
        Me.ClientScript.GetPostBackEventReference(Me, String.Empty)
        If Not Me.IsPostBack Then
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
                        Case "FindCurrentRecord"
                            Dim valuepassed As String = eventArgument
                        Case Else
                    End Select
                End If
            End If
        End If
        If Me.lblRun.Text = "" Then
            Me.lblRun.Text = "1"
            lblPageName.Text = "Asset Management - Asset Risk Profile"
            Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
        Else
        End If
    End Sub
    Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
        Me.RadCB_Years.ClearSelection()
        RadGrid1.DataBind()
    End Sub
    Protected Sub RadBtn_Reset_Click(sender As Object, e As EventArgs) Handles RadBtn_Reset.Click
        Me.RadCB_Site.SelectedValue = "%"
        Me.RadCB_Years.ClearSelection()
        RadGrid1.DataBind()
    End Sub
    'Protected Sub RadCB_Years_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Years.SelectedIndexChanged
    '    RadGrid1.DataBind()
    'End Sub
    Private Sub RadGrid1_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid1.ItemDataBound
        For Each item As GridDataItem In RadGrid1.Items
            Dim ExpLife As TableCell = item("Expected Life")
            Dim ThisExpLife = ExpLife.Text
            Dim MechRisk As TableCell = item("Mechanical Risk")
            MechRisk.HorizontalAlign = HorizontalAlign.Center
            Dim ThisMechRisk = MechRisk.Text
            Dim ProdRisk As TableCell = item("Production Risk")
            ProdRisk.HorizontalAlign = HorizontalAlign.Center
            Dim ThisProdRisk = ProdRisk.Text
            Dim ThisYear As Int32
            ThisYear = Date.Today.Year
            Dim Y0 As TableCell = item("Latest SMU")
            Dim ThisY0 = Y0.Text
            If CDec(ThisExpLife) < CDec(ThisY0) Then
                Y0.ForeColor = Drawing.Color.Red
            End If
            Dim Y1 As TableCell = item("FY" + CStr(ThisYear))
            Dim ThisY1 = Y1.Text
            If CDec(ThisExpLife) < CDec(ThisY1) Then
                Y1.ForeColor = Drawing.Color.Red
            End If
            If RadCB_Years.SelectedValue > 1 Then
                Dim Y2 As TableCell = item("FY" + CStr(ThisYear + 1))
                Dim ThisY2 = Y2.Text
                If CDec(ThisExpLife) < CDec(ThisY2) Then
                    Y2.ForeColor = Drawing.Color.Red

                End If
            End If
            If RadCB_Years.SelectedValue > 2 Then
                Dim Y3 As TableCell = item("FY" + CStr(ThisYear + 2))
                Dim ThisY3 = Y3.Text
                If CDec(ThisExpLife) < CDec(ThisY3) Then
                    Y3.ForeColor = Drawing.Color.Red
                End If
            End If
            If RadCB_Years.SelectedValue > 3 Then
                Dim Y4 As TableCell = item("FY" + CStr(ThisYear + 3))
                Dim ThisY4 = Y4.Text
                If CDec(ThisExpLife) < CDec(ThisY4) Then
                    Y4.ForeColor = Drawing.Color.Red
                End If
            End If
            If RadCB_Years.SelectedValue > 4 Then
                Dim Y5 As TableCell = item("FY" + CStr(ThisYear + 4))
                Dim ThisY5 = Y5.Text
                If CDec(ThisExpLife) < CDec(ThisY5) Then
                    Y5.ForeColor = Drawing.Color.Red
                End If
            End If
            If RadCB_Years.SelectedValue > 5 Then
                Dim Y6 As TableCell = item("FY" + CStr(ThisYear + 5))
                Dim ThisY6 = Y6.Text
                If CDec(ThisExpLife) < CDec(ThisY6) Then
                    Y6.ForeColor = Drawing.Color.Red
                End If
            End If
            If RadCB_Years.SelectedValue > 6 Then
                Dim Y7 As TableCell = item("FY" + CStr(ThisYear + 6))
                Dim ThisY7 = Y7.Text
                If CDec(ThisExpLife) < CDec(ThisY7) Then
                    Y7.ForeColor = Drawing.Color.Red
                End If
            End If
            If RadCB_Years.SelectedValue > 7 Then
                Dim Y8 As TableCell = item("FY" + CStr(ThisYear + 7))
                Dim ThisY8 = Y8.Text
                If CDec(ThisExpLife) < CDec(ThisY8) Then
                    Y8.ForeColor = Drawing.Color.Red
                End If
            End If
            If RadCB_Years.SelectedValue > 8 Then
                Dim Y9 As TableCell = item("FY" + CStr(ThisYear + 8))
                Dim ThisY9 = Y9.Text
                If CDec(ThisExpLife) < CDec(ThisY9) Then
                    Y9.ForeColor = Drawing.Color.Red
                End If
            End If
            If RadCB_Years.SelectedValue > 9 Then
                Dim Y10 As TableCell = item("FY" + CStr(ThisYear + 9))
                Dim ThisY10 = Y10.Text
                If CDec(ThisExpLife) < CDec(ThisY10) Then
                    Y10.ForeColor = Drawing.Color.Red
                End If
            End If
            Select Case ThisMechRisk
                Case 0
                    MechRisk.BackColor = Drawing.Color.Green
                    MechRisk.ForeColor = Drawing.Color.White
                Case 1
                    MechRisk.BackColor = Drawing.Color.FromName("#54BA2C")
                Case 2
                    MechRisk.BackColor = Drawing.Color.FromName("#83BA2C")
                Case 3
                    MechRisk.BackColor = Drawing.Color.FromName("#EDCC38")
                Case 4
                    MechRisk.BackColor = Drawing.Color.FromName("#FC7F3C")
                Case 5
                    MechRisk.BackColor = Drawing.Color.FromName("#FC3C3C")
                Case Else
                    MechRisk.BackColor = Drawing.Color.LightGray
            End Select
            Select Case ThisProdRisk
                Case 0
                    ProdRisk.BackColor = Drawing.Color.Green
                    ProdRisk.ForeColor = Drawing.Color.White
                Case 1
                    ProdRisk.BackColor = Drawing.Color.FromName("#54BA2C")
                Case 2
                    ProdRisk.BackColor = Drawing.Color.FromName("#83BA2C")
                Case 3
                    ProdRisk.BackColor = Drawing.Color.FromName("#EDCC38")
                Case 4
                    ProdRisk.BackColor = Drawing.Color.FromName("#FC7F3C")
                Case 5
                    ProdRisk.BackColor = Drawing.Color.FromName("#FC3C3C")
                Case Else
                    ProdRisk.BackColor = Drawing.Color.LightGray
            End Select
        Next
    End Sub
End Class
