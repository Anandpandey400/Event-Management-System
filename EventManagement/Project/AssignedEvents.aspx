<%@ Page Title="" Language="C#" MasterPageFile="~/Project/MasterPageMain.master" AutoEventWireup="true" CodeFile="AssignedEvents.aspx.cs" Inherits="Project_AssignedEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function Redirect(lnk)
        {
             var row = lnk.parentNode.parentNode;
            var rowIndex = row.rowIndex - 1;
            var ID = row.cells[0].innerText;
            window.location = "http://localhost:51060/Project/Participants.aspx?ID=" + ID + "";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <center>
    <h3>ASSIGNED EVENT DETAILS</h3>
        <hr />
        <asp:Label ID="Label1" runat="server" Visible="false" Text=""></asp:Label>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                        <ContentTemplate>
        <asp:Label ID="LabelErr" runat="server" Font-Size="X-Large" Text="Currently, None of the Event Assigned" ForeColor="#666666" Visible="False"></asp:Label>
        <asp:GridView ID="GridView1" CssClass="table table-bordered" AutoGenerateColumns="false" Width="80%" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
        <Columns>
            <asp:BoundField HeaderText="Id" DataField="ID" />
                <asp:BoundField HeaderText="Event Name" DataField="Name" />
            <asp:BoundField HeaderText="Date" DataField="Date" />
                <asp:BoundField HeaderText="College Name" DataField="College" />
            <asp:BoundField HeaderText="Type" DataField="Type" />
            <asp:BoundField HeaderText="Teacher" DataField="Teacher" />
            <asp:BoundField HeaderText="Fees" DataField="Fees" />
            <asp:TemplateField>
                        <ItemTemplate>
                             <asp:LinkButton ID="LinkButtonViewDet" Font-Bold="true" runat="server" OnClientClick="return Redirect(this)" ForeColor="#0066ff">VIEW DETAILS</asp:LinkButton>&nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
        </Columns>
        </asp:GridView>
                            </ContentTemplate>
            </asp:UpdatePanel>
            <br /><br /><br />
</asp:Content>

