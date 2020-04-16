
Partial Class CustomerPages_AccountInfo
    Inherits System.Web.UI.Page
    Dim Userrole As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Context.User.IsInRole("Admin")) Then
            Userrole = "Administrator"
        ElseIf (Context.User.IsInRole("Driver")) Then
            Userrole = "Driver"
        ElseIf (Context.User.IsInRole("Customer")) Then
            Userrole = "Customer"
        End If


        lblWelcome.Text = "Hello, " + Context.User.Identity.Name
        lblHello.Text = "Dear " + Userrole & ", welcome to your account information!"
    End Sub
    'useridtest.Text = Request.Cookies("UserId").Value





End Class
