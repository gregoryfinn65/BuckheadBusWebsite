<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="CustomerPurchaseHistory.aspx.vb" Inherits="CustomerPages_CustomerPurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Purchase History
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="section bg">
<div class="container">
<h1>Purchase History</h1>
    <h2>Be preared to present a government-issued photo identification when getting on the bus along with your ticket ID.</h2>
<br />
<br />
<div class="centerdiv">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT TRIP.TripId, TRIP.Departure,SEAT.TicketID, USERS.FirstName, USERS.LastName, USers.Email, Orders.userid, Orders.total, TICKET.OrderId, TRIP.PricePerSeat, BUS.AC, BUS.BusName, LOCATIONS_1.DisplayName AS Destination, LOCATIONS.DisplayName AS Orgin, SEAT.Booked
FROM            TRIP INNER JOIN
                         BUS ON TRIP.BusId = BUS.BusId INNER JOIN
                         LOCATIONS AS LOCATIONS_1 ON TRIP.DestinationId = LOCATIONS_1.LocationId INNER JOIN
                         LOCATIONS ON TRIP.OrginId = LOCATIONS.LocationId INNER JOIN
                         SEAT ON TRIP.TripId = SEAT.TripId inner join 
						 TICKET on TICKET.TicketId = SEAT.TicketID inner join 
						 Orders on Ticket.Orderid = Orders.orderID inner join 
						 USERS on USERS.UserId = Orders.UserId
						 where USERS.UserId = @userid">
        <SelectParameters>
            <asp:CookieParameter CookieName="UserId" Name="userid" />
        </SelectParameters>
    </asp:SqlDataSource>



    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="TripId" DataSourceID="SqlDataSource1" ForeColor="Black">
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <Fields>
                         <asp:BoundField DataField="TicketID" HeaderText="TicketID" SortExpression="TicketID" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderWidth="4" ItemStyle-BorderColor="Black" HeaderStyle-BorderWidth="4" HeaderStyle-BorderColor="Black" HeaderStyle-BackColor="#F0F0F0" ItemStyle-BackColor="#F0F0F0" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="TripId" HeaderText="TripId" SortExpression="TripId" />
            <asp:BoundField DataField="Departure" HeaderText="Departure" SortExpression="Departure" />

            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
            
            <asp:BoundField DataField="OrderId" HeaderText="OrderId" SortExpression="OrderId" />
            <asp:BoundField DataField="PricePerSeat"  DataFormatString="{0:c}"  HeaderText="PricePerSeat" SortExpression="PricePerSeat" />
            <asp:BoundField DataField="total"  DataFormatString="{0:c}"  HeaderText="total" SortExpression="total" ReadOnly="True" />
            <asp:CheckBoxField DataField="AC" HeaderText="AC" SortExpression="AC" />
            <asp:BoundField DataField="BusName" HeaderText="BusName" SortExpression="BusName" />
            <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
            <asp:BoundField DataField="Orgin" HeaderText="Orgin" SortExpression="Orgin" />
            <asp:CheckBoxField DataField="Booked" HeaderText="Booked" SortExpression="Booked" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
    </asp:DetailsView>



</div>
<div class="group"></div>
</div>
</div>






</asp:Content>

