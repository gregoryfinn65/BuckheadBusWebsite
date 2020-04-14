
Partial Class Contact
    Inherits System.Web.UI.Page

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        txtName.Text = ""
        txtEmail.Text = ""
        txtPhone.Text = ""
        txtQ.Text = ""
        lblMessage.Text = ""

        txtName.Focus()
    End Sub
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        lblMessage.Text = "Thank you for reaching out."
    End Sub
End Class
