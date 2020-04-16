<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="CheckOut.aspx.vb" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="section bg">
<div class="container">
    <h1 style="font-weight: bold">Cart</h1>
   
        <asp:PlaceHolder ID="NoCartPlaceHolder" runat="server" Visible="False"> <h2>Your cart is empty. Please <a href="BookTrip.aspx">book a trip.</a></h2></asp:PlaceHolder>
    
<div class="centerdiv">

        <asp:GridView ID="CartGridView" runat="server" 
        AutoGenerateColumns="False" 
        EmptyDataText="Your shopping cart is empty.">
        <Columns>
            <asp:CommandField ButtonType="Button" EditText="Change" 
                ShowDeleteButton="True" ShowHeader="false" 
                ShowEditButton="True" ItemStyle-BackColor="Black">
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
    </div><br /> <br />
   

<asp:PlaceHolder ID="CheckOutPlaceHolder"  runat="server" Visible="False">
   <div class="section bg">
<div class="container">
    <h1 style="font-weight: bold">Check Out</h1>
   <div class="centerdiv">
    <!-- CHECKOUT WIZARD -->
    <asp:Wizard ID="Wizard1" style="background-color:#d3d3d3;padding:10px;border:1px solid black" runat="server">
        
        <WizardSteps>
             <asp:WizardStep ID="WizardStep1" runat="server" Title="Billing">
                 <table style="background-color:#ffffff;margin:10px;padding:10px;border:1px solid black;"><tr><td colspan ="2"> How do you want to pay for this order?<br /><br /></td></tr>
<tr style="text-align:left"><td>
        <asp:Label ID="lblCardType" runat="server" BorderStyle="None" Text="Card type:" Width="100px" />
    </td><td>
        <asp:DropDownList ID="ddlCardType" 
            runat="server">
          <asp:ListItem Value="VISA">Visa</asp:ListItem>
          <asp:ListItem Value="MC">MasterCard</asp:ListItem>
          <asp:ListItem Value="AMEX">American Express</asp:ListItem>
        </asp:DropDownList>
        <br /></td>
</tr>
<tr style="text-align:left"><td>
        <asp:Label ID="lblCardNumber" runat="server" 
            BorderStyle="None" Text="Card number:" 
            Width="100px" /></td><td>
        <asp:TextBox ID="txtCardNumber" runat="server" /></td>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator8" runat="server" 
            ControlToValidate="txtCardNumber"
            ErrorMessage="Required." Display="Dynamic" />
        </tr>
<tr style="text-align:left"><td>
        <asp:Label ID="lblExpMonth" runat="server" 
            BorderStyle="None" Text="Exp. Month:" 
            Width="100px" /></td><td>
        <asp:DropDownList ID="ddlExpirationMonth" 
            runat="server">
          <asp:ListItem Value="1">January</asp:ListItem>
          <asp:ListItem Value="2">February</asp:ListItem>
          <asp:ListItem Value="3">March</asp:ListItem>
          <asp:ListItem Value="4">April</asp:ListItem>
          <asp:ListItem Value="5">May</asp:ListItem>
          <asp:ListItem Value="6">June</asp:ListItem>
          <asp:ListItem Value="7">July</asp:ListItem>
          <asp:ListItem Value="8">August</asp:ListItem>
          <asp:ListItem Value="9">September</asp:ListItem>
          <asp:ListItem Value="10">October</asp:ListItem>
          <asp:ListItem Value="11">November</asp:ListItem>
          <asp:ListItem Value="12">December</asp:ListItem>
        </asp:DropDownList>
        <br /></td>
</tr><tr style="text-align:left"><td>
        <asp:Label ID="lblExpYear" runat="server" 
            BorderStyle="None" Text="Exp. Year:" 
            Width="100px" /></td><td>
        <asp:TextBox ID="txtExpirationYear" runat="server" 
            Width="82px" />
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator9" runat="server" 
            ControlToValidate="txtExpirationYear"
            ErrorMessage="Required." Display="Dynamic" />
          <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtExpirationYear" Display="Dynamic" ErrorMessage="Incorrect date." MaximumValue="2099" MinimumValue="2005" Type="Integer"></asp:RangeValidator></td>
        </tr>
                     </table>
      </asp:WizardStep>
      <asp:WizardStep ID="WizardStep2" runat="server" Title="Confirmation">
        <table style="background-color:#ffffff;margin:10px;padding:10px;border:1px solid black;">
<tr><td colspan ="2"> Your order is ready to be processed.<br /><br /></td></tr>
<tr><td>
        <asp:Label ID="SubtotalLabel" runat="server" 
            BorderStyle="None" Text="Subtotal:" 
            Width="80px" /></td><td>
        <asp:Label ID="lblSubtotal" runat="server" /></td>


</tr><tr><td>
        <asp:Label ID="SalesTaxLabel" runat="server" 
            BorderStyle="None" Text="Sales Tax:" 
            Width="80px" /><hr /></td>
        <td><asp:Label ID="lblSalesTax" runat="server" /> <hr /></td>
</tr>
<tr><td>
        <asp:Label ID="TotalLabel" runat="server" 
            BorderStyle="None" Text="Total:" 
            Width="80px" /></td>
       <td> <asp:Label ID="lblTotal" runat="server" /></td>
      </tr> <tr><td colspan ="2"><br /> <br /><br />Click Finish to submit your order.<br /></td></tr>
            </table>
      </asp:WizardStep>

        </WizardSteps>
    </asp:Wizard>

    </div>
    <br />
    <asp:Label ID="Label1" runat="server" Text="" Font-Size="Large" Font-Bold="True" ForeColor="Red"></asp:Label>

</div></div>


    <!-- END CHECKOUT WIZARD -->
</asp:PlaceHolder>

        </div>
<div class="group"></div>
</div>
</div>

       








</asp:Content>

