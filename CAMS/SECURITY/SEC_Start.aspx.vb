
Partial Class SECURITY_SEC_Start
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        'THIS PAGE SHOULD APPEAR IN THE ROOT OF YOUR SITE
        'AND IS THE SITE LAUNCH PAGE
        'SET THESE VALUES TO IDENTIFY THIS APPLICATION

        Dim Client_APP_Name As String = "CAMS"
        Dim Client_APP_ID As Integer = 133

        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        If Not IsPostBack Then

            Dim Qry As New Banks_Security.Security

            'Set ConnectionString
            Qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ICT_CENTRALConnectionString").ConnectionString

            'Get Employee_Name and IP_Address
            If HttpContext.Current.Request.IsLocal Then
                Qry.Employee_Name = "Jonathan Snaith"
            Else
                Qry.Employee_Name = User.Identity.Name
            End If
            Qry.IP_Address = Request.UserHostAddress
            Qry.Application_ID = Client_APP_ID
            Qry.Execute_Set_Session()

            '
            Dim Session_ID As Integer = Qry.Session_ID
            'Session("Session_ID") = Session_ID

            Dim Employee_Name As String = Qry.Employee_Name

            'System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "alert('" & Session_ID & "');", True)
            If Session_ID = Nothing Then
                Response.Redirect("~/SECURITY/SEC_Denied.aspx?Employee_Name=" & Employee_Name & "&Application_Name=Employee Validation" & "&Title=ACCESS DENIED" & "&Status=Employee name has not been validated.")
            Else
                Response.Redirect("~/SECURITY/SEC_Redirect.aspx?Session_ID=" & Session_ID & "&Employee_Name=" & Employee_Name & "&Client_APP_ID=" & Client_APP_ID & "&Client_APP_Name=" & Client_APP_Name)
            End If

        End If
    End Sub
End Class
