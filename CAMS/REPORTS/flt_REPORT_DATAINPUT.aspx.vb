﻿Imports System.Data
Imports System.Data.SqlClient
Partial Class CLIENT_flt_REPORT_DATAINPUT
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
        Dim FLT_Username As String = Request.QueryString("FLT_Username")
        If Request.QueryString("GUID") = "" Then
            OKtoContinue = False
        End If
        Session("Cancel") = Nothing
    End Sub
    Sub Apply_Permissions()
        Select Case HF_PQQ_Permission.Value
            Case 0 'OTHER
                Me.RadBtn_Litres_per_SMU.Visible = False
            Case 1 'GU
                Me.RadBtn_Litres_per_SMU.Visible = True
            Case 2 'MANAGER
                Me.RadBtn_Litres_per_SMU.Visible = True
            Case 3 'DIVISIONAL
                Me.RadBtn_Litres_per_SMU.Visible = True
            Case 4 'ADMIN
                Me.RadBtn_Litres_per_SMU.Visible = True
            Case 5 'SA
                Me.RadBtn_Litres_per_SMU.Visible = True
            Case Else
                Me.RadBtn_Litres_per_SMU.Visible = False
        End Select
    End Sub
    Protected Sub RadBtn_Litres_per_SMU_Click(sender As Object, e As EventArgs) Handles RadBtn_Litres_per_SMU.Click
        Me.RadBtn_Submit.Visible = False
        Me.RadCB_Site.ClearSelection()
        Me.lbl_Select.Text = "Litres per SMU"
        Me.lbl_Site.Visible = False
        Me.RadCB_Site.Visible = False
        Me.lbl_Asset.Visible = True
        Me.RadCB_Asset_Fuel.Visible = True
        Me.lbl_From.Visible = True
        Me.RadDP_From.Visible = True
        Me.lbl_To.Visible = True
        Me.RadDP_To.Visible = True
        lblPageName.Text = "Reports - " & lbl_Select.Text
        Me.lblParam1.Text = "N/A"
        Me.lblParam2.Text = "N/A"
        Me.lblParam3.Text = "N/A"
        Me.lblParam4.Text = "N/A"
        Me.lblParam5.Text = "N/A"
        Me.lblParam6.Text = "N/A"
    End Sub
    'Protected Sub RadCB_Site_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Site.SelectedIndexChanged
    '    Select Case lbl_Select.Text
    '        Case "Open Events"
    '            Me.RadBtn_Submit.Visible = True
    '            Me.HF_Site.Value = Me.RadCB_Site.SelectedValue
    '    End Select
    'Me.lblParam1.Text = RadCB_Site.Text
    'End Sub
    Protected Sub RadCB_Asset_Fuel_SelectedIndexChanged(sender As Object, e As Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs) Handles RadCB_Asset_Fuel.SelectedIndexChanged
        Me.RadBtn_Submit.Visible = True
        Me.HF_Asset_Fuel.Value = Me.RadCB_Asset_Fuel.SelectedValue
        Me.lblParam1.Text = RadCB_Asset_Fuel.Text
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
    End Sub
    Protected Sub RadDP_To_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDP_To.SelectedDateChanged
        Me.RadBtn_Submit.Visible = True
        Me.HF_To.Value = DateTime.Parse(RadDP_To.SelectedDate).ToString("yyyy-MM-dd")
        Me.lblParam2.Text = Me.HF_To.Value
    End Sub
    Protected Sub RadBtn_Submit_Click(sender As Object, e As EventArgs) Handles RadBtn_Submit.Click
        Me.SqlDS_PageCount.Select(DataSourceSelectArguments.Empty)
    End Sub
End Class