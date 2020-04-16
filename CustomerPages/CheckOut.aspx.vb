Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Reflection
Imports System.Data
Imports System.Net
Imports System.Net.Mail
Partial Class Cart
    Inherits System.Web.UI.Page
    Private order As Order
    Protected Sub SubPage_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim cart As ShoppingCart = LoadCart()

        ' check to see if cart has items 
        Dim itemFound As Boolean = False
        For Each item As CartItem In cart.GetItems
            If item IsNot Nothing Then
                itemFound = True
            End If
        Next
        If itemFound Then
            CheckOutPlaceHolder.Visible = True
            NoCartPlaceHolder.Visible = False
            ShowCart()
        Else
            NoCartPlaceHolder.Visible = True
            CheckOutPlaceHolder.Visible = False
        End If

        'make an new oder 
        If Session("order") Is Nothing Then
            Order = New Order(DateTime.Now,
                Nothing, Session("cart"))
            Session("order") = Order
        Else
            Order = Session("order")
            cart = Order.Cart
        End If


        lblSubtotal.Text = order.SubTotal.ToString("c")
        lblSalesTax.Text = order.SalesTax.ToString("c")
        lblTotal.Text = order.Total.ToString("c")

    End Sub


    ' checking to see if the Session is expired or assgining a new experation date  
    Private Sub CheckTimeStamps()
        If IsExpired() Then ' checking to see if the Session is is expired 
            Response.Redirect(Request.Url.OriginalString)
        Else
            Dim t As DateTime
            t = DateTime.Now
            ViewState.Add("$$TimeStamp", t)
            Dim page As String
            page = Request.Url.AbsoluteUri
            Session.Add(page + "_TimeStamp", t)
        End If
    End Sub


    ' check for cart or load new cart
    Private Function LoadCart() As ShoppingCart
        CheckTimeStamps()
        Dim cart As ShoppingCart
        If Session("cart") Is Nothing Then
            cart = New ShoppingCart()
            Session("cart") = cart
        Else
            cart = Session("cart")
        End If
        Return cart
    End Function

    ' code to add data from cart to grid view
    Private Sub ShowCart()
        Dim cart As ShoppingCart = LoadCart()
        ' adding data to carts gridview
        CartGridView.DataSource = cart.GetItems()
        CartGridView.DataBind()

    End Sub



    ' checking to see if the Session is is expired 
    Private Function IsExpired() As Boolean
        Dim page As String
        page = Request.Url.AbsoluteUri
        If Session(page + "_TimeStamp") Is Nothing Then
            Return False
        ElseIf ViewState("$$TimeStamp") Is Nothing Then
            Return False
        ElseIf Session(page + "_TimeStamp").ToString() _
              = ViewState("$$TimeStamp").ToString() Then
            Return False
        Else
            Return True
        End If
    End Function



    ' code for deleting items from cart
    Protected Sub CartGridView_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles CartGridView.RowDeleting
        Dim cart As ShoppingCart
        If Session("cart") Is Nothing Then
            cart = New ShoppingCart()
            Session("cart") = cart
        Else
            cart = Session("cart")
        End If
        cart.DeleteItem(e.RowIndex)
        CartGridView.DataBind()

        ' check to see if cart has items 
        Dim itemFound As Boolean = False
        For Each item As CartItem In cart.GetItems
            If item IsNot Nothing Then
                itemFound = True
            End If
        Next
        If itemFound Then
            CheckOutPlaceHolder.Visible = True
            NoCartPlaceHolder.Visible = False
            ShowCart()
        Else
            NoCartPlaceHolder.Visible = True
            CheckOutPlaceHolder.Visible = False
        End If
    End Sub

    ' code for updating items from cart
    Protected Sub CartGridView_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles CartGridView.RowUpdating
        Dim cart As ShoppingCart = LoadCart()
        Dim cell As DataControlFieldCell
        cell = CartGridView.Rows(e.RowIndex) _
            .Controls(3)
        Dim t As TextBox = cell.Controls(0)
        Try
            Dim q As Integer
            q = Integer.Parse(t.Text)
            cart.UpdateQuantity(e.RowIndex, q)
        Catch ex As FormatException
            e.Cancel = True
        End Try
        CartGridView.EditIndex = -1
        CartGridView.DataBind()
    End Sub

    ' cart cancel row edit function 
    Protected Sub CartGridView_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles CartGridView.RowCancelingEdit
        e.Cancel = True
        CartGridView.EditIndex = -1
        CartGridView.DataBind()
    End Sub

    ' cart row edit function 
    Protected Sub CartGridView_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles CartGridView.RowEditing
        CartGridView.EditIndex = e.NewEditIndex
        CartGridView.DataBind()
    End Sub


    Protected Sub Wizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.FinishButtonClick

        ' process credit card information here

        Dim cart As ShoppingCart = Session("cart")
        Dim TripIdList As String = ""
        Dim stringId As String
        For Each item As CartItem In cart.GetItems()
            If item.Quantity = 1 Then
                stringId = String.Concat(item.ID.ToString(), ",")
                TripIdList = String.Concat(TripIdList, stringId)
            Else
                Dim Quantity As Double = item.Quantity
                While Quantity <> 0
                    stringId = String.Concat(item.ID.ToString(), ",")
                    TripIdList = String.Concat(TripIdList, stringId)
                    Quantity = Quantity - 1
                End While
            End If
        Next
        Dim userid As String = Request.Cookies("UserId").Value.ToString
        Dim orderdate As String = order.OrderDate
        Dim SubTotal As String = order.SubTotal
        Dim salestax As String = order.SalesTax
        Using con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BuckheadBusDatabase.mdf;Integrated Security=True")
            Using cmd As New SqlCommand("CompleteOrderandAssignTicket")
                Using sda As New SqlDataAdapter
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@UserId", userid)
                    cmd.Parameters.AddWithValue("@OrderDate", orderdate)
                    cmd.Parameters.AddWithValue("@SubTotal", SubTotal)
                    cmd.Parameters.AddWithValue("@salestax", salestax)
                    cmd.Parameters.AddWithValue("@TripIdString", TripIdList)
                    cmd.Connection = con
                    con.Open()
                    Try
                        cmd.ExecuteScalar()
                        Response.Redirect("Completed.aspx")
                        Session("cart") = Nothing
                        Session("order") = Nothing
                        ' send email function 
                    Catch ex As Exception
                        Label1.Text = ("Order was not placed!!! Something went wrong with your order.")
                    End Try
                    con.Close()
                End Using
            End Using
        End Using

        'If success Then

        ' Else

        ' End If
    End Sub

    Public Function ConvertToDataTable(Of T)(ByVal list As IList(Of T)) As DataTable
        Dim table As New DataTable()
        Dim fields() As FieldInfo = GetType(T).GetFields()
        For Each field As FieldInfo In fields
            table.Columns.Add(field.Name, field.FieldType)
        Next
        For Each item As T In list
            Dim row As DataRow = table.NewRow()
            For Each field As FieldInfo In fields
                row(field.Name) = field.GetValue(item)
            Next
            table.Rows.Add(row)
        Next
        Return table
    End Function




    Private Sub ConfirmOrderEmail(userId As Integer)
        Dim Email As String
        Dim FirstName As String
        Dim LastName As String
        Using con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BuckheadBusDatabase.mdf;Integrated Security=True")
            Using cmd As New SqlCommand("select Email, FirstName, LastName FROM USERS where UserId = @UserId ")
                Using sda As New SqlDataAdapter
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@UserId", userId)
                    cmd.Connection = con
                    con.Open()
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    reader.Read()
                    Email = reader("Email").ToString
                    FirstName = reader("FirstName").ToString
                    LastName = reader("LastName").ToString
                    con.Close()
                End Using
            End Using
        End Using
        Dim SubTotal = order.SubTotal.ToString("c")
        Dim SalesTax = order.SalesTax.ToString("c")
        Dim Total = order.Total.ToString("c")
        Dim stringName As String
        Dim EmailTicketNames As String = ""
        Dim cart As ShoppingCart = Session("cart")
        For Each item As CartItem In cart.GetItems()
            If item.Quantity = 1 Then
                stringName = String.Concat(" <br />", item.Name.ToString())
                EmailTicketNames = String.Concat(EmailTicketNames, stringName)
            Else
                Dim Quantity As Double = item.Quantity
                While Quantity <> 0
                    stringName = String.Concat(" <br />", item.Name.ToString())
                    EmailTicketNames = String.Concat(EmailTicketNames, stringName)
                    Quantity = Quantity - 1
                End While
            End If
        Next

        Using mm As New MailMessage("thebuckheadbus@gmail.com", Email)
            mm.Subject = "The Buckhead Bus Account Activation"
            Dim body As String = "Hello " + FirstName + " " + LastName + ","
            body += "<br /><br />Your odrer has been placed and your order detials will be listed below. Thank you for choosing The Buckhead Bus. "
            body += "<br />"
            body += EmailTicketNames
            body += "<br />SubTotal:" + SubTotal
            body += "<br /> SalesTax:" + SalesTax
            body += "<br />-----------------"
            body += "<br /> Total:" + Total
            body += "<br /><br />Thank you and welcome!"
            body += "<br />-The Buckhead Bus Team"
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
