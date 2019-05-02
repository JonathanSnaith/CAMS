
Partial Class Start
    Inherits System.Web.UI.Page

    Protected Sub Page_InitComplete(sender As Object, e As System.EventArgs) Handles Me.InitComplete
        'Response.Redirect("CLIENT/pqq_SecurityCheck.aspx")
        Response.Redirect("SECURITY/SEC_Start.aspx")
    End Sub

End Class
