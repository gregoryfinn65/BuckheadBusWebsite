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
    <div class="centerdiv"><asp:Calendar SelectionMode="Day" ID="Calendar1" autopostback=True runat="server" ></asp:Calendar></div><br />
   <div class="centerdiv"> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div><br />
   <div class="centerdiv"> </div><br />




<div class="centerdiv">
    <asp:GridView ID="GridView1" runat="server" EmptyDataText="There are no trips for this day." DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" AutoGenerateColumns="False" PageSize="20" SelectedIndex="-1">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Add to Cart" ShowSelectButton="True" />
             <asp:BoundField DataField="TripId" 
                HeaderText="Trip ID" 
                ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Orgin" 
                HeaderText="Orgin" 
                ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Destination" 
                HeaderText="Destination" 
                ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
             <asp:BoundField DataField="AC" 
                HeaderText="AC" 
                ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
             <asp:BoundField DataField="BusName" 
                HeaderText="Bus Name" 
                ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
           
             <asp:BoundField DataField="PricePerSeat" 
                HeaderText="Price" 
                ReadOnly="True" 
                DataFormatString="{0:c}" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#9bd1ac" Font-Bold="True" ForeColor="Black" />
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
    <br /> <br /> <br />

<!-- CART  -->

 <div class="section">
<div class="container">
    <h1 style="font-weight: bold">Cart</h1>

<div class="centerdiv">

        <asp:GridView ID="CartGridView" runat="server" 
        AutoGenerateColumns="False" 
        EmptyDataText="Your shopping cart is empty.">
        <Columns>
            <asp:CommandField ButtonType="Button" EditText="Change" 
                ShowDeleteButton="True" ShowHeader="false" 
                ShowEditButton="False" ItemStyle-BackColor="Black">
                <HeaderStyle BorderStyle="None" />
            </asp:CommandField>
            <asp:BoundField DataField="ID" 
                HeaderText="Trip ID" 
                ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" 
                HeaderText="Ticket" 
                ReadOnly="True" >
                <HeaderStyle HorizontalAlign="Center" /><ItemStyle Font-Bold="True" />
            </asp:BoundField>
            <asp:BoundField DataField="Price" 
                HeaderText="Price" 
                ReadOnly="True" 
                DataFormatString="{0:c}" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Quantity" 
                HeaderText="Quantity" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Total" 
                HeaderText="Total Cost" 
                ReadOnly="True" 
                DataFormatString="{0:c}" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>        
        </Columns>
              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    </div><br />
    <div class="centerdiv">
        <asp:Button ID="CheckOutButton" runat="server" Text="Check Out" /></div>
<div class="group"></div>
</div>
</div>

       


 <!-- END OF CART  -->

</div>
</div>

</asp:Content>

