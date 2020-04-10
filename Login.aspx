<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<div class="section bg">
<div class="container">
<h1>Login</h1>
<div class="centerdiv">
    <asp:Login ID="Login1" runat="server" TitleText="" CssClass="notamembertext"></asp:Login>
</div>
    <br />
    <br />
    <div class="centerdiv">
        <a class="notamembertext" href="Registration.aspx">Not a member? Sign Up!</a>
    </div>
<div class="group"></div>
</div>
</div>


   
</asp:Content>

