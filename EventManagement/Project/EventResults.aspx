<%@ Page Title="" Language="C#" MasterPageFile="~/Project/MasterPageMain.master" AutoEventWireup="true" CodeFile="EventResults.aspx.cs" Inherits="Project_EventResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <h3>EVENT RESULTS</h3>
        <hr />
        <asp:Label ID="Label1" runat="server" Visible="false" Text=""></asp:Label>
        <br />
        <asp:Label ID="LabelPrint" runat="server" Font-Names="Century Gothic" Font-Size="Large"></asp:Label>
<%--         <table style='width:80%'><tr><td rowspan='4' style='width: 3%; vertical-align: top; font-weight: bold; font-size: x-large; background-color: #000000; color: #FFFFFF; text-align: center;'>1.</td>
            <td style='font-size: large; font-weight: bold; text-align: left; background-color: #000000; color: #FFFFFF;' colspan='2'>&nbsp;&nbsp; Event Name</td></tr>
            <tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; Held In : <strong>Hiray College</strong></td>
            <td rowspan='3' style='vertical-align: middle; font-size: large; padding-left: 0px; border-left-style: solid; border-left-width: 1px; border-left-color: #333333; text-align: center;'>Won by <strong>Test Name</strong></td></tr>
            <tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; Type : <strong>Indoor</strong></td></tr>
            <tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; Date :&nbsp;<strong>13/09/2018</strong></td></tr></table><hr /><br />--%>
        </center>
</asp:Content>

