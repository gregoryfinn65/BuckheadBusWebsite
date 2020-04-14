Imports System.Data
Imports System.Configuration
Imports System.Web.UI.HtmlControls.HtmlInputControl
Imports System.Data.SqlClient
Partial Class DriverPages_RouteManagement
    Inherits System.Web.UI.Page

    Protected Sub AddBusButton_Click(sender As Object, e As EventArgs) Handles AddBusButton.Click
        Dim Departure As DateTime
        Departure = DepartureDateTime.Value
        Using con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BuckheadBusDatabase.mdf;Integrated Security=True")
            Using cmd As New SqlCommand("GenerateTrip")
                Using sda As New SqlDataAdapter
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@UserId", HttpContext.Current.Request.Cookies("UserId").Value.ToString())
                    cmd.Parameters.AddWithValue("@Departure", Departure)
                    cmd.Parameters.AddWithValue("@OrginId", ddlOrginSelect.SelectedValue)
                    cmd.Parameters.AddWithValue("@DestinationId", ddlDestinationSelect.SelectedValue)
                    cmd.Parameters.AddWithValue("@PricePerSeat", PricePerSeat.Text.Trim)
                    cmd.Parameters.AddWithValue("@BusId", ddlBusSelect.SelectedValue)
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteScalar()
                    con.Close()
                End Using
            End Using
        End Using
        PricePerSeat.Text = ""
        DepartureDateTime.Value = 0
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub
End Class
