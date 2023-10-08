<%@ Page Title="" Language="C#" MasterPageFile="~/Project/MasterPageMain.master" AutoEventWireup="true" CodeFile="Participants.aspx.cs" Inherits="Project_Participants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <center>
    <h3>EVENT DETAILS</h3>
        <hr />
        <asp:Label ID="LabelEid" runat="server" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="LabelEventName" runat="server" Text="" Font-Bold="True" Font-Names="Century Gothic" Font-Size="XX-Large"></asp:Label>
        <br />
        <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="Label1" Font-Names="Century Gothic" Font-Size="Large" runat="server"></asp:Label>
        <asp:DropDownList ID="DropDownListStudents" Visible="false" CssClass="form-control" Width="30%" Font-Size="Large" Font-Names="Century Gothic" runat="server"></asp:DropDownList>
            <asp:Label ID="LabelWinner" Visible="false" runat="server" Font-Bold="True" Font-Names="Century Gothic" ForeColor="#006600" Font-Size="X-Large" Text=""></asp:Label>
            <br />
        <asp:Button ID="ButtonSubmit" Visible="false" runat="server" OnClick="ButtonSubmit_Click" CssClass="btn btn-success" Text="Submit"></asp:Button>
        <br />
            </asp:Panel>
        <br />
        <asp:Label ID="LabelPrint" runat="server" Font-Names="Century Gothic" Font-Size="Large"></asp:Label>
        <%--<table style='width:80%'><tr><td rowspan='3' style='width: 6%; vertical-align: top; font-weight: bold; font-size: x-large;'>1.</td>
            <td style='font-size: large; font-weight: bold; text-align: left; background-color: #909090; color: #FFFFFF;' colspan='2'>&nbsp;&nbsp; Test Name</td></tr>
            <tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; TestName@gmail.com</td>
                <td rowspan='2' style='vertical-align: middle; font-size: large; padding-left: 0px; border-left-style: solid; border-left-width: 1px; border-left-color: #333333; text-align: center;'>Hiray College</td></tr>
            <tr><td style='width: 60%; text-align: left;'>&nbsp;&nbsp; 9876543210</td></tr></table><hr /><br />--%>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        </center>
</asp:Content>

