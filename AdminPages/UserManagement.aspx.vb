Imports System.Data.SqlClient
Partial Class AdminPages_UserManagement
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim cn As New Data.SqlClient.SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BuckheadBusDatabase.mdf;Integrated Security=True")
        cn.Open()
        Dim cmd As New Data.SqlClient.SqlCommand(("SELECT * FROM  [USERS] WHERE CONCAT([UserId], '', [Username], '', [Password], '', [Email], '', [LastName], '', [FirstName], '', [RoleId], '', [TelephoneNumber]) LIKE '%" & SearchBox.Text & "%'"), cn)
        cmd.ExecuteNonQuery()
        Dim roles As String = String.Empty
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        DropDownList1.Items.Clear()
        Do While reader.Read()
            DropDownList1.Items.Add(reader("Username"))
        Loop
        cn.Close()
    End Sub

    Protected Sub SearchButton_Click(sender As Object, e As EventArgs) Handles SearchButton.Click
        Dim cn As New Data.SqlClient.SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BuckheadBusDatabase.mdf;Integrated Security=True")
        cn.Open()
        Dim cmd As New Data.SqlClient.SqlCommand(("SELECT * FROM  [USERS] WHERE CONCAT([UserId], '', [Username], '', [Password], '', [Email], '', [LastName], '', [FirstName], '', [RoleId], '', [TelephoneNumber]) LIKE '%" & SearchBox.Text & "%'"), cn)
        cmd.ExecuteNonQuery()
        Dim roles As String = String.Empty
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        DropDownList1.Items.Clear()
        Do While reader.Read()
            DropDownList1.Items.Add(reader("Username"))
        Loop
        cn.Close()
    End Sub

End Class
