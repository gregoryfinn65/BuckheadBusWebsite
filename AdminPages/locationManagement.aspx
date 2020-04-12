<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="locationManagement.aspx.vb" Inherits="AdminPages_locationManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Location Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="section bg">
<div class="container">
<h1>Location Management</h1>

<div class="centerdiv">

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="LocationId" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="LocationIdLabel" runat="server" Text='<%# Eval("LocationId") %>' />
                </td>
                <td>
                    <asp:Label ID="StreetAddressLabel" runat="server" Text='<%# Eval("StreetAddress") %>' />
                </td>
                <td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                </td>
                <td>
                    <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                </td>
                <td>
                    <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                </td>
                <td>
                    <asp:Label ID="DisplayNameLabel" runat="server" Text='<%# Eval("DisplayName") %>' />
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
                    <asp:Label ID="LocationIdLabel1" runat="server" Text='<%# Eval("LocationId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="StreetAddressTextBox" runat="server" Text='<%# Bind("StreetAddress") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                </td>
                <td>
                    <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DisplayNameTextBox" runat="server" Text='<%# Bind("DisplayName") %>' />
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
                    <asp:TextBox ID="StreetAddressTextBox" runat="server" Text='<%# Bind("StreetAddress") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                </td>
                <td>
                    <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DisplayNameTextBox" runat="server" Text='<%# Bind("DisplayName") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="LocationIdLabel" runat="server" Text='<%# Eval("LocationId") %>' />
                </td>
                <td>
                    <asp:Label ID="StreetAddressLabel" runat="server" Text='<%# Eval("StreetAddress") %>' />
                </td>
                <td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                </td>
                <td>
                    <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                </td>
                <td>
                    <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                </td>
                <td>
                    <asp:Label ID="DisplayNameLabel" runat="server" Text='<%# Eval("DisplayName") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">LocationId</th>
                                <th runat="server">StreetAddress</th>
                                <th runat="server">City</th>
                                <th runat="server">Zip</th>
                                <th runat="server">State</th>
                                <th runat="server">DisplayName</th>
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="LocationIdLabel" runat="server" Text='<%# Eval("LocationId") %>' />
                </td>
                <td>
                    <asp:Label ID="StreetAddressLabel" runat="server" Text='<%# Eval("StreetAddress") %>' />
                </td>
                <td>
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                </td>
                <td>
                    <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                </td>
                <td>
                    <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                </td>
                <td>
                    <asp:Label ID="DisplayNameLabel" runat="server" Text='<%# Eval("DisplayName") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" DeleteCommand="DELETE FROM [LOCATIONS] WHERE [LocationId] = @LocationId" InsertCommand="INSERT INTO [LOCATIONS] ([StreetAddress], [City], [Zip], [State], [DisplayName], [ImagePath]) VALUES (@StreetAddress, @City, @Zip, @State, @DisplayName, @ImagePath)" SelectCommand="SELECT * FROM [LOCATIONS]" UpdateCommand="UPDATE [LOCATIONS] SET [StreetAddress] = @StreetAddress, [City] = @City, [Zip] = @Zip, [State] = @State, [DisplayName] = @DisplayName, [ImagePath] = @ImagePath WHERE [LocationId] = @LocationId">
        <DeleteParameters>
            <asp:Parameter Name="LocationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="DisplayName" Type="String" />
            <asp:Parameter Name="ImagePath" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="DisplayName" Type="String" />
            <asp:Parameter Name="ImagePath" Type="String" />
            <asp:Parameter Name="LocationId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


</div>




</div>
</div>











</asp:Content>

