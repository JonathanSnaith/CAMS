
Partial Class SECURITY_SEC_Denied
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        If Request.QueryString("Title") = "" Then
            Me.lblTitle.Text = "Unkown Title"
        Else
            Me.lblTitle.Text = Request.QueryString("Title")
        End If

        Me.lblApplication_Name.Text = "Employee Validation"

        If Request.QueryString("Application_Name") = "" Then
            Me.lblApplication_Name.Text = "Employee Validation"
        Else
            Me.lblApplication_Name.Text = Request.QueryString("Application_Name")
        End If

        If Request.QueryString("Employee_Name") = "" Then
            Me.lblEmployee_Name.Text = "UNKNOWN NAME"
        Else
            Me.lblEmployee_Name.Text = Request.QueryString("Employee_Name")
        End If

        If Request.QueryString("Status") = "" Then
            Me.lblStatus.Text = "Unknown Status"
        Else
            Me.lblStatus.Text = Request.QueryString("Status")
        End If
    End Sub
End Class
