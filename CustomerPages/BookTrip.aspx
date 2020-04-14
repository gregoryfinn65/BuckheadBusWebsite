<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="BookTrip.aspx.vb" Inherits="CustomerPages_BookTrip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Book a Trip
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="section bg">
<div class="container">
<h1>Book a Trip</h1>
    <h2>Today is <asp:Label ID="lblToday" runat="server" Text=""></asp:Label></h2>

<div class="centerdiv">

    </div>
    <div class="centerdiv"><asp:Calendar SelectionMode="Day" ID="Calendar1" autopostback="Enabled" runat="server" ></asp:Calendar></div><br />
   <div class="centerdiv"> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div><br />
   <div class="centerdiv"> </div><br />




<div class="centerdiv">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateSelectButton="True">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="GetTrip" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="DepartureDateTime" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</div>
</div>

</asp:Content>

