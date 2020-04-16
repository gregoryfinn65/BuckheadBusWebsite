<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="PublicBusSchedule.aspx.vb" Inherits="PublicBusSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Bus Schedules
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="section bg">
<div class="container">
<h1>Bus Schedules</h1>
<h2>Today is <asp:Label ID="lblToday" runat="server" Text=""></asp:Label></h2>

<div class="centerdiv">

    </div>
    <div class="centerdiv"><asp:Calendar SelectionMode="Day" ID="Calendar1" autopostback="Enabled" runat="server" ></asp:Calendar></div><br />
   <div class="centerdiv"> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div><br />
   <div class="centerdiv"> </div><br />




<div class="centerdiv">
    <asp:GridView ID="GridView1" runat="server" EmptyDataText="There are no trips for this day."  DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
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

