
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail

Partial Class Registration
    Inherits System.Web.UI.Page

    Protected Sub RegisterButton_Click(sender As Object, e As EventArgs) Handles RegisterButton.Click
        Dim userId As Integer = 0
        Using con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BuckheadBusDatabase.mdf;Integrated Security=True")
            Using cmd As New SqlCommand("Insert_User")
                Using sda As New SqlDataAdapter
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Username", UserName.Text.Trim())
                    cmd.Parameters.AddWithValue("@Password", Password.Text.Trim())
                    cmd.Parameters.AddWithValue("@Email", Email.Text.Trim)
                    cmd.Parameters.AddWithValue("@FirstName", FirstName.Text.Trim)
                    cmd.Parameters.AddWithValue("@LastName", LastName.Text.Trim)
                    cmd.Parameters.AddWithValue("@TelephoneNumber", TelephoneNumber.Text.Trim)
                    cmd.Connection = con
                    con.Open()
                    userId = Convert.ToInt32(cmd.ExecuteScalar())
                    con.Close()
                End Using
            End Using
            Dim messege As String = String.Empty
            Select Case userId
                Case -1
                    messege = "Username already exists."
                Case -2
                    messege = "This email address has already been used before."
                Case Else
                    'messege = "Registration has been sucessful! Please check your email to complete activation!"
                    Response.Write("<script language='javascript'>window.alert('Registration has been sucessful! Please check your email to complete activation!');window.location='Default.aspx';</script>")
                    SendActivationEmail(userId)
                    Exit Select
            End Select
            'ClientScript.RegisterStartupScript([GetType](), "alert",
            '(Convert.ToString("alert( ' ") & messege) + " ');", True)


        End Using

    End Sub
    Private Sub SendActivationEmail(userId As Integer)
        Dim activationCode As String = Guid.NewGuid().ToString()
        Using con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BuckheadBusDatabase.mdf;Integrated Security=True")
            Using cmd As New SqlCommand("INSERT INTO UserActivation VALUES(@UserId,@ActivationCode)")
                Using sda As New SqlDataAdapter
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@UserId", userId)
                    cmd.Parameters.AddWithValue("@ActivationCode", activationCode)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            End Using
        End Using

        Using mm As New MailMessage("thebuckheadbus@gmail.com", Email.Text)
            mm.Subject = "The Buckhead Bus Account Activation"
            Dim body As String = "Hello " + UserName.Text.Trim() + ","
            body += "<br /><br />Thank you for choosing The Buckhead Bus. Our goal is to make sure "
            body += "your ride home is as reliable and stress free as possible."
            body += "<br />Please click the link below to activate your account."
            body += "<br />For security purposes the link will expire in 24 hours."
            body += "<br /><br />Thank you and welcome!"
            body += "<br />-The Buckhead Bus Team"
            body += "<br /><br /><a href = '" +
           Request.Url.GetLeftPart(UriPartial.Authority) +
           Page.ResolveUrl("~/Activation.aspx?ActivationCode=" & activationCode) + "'> Click here to activate your account!"
            mm.Body = body
            mm.IsBodyHtml = True
            Dim smtp As New SmtpClient()
            smtp.Host = "smtp.gmail.com"
            smtp.EnableSsl = True
            Dim NetworkCred As New System.Net.NetworkCredential()
            NetworkCred.UserName = "thebuckheadbus@gmail.com"
            NetworkCred.Password = "buckheadbus123"
            smtp.UseDefaultCredentials = True
            smtp.Credentials = NetworkCred
            smtp.Port = 587
            smtp.Send(mm)
        End Using
    End Sub

End Class
