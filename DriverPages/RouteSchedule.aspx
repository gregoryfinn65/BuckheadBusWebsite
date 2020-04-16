<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="RouteSchedule.aspx.vb" Inherits="DriverPages_RouteSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Route Schedule
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="section bg">
<div class="container">
<h1>Route Schedule</h1>
<br />
<br />
<div class="centerdiv">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="TripId" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Label ID="TripIdLabel" runat="server" Text='<%# Eval("TripId") %>' />
                </td>
                <td>
                    <asp:Label ID="DepartureLabel" runat="server" Text='<%# Eval("Departure") %>' />
                </td>
                <td>
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td>
                    <asp:Label ID="PricePerSeatLabel" DataFormatString="{0:c}"  runat="server" Text='<%# Eval("PricePerSeat") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Eval("AC") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="BusNameLabel" runat="server" Text='<%# Eval("BusName") %>' />
                </td>
                <td>
                    <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                </td>
                <td>
                    <asp:Label ID="OrginLabel" runat="server" Text='<%# Eval("Orgin") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="TripIdLabel1" runat="server" Text='<%# Eval("TripId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DepartureTextBox" runat="server" Text='<%# Bind("Departure") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PricePerSeatTextBox" DataFormatString="{0:c}"  runat="server" Text='<%# Bind("PricePerSeat") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Bind("AC") %>' />
                </td>
                <td>
                    <asp:TextBox ID="BusNameTextBox" runat="server" Text='<%# Bind("BusName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DestinationTextBox" runat="server" Text='<%# Bind("Destination") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OrginTextBox" runat="server" Text='<%# Bind("Orgin") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="DepartureTextBox" runat="server" Text='<%# Bind("Departure") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PricePerSeatTextBox" DataFormatString="{0:c}"  runat="server" Text='<%# Bind("PricePerSeat") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Bind("AC") %>' />
                </td>
                <td>
                    <asp:TextBox ID="BusNameTextBox" runat="server" Text='<%# Bind("BusName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DestinationTextBox" runat="server" Text='<%# Bind("Destination") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OrginTextBox" runat="server" Text='<%# Bind("Orgin") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Label ID="TripIdLabel" runat="server" Text='<%# Eval("TripId") %>' />
                </td>
                <td>
                    <asp:Label ID="DepartureLabel" runat="server" Text='<%# Eval("Departure") %>' />
                </td>
                <td>
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td>
                    <asp:Label ID="PricePerSeatLabel" DataFormatString="{0:c}" runat="server" Text='<%# Eval("PricePerSeat") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Eval("AC") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="BusNameLabel" runat="server" Text='<%# Eval("BusName") %>' />
                </td>
                <td>
                    <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                </td>
                <td>
                    <asp:Label ID="OrginLabel" runat="server" Text='<%# Eval("Orgin") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">TripId</th>
                                <th runat="server">Departure</th>
                                <th runat="server">UserId</th>
                                <th runat="server">PricePerSeat</th>
                                <th runat="server">AC</th>
                                <th runat="server">BusName</th>
                                <th runat="server">Destination</th>
                                <th runat="server">Orgin</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="TripIdLabel" runat="server" Text='<%# Eval("TripId") %>' />
                </td>
                <td>
                    <asp:Label ID="DepartureLabel" runat="server" Text='<%# Eval("Departure") %>' />
                </td>
                <td>
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td>
                    <asp:Label ID="PricePerSeatLabel"  DataFormatString="{0:c}" runat="server" Text='<%# Eval("PricePerSeat") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Eval("AC") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="BusNameLabel" runat="server" Text='<%# Eval("BusName") %>' />
                </td>
                <td>
                    <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                </td>
                <td>
                    <asp:Label ID="OrginLabel" runat="server" Text='<%# Eval("Orgin") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>





    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="GetTripsByUserId" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:CookieParameter CookieName="UserId" Name="UserId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>
<div class="group"></div>
</div>
</div>







</asp:Content>

