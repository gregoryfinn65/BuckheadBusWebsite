Imports Microsoft.VisualBasic

Public Class CartItem
    Private _id As String
    Private _name As String
    Private _price As Decimal
    Private _quantity As Integer

    Public Sub New()
        Me.ID = ""
        Me.Name = ""
        Me.Price = 0.0
        Me.Quantity = 0
    End Sub

    Public Sub New(ByVal id As String, _
            ByVal name As String, _
            ByVal price As Decimal, _
            ByVal quantity As Integer)
        Me.ID = id
        Me.Name = name
        Me.Price = price
        Me.Quantity = quantity
    End Sub

    Public Property ID() As String
        Get
            Return _id
        End Get
        Set(ByVal value As String)
            _id = value
        End Set
    End Property

    Public Property Name() As String
        Get
            Return _name
        End Get
        Set(ByVal value As String)
            _name = value
        End Set
    End Property

    Public Property Price() As Decimal
        Get
            Return _price
        End Get
        Set(ByVal value As Decimal)
            _price = value
        End Set
    End Property

    Public Property Quantity() As Integer
        Get
            Return _quantity
        End Get
        Set(ByVal value As Integer)
            _quantity = value
        End Set
    End Property

    Public ReadOnly Property Total() As Decimal
        Get
            Return _price * _quantity
        End Get
    End Property

End Class
