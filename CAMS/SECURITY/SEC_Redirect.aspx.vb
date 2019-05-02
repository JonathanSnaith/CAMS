Imports System.Data
Partial Class SECURITY_SEC_Redirect
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)
        Dim SESSION_ID As Integer = Request.QueryString("SESSION_ID")
        Dim Employee_Name As String = Request.QueryString("Employee_Name")
        Dim Client_APP_ID As Integer = Request.QueryString("Client_APP_ID")
        Dim Client_APP_Name As String = Request.QueryString("Client_APP_Name")
        Dim URLLink As String
        Dim EMPLOYEE_ID As Integer
        If Not IsPostBack Then
            Dim Qry As New Banks_Security.Security
            '--- Set ConnectionString
            Qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ICT_CENTRALConnectionString").ConnectionString
            '--- 
            Dim mReturnPermissions As Banks_Security.Security.ReturnPermission
            Qry.Session_ID = SESSION_ID         'The current validated session
            Qry.Application_ID = Client_APP_ID  'The calling application
            mReturnPermissions = Qry.Execute_Return_Permissions()
            EMPLOYEE_ID = mReturnPermissions.EMPLOYEE_ID
            '---
            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            'YOUR REDIRECT SCENARIOS STARTS HERE
            Dim Qry1 As New Banks_Security.Security
            Qry1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ICT_CENTRALConnectionString").ConnectionString
            '--- 
            Dim mExceptions As DataTable
            Qry1.Session_ID = SESSION_ID
            Qry1.Application_ID = Client_APP_ID
            Qry1.Execute_Get_Exceptions()
            mExceptions = Qry1.Exceptions
            '
            Dim Access_Level As Integer = 0
            Dim dr As DataRow
            For Each dr In mExceptions.Rows
                'Fields available : APPLICATION_ID, EMPLOYEE_ID, Is_Exception, EXCEPTION_ID, PERMISSION_ID, Value, SESSION_ID, Fullname, Application_Title
                If dr("APPLICATION_ID").ToString() = Client_APP_ID Then

                    If dr("id").ToString() = 23 Then
                        Access_Level = 1
                    End If
                End If
            Next

            Select Case mReturnPermissions.Value
                Case 0  'Other
                    URLLink = "~/CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=" & SESSION_ID & "&CLIENT_APP_ID=" & Client_APP_ID
                Case 1  'General User
                    URLLink = "~/CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=" & SESSION_ID & "&CLIENT_APP_ID=" & Client_APP_ID
                Case 2  'Manager
                    URLLink = "~/CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=" & SESSION_ID & "&CLIENT_APP_ID=" & Client_APP_ID
                Case 3  'Divisional
                    URLLink = "~/CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=" & SESSION_ID & "&CLIENT_APP_ID=" & Client_APP_ID
                Case 4  'Admin
                    URLLink = "~/CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=" & SESSION_ID & "&CLIENT_APP_ID=" & Client_APP_ID
                Case 5  'SA
                    URLLink = "~/CLIENT/flt_MAIN_HOME.aspx?FLT_GUID=" & SESSION_ID & "&CLIENT_APP_ID=" & Client_APP_ID
                Case Else
                    URLLink = ""
            End Select
            'URLLink = "~/CLIENT/HELLO.aspx" 
            'YOUR REDIRECT SCENARIOS END HERE
            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            If Len(URLLink) > 10 Then
                Response.Redirect(URLLink)
            Else
                Response.Redirect("~/SECURITY/SEC_Denied.aspx?Employee_Name=" & Employee_Name & "&Application_Name=" & Client_APP_Name & "&Title=PERMISSION DENIED" & "&Status=No application permissions found.")
            End If
        End If
    End Sub
End Class
