Imports Microsoft.VisualBasic

Public Class Customer
    Private _lastName As String
    Private _firstName As String
    Private _address As String
    Private _city As String
    Private _state As String
    Private _zipCode As String
    Private _phoneNumber As String
    Private _email As String

    Public Sub New()
    End Sub

    Public Sub New(ByVal lastName As String, _
            ByVal firstName As String, _
            ByVal address As String, _
            ByVal city As String, _
            ByVal state As String, _
            ByVal zipCode As String, _
            ByVal phoneNumber As String, _
            ByVal email As String)
        Me.LastName = lastName
        Me.FirstName = firstName
        Me.Address = address
        Me.City = city
        Me.State = state
        Me.ZipCode = zipCode
        Me.PhoneNumber = phoneNumber
        Me.Email = email
    End Sub

    Public Property LastName() As String
        Get
            Return _lastName
        End Get
        Set(ByVal value As String)
            _lastName = value
        End Set
    End Property

    Public Property FirstName() As String
        Get
            Return _firstName
        End Get
        Set(ByVal value As String)
            _firstName = value
        End Set
    End Property

    Public Property Address() As String
        Get
            Return _address
        End Get
        Set(ByVal value As String)
            _address = value
        End Set
    End Property

    Public Property City() As String
        Get
            Return _city
        End Get
        Set(ByVal value As String)
            _city = value
        End Set
    End Property

    Public Property State() As String
        Get
            Return _state
        End Get
        Set(ByVal value As String)
            _state = value
        End Set
    End Property

    Public Property ZipCode() As String
        Get
            Return _zipCode
        End Get
        Set(ByVal value As String)
            _zipCode = value
        End Set
    End Property

    Public Property Email() As String
        Get
            Return _email
        End Get
        Set(ByVal value As String)
            _email = value
        End Set
    End Property

    Public Property PhoneNumber() As String
        Get
            Return _phoneNumber
        End Get
        Set(ByVal value As String)
            _phoneNumber = value
        End Set
    End Property

End Class
