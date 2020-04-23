
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

        Dim cn As New Data.SqlClient.SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BuckheadBusDatabase.mdf;Integrated Security=True")
        cn.Open()
        Dim cmd As New Data.SqlClient.SqlCommand(("INSERT INTO ContactUsForm (Name, Email, Phone, Text, CreatedDate) VALUES ('" & txtName.Text & "','" & txtEmail.Text & "','" & txtPhone.Text & "','" & txtQ.Text & "','" & DateTime.Now.ToString & "')"), cn)
        cmd.ExecuteNonQuery()
        cn.Close()

        txtName.Text = ""
        txtEmail.Text = ""
        txtPhone.Text = ""
        txtQ.Text = ""





    End Sub
End Class
