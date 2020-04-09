<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="PublicBusSchedule.aspx.vb" Inherits="PublicBusSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Bus Schedules
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="section bg">
<div class="container">
<h1>Bus Schedules</h1>
<div class="centerdiv">
    
   <asp:GridView ID="RoleList" runat="server" AutoGenerateColumns="false">
 <Columns>
 <asp:TemplateField HeaderText="Role">
 <ItemTemplate>
 <asp:Label runat="server" ID="RoleNameLabel" Text='<%# Container.DataItem %>' />
 </ItemTemplate>
 </asp:TemplateField>
 </Columns>
</asp:GridView>


</div>
</div>
</div>
 






</asp:Content>

