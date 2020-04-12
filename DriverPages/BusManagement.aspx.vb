
Partial Class DriverPages_BusManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblUserId.Text = HttpContext.Current.Request.Cookies("UserId").Value.ToString()
    End Sub

    Protected Sub ClearButton_Click(sender As Object, e As EventArgs) Handles ClearButton.Click
        NumberOfSeatsBox.Text = ""
        ACbox.Checked = 0
        BusNameBox.Text = ""
    End Sub



    Protected Sub AddBusButton_Click(sender As Object, e As EventArgs) Handles AddBusButton.Click
        Dim cn As New Data.SqlClient.SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BuckheadBusDatabase.mdf;Integrated Security=True")
        cn.Open()
        Dim cmd As New Data.SqlClient.SqlCommand(("INSERT INTO BUS (NumberOfSeats, AC, UserId, BusName) VALUES ('" & NumberOfSeatsBox.Text & "','" & ACbox.Checked & "','" & lblUserId.Text & "','" & BusNameBox.Text & "')"), cn)
        cmd.ExecuteNonQuery()
        cn.Close()
        NumberOfSeatsBox.Text = ""
        ACbox.Checked = 0
        BusNameBox.Text = ""
        Response.Redirect("BusManagement.aspx")
    End Sub

End Class
