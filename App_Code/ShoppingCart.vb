Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Public Class ShoppingCart

    Private _cart As List(Of CartItem)

    Public Sub New()
        _cart = New List(Of CartItem)()
    End Sub

    Public Function GetItems() As List(Of CartItem)
        Return _cart
    End Function

    Public Sub AddItem(ByVal id As String, _
            ByVal name As String, _
            ByVal price As Decimal)
        Dim itemFound As Boolean = False
        For Each item As CartItem In _cart
            If item.ID = id Then
                item.Quantity += 1
                itemFound = True
            End If
        Next
        If Not itemFound Then
            Dim item As CartItem
            item = New CartItem(id, name, price, 1)
            _cart.Add(item)
        End If
    End Sub

    Public Sub UpdateQuantity(ByVal index As Integer, _
            ByVal quantity As Integer)
        Dim item As CartItem
        item = _cart(index)
        item.Quantity = quantity
    End Sub

    Public Sub DeleteItem(ByVal index As Integer)
        _cart.RemoveAt(index)
    End Sub

    Public ReadOnly Property Count() As Integer
        Get
            Return _cart.Count
        End Get
    End Property

End Class
