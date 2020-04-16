Imports Microsoft.VisualBasic
Imports System.Data

Public Class Order
    Private _orderDate As DateTime
    Private _cart As ShoppingCart

    Public Sub New()
        _cart = New ShoppingCart()
    End Sub

    Public Sub New(ByVal orderDate As DateTime, _
            ByVal Cust As Customer, _
            ByVal Cart As ShoppingCart)
        Me.OrderDate = orderDate
        Me.Cart = Cart
    End Sub

    Public Property OrderDate() As DateTime
        Get
            Return _orderDate
        End Get
        Set(ByVal value As DateTime)
            _orderDate = value
        End Set
    End Property

    Public Property Cart() As ShoppingCart
        Get
            Return _cart
        End Get
        Set(ByVal value As ShoppingCart)
            _cart = value
        End Set
    End Property

    Public ReadOnly Property SubTotal() As Decimal
        Get
            Dim d As Decimal = 0D
            For Each item As CartItem In _cart.GetItems()
                d += item.Total
            Next
            Return d
        End Get
    End Property

    Public ReadOnly Property SalesTax() As Decimal
        Get
            Return Me.SubTotal * 0.0775D
        End Get
    End Property

    Public ReadOnly Property Total() As Decimal
        Get
            Return Me.SubTotal + Me.SalesTax
        End Get
    End Property

End Class
