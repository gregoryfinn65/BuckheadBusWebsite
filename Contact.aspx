<%@ Page Title="" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Contact Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            float: left;
        }
        .auto-style5 {
            width: 100%;
            float: left;
        }
        .auto-style8 {
            width: 520px;
            height: 25px;
        text-align: right;
    }
        .auto-style9 {
            height: 25px;
        }
        .auto-style10 {
            float: right;
        }
        .auto-style12 {
        height: 31px;
    }
    .auto-style13 {
        width: 520px;
        height: 20px;
    }
    .auto-style14 {
        height: 20px;
    }
    .auto-style15 {
        width: 520px;
        height: 31px;
        text-align: right;
    }
    .auto-style16 {
        width: 520px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="section bg">
<div class="container">
<h1>Contact Us</h1>
    <div>
    <table class="auto-style5" align="right">
        <tr>
            <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name:</td>
            <td class="auto-style12">
                <asp:TextBox ID="txtName" runat="server" CssClass="auto-style4"></asp:TextBox><asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Please Enter a Name" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">Email Address:</td>
            <td class="auto-style12">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style4"></asp:TextBox><asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please Enter a Valid Email" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Please Enter an Email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">Phone Number:</td>
            <td class="auto-style12">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="auto-style4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Questions, Concerns, or Request:</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtQ" runat="server" CssClass="auto-style4" Height="110px" Width="310px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="auto-style10" />
            </td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="auto-style4" />
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                </td>
            <td class="auto-style14">
                </td>
        </tr>
        <tr>
            <td class="auto-style16">
                &nbsp;</td>
            <td class="left">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    



    </div>
    </div>
</asp:Content>

