Imports System.Data
Partial Class CustomerPages_BookTrip
    Inherits System.Web.UI.Page

    Protected Sub SubPage_Load(sender As Object, e As EventArgs) Handles Me.Load
        TextBox1.Text = Calendar1.SelectedDate.ToShortDateString()
        lblToday.Text = Calendar1.TodaysDate.ToShortDateString()
        Dim cart As ShoppingCart = LoadCart()
        ShowCart()
        GridView1.SelectedIndex = -1
    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        TextBox1.Text = Calendar1.SelectedDate.ToShortDateString()
        lblToday.Text = Calendar1.TodaysDate.ToShortDateString()



        'Dim cookieResult As String = Request.Cookies("cart").Value.ToString
        'Dim sqlStringList As String

        'Dim cartdata As String = cookieResult.Replace("|", ",")

        'Dim query As String = "SELECT TRIP.Departure, TRIP.PricePerSeat, BUS.AC, BUS.BusName, LOCATIONS_1.DisplayName As Destination, LOCATIONS.DisplayName As Orgin, SEAT.Booked From TRIP INNER Join BUS On TRIP.BusId = BUS.BusId INNER Join LOCATIONS As LOCATIONS_1 On TRIP.DestinationId = LOCATIONS_1.LocationId INNER Join LOCATIONS On TRIP.OrginId = LOCATIONS.LocationId INNER Join SEAT On TRIP.TripId = SEAT.TripId WHERE TRIP.TridId in (" & cartdata & ")"
        'lblQuery.Text = query

    End Sub


    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ' get values from data source
        Dim dv As DataView
        dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty)
        Dim row As Double = GridView1.SelectedRow.RowIndex
        Dim dr As DataRowView = dv(row)
        Dim ID As String = dr("TripId")
        Dim name As String = dr("Orgin") & "  ➟  " & dr("Destination") & "  @ " & dr("Departure")
        Dim Price As Decimal = dr("PricePerSeat")

        Dim cart As ShoppingCart = LoadCart()

        ' add item to cart
        cart.AddItem(ID, name, Price)

        ShowCart()

        'PlaceHolder1.Visible = True
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



    Protected Sub CheckOutButton_Click(sender As Object, e As EventArgs) Handles CheckOutButton.Click
        Response.Redirect("/CustomerPages/CheckOut.aspx")
    End Sub
End Class
