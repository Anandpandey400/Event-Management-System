<%@ Page Title="" Language="C#" MasterPageFile="~/Project/MasterPageMain.master" AutoEventWireup="true" CodeFile="ManageEvent.aspx.cs" Inherits="Project_ManageEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function AddEvent()
        {
            document.getElementById('<%=LabelTitle.ClientID%>').innerText = "ADD NEW EVENT";
            document.getElementById('<%=ButtonSubmit.ClientID%>').value = "ADD";
            document.getElementById('<%=HiddenBtnType.ClientID%>').value = "Add";
            
            document.getElementById('<%=txtName.ClientID%>').value = "";
            document.getElementById('<%=DropDownCollegeList.ClientID%>').value = "--Select--";
            document.getElementById('<%=DropDownListType.ClientID%>').value = "Indoor";
            document.getElementById('<%=DropDownTeacherList.ClientID%>').value = "--Select--";
            document.getElementById('<%=RadioButton1.ClientID%>').checked = false;
            document.getElementById('<%=RadioButton2.ClientID%>').checked = false;
            var today = new Date().toISOString().split('T')[0];
            document.getElementById('<%=txtDate.ClientID%>').value = today;

            $("#myModal").modal('show');
            return false;
        }

        function Validations()
        {
            var Name = document.getElementById('<%=txtName.ClientID%>').value;
            if (Name != "")
            {
                var Date = document.getElementById('<%=txtDate.ClientID%>').value;
                if (Date != "")
                {
                    var College = document.getElementById('<%=DropDownCollegeList.ClientID%>').value;
                    if (College != "" && College !="--Select--")
                    {
                        var Type = document.getElementById('<%=DropDownListType.ClientID%>').value;
                        if (Type != "")
                        {
                            var Teacher = document.getElementById('<%=DropDownTeacherList.ClientID%>').value;
                            if (Teacher != "" && Teacher!="--Select--")
                            {
                                if (Teacher != "--No Teacher Found--")
                                {
                                    if (document.getElementById('<%=RadioButton1.ClientID%>').checked == true)
                                    {
                                        var Fees = document.getElementById('<%=TextBoxFees.ClientID%>').value;
                                        if (Fees != "")
                                        {
                                            $("#myModal").modal('hide');
                                            return true;
                                        }
                                        else
                                        {
                                            alert("Fees field cannot be left blank");
                                            return false;
                                        }
                                    }
                                    else if (document.getElementById('<%=RadioButton2.ClientID%>').checked == true)
                                    {
                                        $("#myModal").modal('hide');
                                        return true;
                                    }
                                    else
                                    {
                                        alert("Kindly select Yes or No for Fees Registration");
                                        return false;
                                    }
                                }
                                else
                                {
                                    alert("Currently, None of the teacher is registered for selected college");
                                    return false;
                                }
                            }
                            else
                            {
                                alert("Kindly assign any one teacher");
                                return false;
                            }
                        }
                        else
                        {
                            alert("Kindly select any one Event Type");
                            return false;
                        }
                    }
                    else
                    {
                        alert("Kindly select any one college");
                        return false;
                    }
                }
                else
                {
                    alert("Date field cannot be left blank");
                    return false;
                }
            }
            else
            {
                alert("Event Name field cannot be left blank");
                return false;
            }
        }

        function Edit(lnk)
        {
            document.getElementById('<%=LabelTitle.ClientID%>').innerText = "UPDATE EVENT DETAILS";
            document.getElementById('<%=ButtonSubmit.ClientID%>').value = "UPDATE";
            document.getElementById('<%=HiddenBtnType.ClientID%>').value = "Update";
            var row = lnk.parentNode.parentNode;
            var rowIndex = row.rowIndex - 1;
            var ID = row.cells[0].innerText;
            var Name = row.cells[1].innerText;
            var Date = row.cells[2].innerText;
            var College = row.cells[3].innerText;
            var Type = row.cells[4].innerText;
            var Teacher = row.cells[5].innerText;
            var Cost = row.cells[6].innerText;

            document.getElementById('<%=txtTid.ClientID%>').value = ID;
            document.getElementById('<%=txtName.ClientID%>').value = Name;
            document.getElementById('<%=txtDate.ClientID%>').value = Date;
            document.getElementById('<%=DropDownCollegeList.ClientID%>').value = College;
            document.getElementById('<%=DropDownListType.ClientID%>').value = Type;
            document.getElementById('<%=DropDownTeacherList.ClientID%>').value = Teacher;
            
            if (Cost != "") {
                document.getElementById('<%=RadioButton1.ClientID%>').checked = true;
                document.getElementById('<%=RadioButton2.ClientID%>').checked = false;
                $("#show-me-one").show();
                document.getElementById('<%=TextBoxFees.ClientID%>').value = Cost;
            }
            else {
                document.getElementById('<%=RadioButton2.ClientID%>').checked = true;
                document.getElementById('<%=RadioButton1.ClientID%>').checked = false;
                $("#show-me-two").hide();
            }

            $("#myModal").modal('show');
            return false;
        }

        function DelConfirmation(lnk)
        {
            var row = lnk.parentNode.parentNode;
            var rowIndex = row.rowIndex - 1;
            var ID = row.cells[0].innerText;
            var Name = row.cells[1].innerText;
            document.getElementById('<%=HiddenDelProdID.ClientID%>').value = ID;
            document.getElementById("LabelPName").innerText = Name;
            $("#myModalDel").modal('show');
        }

        function DelYes() {
            $("#myModalDel").modal('hide');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
            $(document).ready(function ()
            {
                $("#show-me-one").hide();
        });
        </script>
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    
        
    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <asp:Label ID="LabelTitle" class="modal-title" Font-Bold="true" Font-Size="Medium" runat="server" Text=""></asp:Label>
                    <button type="button" style="color: red" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <label id="Label00" style="font-size: medium; margin-left: 5px">Event ID :</label><br />
                    <input type="text" runat="server" style="font-size: medium" readonly="readonly" class="form-control" id="txtTid" /><br />
                    <label id="Label0" style="font-size: medium; margin-left: 5px">Event Name :</label><br />
                    <input type="text" runat="server" style="font-size: medium" class="form-control" placeholder="write Event name here..." id="txtName" /><br />
                    <label id="Label1" style="font-size: medium; margin-left: 5px">Date :</label><br />
                    <input type="date" class="form-control" style="font-size: medium" runat="server" id="txtDate" />
                    <br />
                    <label id="Label2" style="font-size: medium; margin-left: 5px">College :</label><br />
                     <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                    <asp:DropDownList ID="DropDownCollegeList" CssClass="form-control" OnSelectedIndexChanged="DropDownCollegeList_SelectedIndexChanged" AutoPostBack="true" Font-Size="Medium" runat="server"></asp:DropDownList>
                            </ContentTemplate></asp:UpdatePanel><br />
                    <label id="Label3" style="font-size: medium; margin-left: 5px">Event Type :</label><br />
                    <asp:DropDownList ID="DropDownListType" CssClass="form-control" Font-Size="Medium" runat="server">
                        <asp:ListItem>Indoor</asp:ListItem>
                        <asp:ListItem>Outdoor</asp:ListItem>
                    </asp:DropDownList><br />
                     <label id="Label4" style="font-size: medium; margin-left: 5px">Assign Teacher :</label><br />
                     <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                    <asp:DropDownList ID="DropDownTeacherList" OnSelectedIndexChanged="DropDownTeacherList_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Enabled="false" Font-Size="Medium" runat="server"></asp:DropDownList>
                            <br />
                    <label id="Label5" style="font-size: medium; margin-left: 5px">Registration Fees :</label><br />
                            <asp:RadioButton ID="RadioButton1" Text="Yes" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true" runat="server" />
                            <asp:RadioButton ID="RadioButton2" Text="No" OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="true" runat="server" />
                    <br />
                            <div id='show-me-one'>
                    <asp:TextBox ID="TextBoxFees" Visible="false" runat="server" Font-Size="Medium" CssClass="form-control"></asp:TextBox>
                                </div>
                            </ContentTemplate></asp:UpdatePanel>
                    <br />
                    <input type="hidden" id="HiddenBtnType" runat="server" value="" name="hidden5" />
                    <asp:Label ID="LabelTid" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                    <button type="button" class="btn btn-round btn-danger" data-dismiss="modal">CLOSE</button>&nbsp;&nbsp;
                            <asp:Button ID="ButtonSubmit" runat="server" CssClass="btn btn-round btn-success" OnClientClick="return Validations()" OnClick="ButtonSubmit_Click" Text="" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                        </div>
            </div>
        </div>
    </div>

     <!-- Modal DELETE CONFIRMAION -->
    <div id="myModalDel" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color:crimson; color:white">
                    <asp:Label ID="Label5" class="modal-title" Font-Bold="true" Font-Size="Medium" runat="server" Text="DELETE"></asp:Label>
                    <button type="button" style="color: white" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <label id="LabelT" style="font-size: medium; color:#808080; margin-left: 5px">Selected College :</label>
                    <label id="LabelPName" style="font-size: large; color:#808080; margin-left: 5px"></label><br />
                    <label id="LabelMsg" style="font-size: x-large; color:black; margin-left: 5px">Are you sure ?</label><br />
                    <input type="hidden" id="HiddenDelProdID" runat="server" value="" name="hidden1" />
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <button type="button" class="btn btn-round btn-danger" style="margin-top:-6px; margin-bottom:-4px" data-dismiss="modal">NO</button>
                            &nbsp;&nbsp;
                            <asp:Button ID="ButtonDelConfirm" runat="server" style="margin-top:-6px; margin-bottom:-4px" CssClass="btn btn-round btn-success" OnClientClick="return DelYes()" OnClick="ButtonDelConfirm_Click" Text="YES"></asp:Button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
     <br />
    <center>
    <h3>MANAGE EVENT</h3>
        <hr />
        <asp:Label ID="Label1" runat="server" Visible="false" Text=""></asp:Label>
        <div class="row">
        <div class="col-lg-4">
            </div>
        <div class="col-lg-4">
            </div>
    <div class="col-lg-4">
                <asp:Button ID="ButtonAdd" CssClass="btn btn-round btn-info" runat="server" Text="ADD NEW EVENT" OnClientClick="return AddEvent()"></asp:Button>
            </div>
        </div>
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
                             <asp:LinkButton ID="LinkButtonEdit" Font-Bold="true" runat="server" OnClientClick="return Edit(this)" ForeColor="#0066ff">EDIT</asp:LinkButton>&nbsp;&nbsp;
                             <asp:LinkButton ID="LinkButtonDel" Font-Bold="true" runat="server" OnClientClick="return DelConfirmation(this)" ForeColor="Red">DELETE</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
        </Columns>
        </asp:GridView>
                            </ContentTemplate>
            </asp:UpdatePanel>
            <br /><br />
        <h3>COMPLETED EVENTS</h3>
        <hr />
        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Always">
                        <ContentTemplate>
        <asp:Label ID="LabelErr1" runat="server" Font-Size="X-Large" Text="Currently, None of the Event completed" ForeColor="#666666" Visible="False"></asp:Label>
        <asp:GridView ID="GridView2" CssClass="table table-bordered" AutoGenerateColumns="false" Width="80%" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
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
            <asp:BoundField HeaderText="Winner" DataField="Winner" />
        </Columns>
        </asp:GridView>
                            </ContentTemplate>
            </asp:UpdatePanel>
            <br /><br />
</asp:Content>

