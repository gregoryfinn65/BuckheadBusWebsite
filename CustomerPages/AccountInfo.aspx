<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="AccountInfo.aspx.vb" Inherits="CustomerPages_AccountInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Account Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
<div class="section bg">
<div class="container">
<h1><asp:Label id='lblWelcome' runat="server" Text="Label"></asp:Label></h1>
<h2><asp:Label runat="server" id="lblHello" Text="Label"></asp:Label></h2>
<div class="centerdiv">
    
<br />
    <asp:DetailsView ID="DetailsView1" runat="server"  width="500px" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="UserId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" CssClass="notamembertext">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" ReadOnly="True" SortExpression="UserId" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" />
            <asp:BoundField DataField="LastLoginDate" HeaderText="LastLoginDate" SortExpression="LastLoginDate" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="TelephoneNumber" HeaderText="TelephoneNumber" SortExpression="TelephoneNumber" />
            <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" SelectCommand="SELECT [UserId], [Username], [Email], [CreatedDate], [LastLoginDate], [FirstName], [LastName], [TelephoneNumber], [RoleId] FROM [USERS] WHERE ([UserId] = @UserId)">
        <SelectParameters>
            <asp:CookieParameter CookieName="UserId" Name="UserId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>
    <br />
    <br />
    <div class="centerdiv">
           
<h2 style="color:gray">To become a driver please <a href="../Contact.aspx">contact us</a> so an Administrator can perform the necessary steps to register you. </h2>
    </div>
<div class="group"></div>
</div>
</div>







</asp:Content>

