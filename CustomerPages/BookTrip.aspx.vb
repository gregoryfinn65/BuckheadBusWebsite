
Partial Class CustomerPages_BookTrip
    Inherits System.Web.UI.Page

    Protected Sub SubPage_Load(sender As Object, e As EventArgs) Handles Me.Load
        TextBox1.Text = Calendar1.SelectedDate.ToShortDateString()
        lblToday.Text = Calendar1.TodaysDate.ToShortDateString()

    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        TextBox1.Text = Calendar1.SelectedDate.ToShortDateString()
        lblToday.Text = Calendar1.TodaysDate.ToShortDateString()
    End Sub


End Class
