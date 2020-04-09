
Partial Class BuckheadBusMasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Context.User.IsInRole("Admin")) Then
            lblAdmin.Text = "Admin"
        End If
    End Sub


End Class

