<%@ Page Title="Trip Report" Language="VB" MasterPageFile="~/BuckheadBusMasterPage.master" AutoEventWireup="false" CodeFile="ReportsMainPage.aspx.vb" Inherits="AdminPages_ReportsMainPage" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">Reporting Main Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="section bg">
<div class="container">
<h1>Reports</h1>
    <p><h3>Trip Report</h3></p>
       <div class="centerdiv">
        
           <br />
           <br />
           <br />
           
           <br />
           <br />
           <br />
           <br />
           <br />
           <br />
           <br />
           <br />
           
           <br />
           <rsweb:ReportViewer ID="ReportViewer4" runat="server" Font-Names="Verdana" Font-Size="8pt" style="margin-right: 132px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="800px">
               <LocalReport ReportPath="AdminPages\TripReport.rdlc">
                   <DataSources>
                       <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                   </DataSources>
               </LocalReport>
           </rsweb:ReportViewer>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BuckheadBusDatabaseConnectionString1 %>" SelectCommand="SELECT * FROM [TRIP]"></asp:SqlDataSource>
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
           
    </div>
    
</div>
</div>
</asp:Content>

