<%@ Page Title="" Language="C#" MasterPageFile="~/Project/MasterPageMain.master" AutoEventWireup="true" CodeFile="RegisteredEvents.aspx.cs" Inherits="Project_RegisteredEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function Confirmation(lnk)
        {
            var row = lnk.parentNode.parentNode;
            var rowIndex = row.rowIndex - 1;
            var ID = row.cells[0].innerText;
            var Name = row.cells[1].innerText;
            document.getElementById('<%=HiddenEventID.ClientID%>').value = ID;
            document.getElementById('<%=LabelName.ClientID%>').innerText = Name;
            $("#myModal").modal('show');
        }

        function Yes() {
            $("#myModal").modal('hide');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    
    
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            
            <div class="modal-content">
                <div class="modal-header" style="background-color: crimson; color: white">
                    <asp:Label ID="Label5" class="modal-title" Font-Bold="true" Font-Size="Medium" runat="server" Text="CONFIRM CANCELLATION"></asp:Label>
                    <button type="button" style="color: white" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <label id="LabelT" style="font-size: medium; color: #808080; margin-left: 5px">Selected Event :</label>
                    <asp:Label ID="LabelName" runat="server" Font-Size="Large" ForeColor="#808080"></asp:Label>
                    <br />
                    <label id="LabelMsg" style="font-size: x-large; color: black; margin-left: 5px">Are you sure ?</label><br />
                    <input type="hidden" id="HiddenEventID" runat="server" value="" name="hidden1" />
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <button type="button" class="btn btn-round btn-danger" style="margin-top: -6px; margin-bottom: -4px" data-dismiss="modal">NO</button>
                            &nbsp;&nbsp;
                            <asp:Button ID="ButtonConfirm" runat="server" Style="margin-top: -6px; margin-bottom: -4px" CssClass="btn btn-round btn-success" OnClientClick="return Yes()" OnClick="ButtonConfirm_Click" Text="YES"></asp:Button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <br />
    <center>
    <h3>REGISTERED EVENT DETAILS</h3>
        <hr />
        <asp:Label ID="Label1" runat="server" Visible="false" Text=""></asp:Label>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                        <ContentTemplate>
        <asp:Label ID="LabelErr" runat="server" Font-Size="X-Large" Text="Currently, None of the Event registered" ForeColor="#666666" Visible="False"></asp:Label>
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
                             <asp:LinkButton ID="LinkButtonCancel" Font-Bold="true" runat="server" OnClientClick="return Confirmation(this)" ForeColor="#0066ff">CANCEL</asp:LinkButton>&nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
        </Columns>
        </asp:GridView>
                            </ContentTemplate>
            </asp:UpdatePanel>
            <br /><br /><br />
</asp:Content>

