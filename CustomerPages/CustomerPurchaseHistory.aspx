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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT TRIP.TripId,SEAT.SeatId ,TRIP.Departure,SEAT.TicketID, USERS.FirstName, USERS.LastName, USers.Email, Orders.userid, Orders.total, TICKET.OrderId, TRIP.PricePerSeat, BUS.AC, BUS.BusName, LOCATIONS_1.DisplayName AS Destination, LOCATIONS.DisplayName AS Orgin, SEAT.Booked
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

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TripId" DataSourceID="SqlDataSource1" AllowSorting="True">
        <Columns>
             <asp:BoundField DataField="TicketID" HeaderText="TicketID" SortExpression="TicketID" HeaderStyle-BackColor="#F0F0F0" ItemStyle-BackColor="#F0F0F0" />
            <asp:BoundField DataField="Departure" HeaderText="Departure" SortExpression="Departure" />
           <asp:BoundField DataField="Orgin" HeaderText="Orgin" SortExpression="Orgin" />
            <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
               <asp:BoundField DataField="SeatId" HeaderText="Seat Number" SortExpression="SeatId" />
            <asp:BoundField DataField="PricePerSeat" DataFormatString="{0:c}" HeaderText="Price Per Seat" SortExpression="PricePerSeat" />
              <asp:BoundField DataField="total" DataFormatString="{0:c}" HeaderText="total" ReadOnly="True" SortExpression="total" />
            <asp:CheckBoxField DataField="AC" HeaderText="AC" SortExpression="AC" />
            <asp:BoundField DataField="BusName" HeaderText="BusName" SortExpression="BusName" />
    

            <asp:CheckBoxField DataField="Booked" HeaderText="Booked" SortExpression="Booked" />
        </Columns>
    </asp:GridView>

</div>
<div class="group"></div>
</div>
</div>






</asp:Content>

