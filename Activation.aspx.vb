﻿Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class Activation
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim constr As String =
ConfigurationManager.ConnectionStrings("DatabaseConnectionString").ConnectionString
            Dim activationCode As String = If(Not String.IsNullOrEmpty(Request.QueryString("ActivationCode")), Request.QueryString("ActivationCode"), Guid.Empty.ToString())
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("DELETE FROM UserActivation WHERE ActivationCode = @ActivationCode")
                    Using sda As New SqlDataAdapter()
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@ActivationCode", activationCode)
                        cmd.Connection = con
                        con.Open()
                        Dim rowsAffected As Integer = cmd.ExecuteNonQuery()
                        con.Close()
                        If rowsAffected = 1 Then
                            lblMessage.Text = "Activation Has Been Successful!"

                        Else
                            lblMessage.Text = "Error, Invalid Activation Code."

                        End If
                    End Using
                End Using
            End Using
        End If
    End Sub
End Class
