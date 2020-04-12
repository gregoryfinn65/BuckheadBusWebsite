<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="BusManagement.aspx.vb" Inherits="DriverPages_BusManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Bus Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="section bg">
<div class="container">
<h1>Bus Management</h1>
    <h2>These are your buses!</h2>
<div class="centerdiv">


    <asp:ListView ID="ListView1" runat="server" DataKeyNames="BusId" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="BusIdLabel" runat="server" Text='<%# Eval("BusId") %>' />
                </td>
                <td>
                    <asp:Label ID="BusNameLabel" runat="server" Text='<%# Eval("BusName") %>' />
                </td>
                <td>
                    <asp:Label ID="NumberOfSeatsLabel" runat="server" Text='<%# Eval("NumberOfSeats") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Eval("AC") %>' Enabled="false" />
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
                    <asp:Label ID="BusIdLabel1" runat="server" Text='<%# Eval("BusId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="BusNameTextBox" runat="server" Text='<%# Bind("BusName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NumberOfSeatsTextBox" runat="server" Text='<%# Bind("NumberOfSeats") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Bind("AC") %>' />
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
                    <asp:TextBox ID="BusNameTextBox" runat="server" Text='<%# Bind("BusName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NumberOfSeatsTextBox" runat="server" Text='<%# Bind("NumberOfSeats") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Bind("AC") %>' />
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
                    <asp:Label ID="BusIdLabel" runat="server" Text='<%# Eval("BusId") %>' />
                </td>
                <td>
                    <asp:Label ID="BusNameLabel" runat="server" Text='<%# Eval("BusName") %>' />
                </td>
                <td>
                    <asp:Label ID="NumberOfSeatsLabel" runat="server" Text='<%# Eval("NumberOfSeats") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Eval("AC") %>' Enabled="false" />
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
                                <th runat="server">BusId</th>
                                <th runat="server">BusName</th>
                                <th runat="server">NumberOfSeats</th>
                                <th runat="server">AC</th>
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
                    <asp:Label ID="BusIdLabel" runat="server" Text='<%# Eval("BusId") %>' />
                </td>
                <td>
                    <asp:Label ID="BusNameLabel" runat="server" Text='<%# Eval("BusName") %>' />
                </td>
                <td>
                    <asp:Label ID="NumberOfSeatsLabel" runat="server" Text='<%# Eval("NumberOfSeats") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ACCheckBox" runat="server" Checked='<%# Eval("AC") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>







    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" DeleteCommand="DELETE FROM [BUS] WHERE [BusId] = @BusId" InsertCommand="INSERT INTO [BUS] ([BusName], [NumberOfSeats], [AC]) VALUES (@BusName, @NumberOfSeats, @AC)" SelectCommand="SELECT [BusId], [BusName], [NumberOfSeats], [AC] FROM [BUS] WHERE ([UserId] = @UserId)" UpdateCommand="UPDATE [BUS] SET [BusName] = @BusName, [NumberOfSeats] = @NumberOfSeats, [AC] = @AC WHERE [BusId] = @BusId">
        <DeleteParameters>
            <asp:Parameter Name="BusId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BusName" Type="String" />
            <asp:Parameter Name="NumberOfSeats" Type="Int32" />
            <asp:Parameter Name="AC" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:CookieParameter CookieName="UserId" Name="UserId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="BusName" Type="String" />
            <asp:Parameter Name="NumberOfSeats" Type="Int32" />
            <asp:Parameter Name="AC" Type="Boolean" />
            <asp:Parameter Name="BusId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </div>
</div>
    <br />
    <br />
    <br />
<div class="centerdiv">
<h2>Add Bus</h2>
</div>
    <div class="centerdiv">
<table id="AddBusTable" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;" class="auto-style1">
			<tbody><tr style="background-color:#DCDCDC;color: #000000;">
				<th></th>
				
				<th>Number of Seats</th>
				<th>Bus Name</th>
				<th>AC?</th>
                <th>UserId</th>
			</tr>
            <tr style="">
                <td>
                    <asp:button runat="server" text="Add Bus" id="AddBusButton" />
                    <asp:button  runat="server" text="Clear"  id="ClearButton" />
                </td>
          
                <td>
                    <asp:TextBox ID="NumberOfSeatsBox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="BusNameBox" runat="server"></asp:TextBox>
                </td>
                <td>
                   <asp:CheckBox ID="ACbox" runat="server" />
                </td>
                <td style="text-align:right">
                    <asp:label runat="server" id="lblUserId" text=""></asp:label>
                </td>
            </tr>
        </tbody></table>

</div>

</div>


</div>
</asp:Content>

