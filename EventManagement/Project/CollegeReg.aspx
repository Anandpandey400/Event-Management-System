<%@ Page Title="" Language="C#" MasterPageFile="~/Project/MasterPageMain.master" AutoEventWireup="true" CodeFile="CollegeReg.aspx.cs" Inherits="Project_CollegeReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function AddTeacher()
        {
            document.getElementById('<%=LabelTitle.ClientID%>').innerText = "ADD NEW COLLEGE";
            document.getElementById('<%=ButtonSubmit.ClientID%>').value = "ADD";
            document.getElementById('<%=HiddenBtnType.ClientID%>').value = "Add";
            
            document.getElementById('<%=txtName.ClientID%>').value = "";
            document.getElementById('<%=txtEmail.ClientID%>').value = "";
            document.getElementById('<%=txtContact.ClientID%>').value = "";
            $("#myModal").modal('show');
            return false;
        }

        function Validations()
        {
            var Name = document.getElementById('<%=txtName.ClientID%>').value;
            if (Name != "")
            {
                var Email = document.getElementById('<%=txtEmail.ClientID%>').value;
                if (Email != "")
                {
                    var Date = document.getElementById('<%=txtContact.ClientID%>').value;
                    if (Date != "")
                    {
                        var Address = document.getElementById('<%=txtAddress.ClientID%>').value;
                        if (Address != "")
                        {
                            $("#myModal").modal('hide');
                            return true;
                        }
                        else
                        {
                            alert("Address field cannot be left blank");
                            return false;
                        }
                    }
                    else
                    {
                        alert("Contact field cannot be left blank");
                        return false;
                    }
                }
                else
                {
                    alert("Email field cannot be left blank");
                    return false;
                }
            }
            else
            {
                alert("Teacher Name field cannot be left blank");
                return false;
            }
        }

        function Edit(lnk)
        {
            document.getElementById('<%=LabelTitle.ClientID%>').innerText = "UPDATE COLLEGE DETAILS";
            document.getElementById('<%=ButtonSubmit.ClientID%>').value = "UPDATE";
            document.getElementById('<%=HiddenBtnType.ClientID%>').value = "Update";
            var row = lnk.parentNode.parentNode;
            var rowIndex = row.rowIndex - 1;
            var ID = row.cells[0].innerText;
            var Name = row.cells[1].innerText;
            var Email = row.cells[2].innerText;
            var Contact = row.cells[3].innerText;
            var Address = row.cells[4].innerText;

            document.getElementById('<%=txtTid.ClientID%>').value = ID;
            document.getElementById('<%=txtName.ClientID%>').value = Name;
            document.getElementById('<%=txtEmail.ClientID%>').value = Email;
            document.getElementById('<%=txtContact.ClientID%>').value = Contact;
            document.getElementById('<%=txtAddress.ClientID%>').value = Address;

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
                    <label id="Label00" style="font-size: medium; margin-left: 5px">College ID :</label><br />
                    <input type="text" runat="server" style="font-size: medium" readonly="readonly" class="form-control" id="txtTid" /><br />
                    <label id="Label0" style="font-size: medium; margin-left: 5px">College Name :</label><br />
                    <input type="text" runat="server" style="font-size: medium" class="form-control" placeholder="write College name here..." id="txtName" /><br />
                    <label id="Label1" style="font-size: medium; margin-left: 5px">Email :</label><br />
                    <input type="text" class="form-control" style="font-size: medium" runat="server" placeholder="write email id here..." id="txtEmail" />
                    <asp:RegularExpressionValidator ID="RxvEmail" runat="Server"
                        ControlToValidate="txtEmail" ErrorMessage="** Invalid Email Id!"
                        ForeColor="#990000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        Style="font-family: Calibri Light"></asp:RegularExpressionValidator>
                    <br />
                    <label id="Label2" style="font-size: medium; margin-left: 5px">Contact :</label><br />
                    <input type="number" class="form-control" runat="server" min="0" value="1" style="font-size: medium" id="txtContact" />
                    <asp:RegularExpressionValidator ID="RxvMobNo" runat="Server"
                        ControlToValidate="txtContact" ErrorMessage="** Invalid Mobile no."
                        ForeColor="#990000" ValidationExpression="^[0-9]*$"
                        Style="font-family: Calibri Light"></asp:RegularExpressionValidator><br />
                    <label id="Label3" style="font-size: medium; margin-left: 5px">Address :</label><br />
                    <textarea id="txtAddress" runat="server" class="form-control" placeholder="write full address here..." style="font-size:medium; height:100px"></textarea>
                    <input type="hidden" id="HiddenBtnType" runat="server" value="" name="hidden5" />
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
    <h3>MANAGE COLLEGE</h3>
        <hr />
        <asp:Label ID="LabelUid" runat="server" Visible="false" Text=""></asp:Label>
        <div class="row">
        <div class="col-lg-4">
            </div>
        <div class="col-lg-4">
            </div>
    <div class="col-lg-4">
                <asp:Button ID="ButtonAdd" CssClass="btn btn-round btn-info" runat="server" Text="ADD NEW COLLEGE" OnClientClick="return AddTeacher()"></asp:Button>
            </div>
        </div>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                        <ContentTemplate>
        <asp:Label ID="LabelErr" runat="server" Font-Size="X-Large" Text="Currently, None of the College registered" ForeColor="#666666" Visible="False"></asp:Label>
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
                <asp:BoundField HeaderText="College Name" DataField="Name" />
            <asp:BoundField HeaderText="Email ID" DataField="Email" />
                <asp:BoundField HeaderText="Contact" DataField="Contact" />
            <asp:BoundField HeaderText="College Address" DataField="Address" />
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
            <br /><br /><br />

<%--    <center>
    <div class="well form-horizontal" style="width:60%">
        <h2 style="text-align:center"><b>College Registration Form</b></h2>
        <hr><br />
        <!-- Text input-->
        <div class="wrapper">
            <div class="form-group">
                <label class="col-md-5 control-label">College ID :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxID" ReadOnly="true" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-5 control-label">College Name :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxName" placeholder="enter college name" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label">E-Mail :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxMail" placeholder="enter email address" CssClass="form-control" runat="server" required></asp:TextBox>

                    </div>
                    <asp:RegularExpressionValidator ID="RxvEmail" runat="Server"
                        ControlToValidate="TextBoxMail" ErrorMessage="** Invalid Email Id!"
                        ForeColor="#990000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        Style="font-family: Calibri Light"></asp:RegularExpressionValidator>
                </div>
            </div>


            <!-- Text input-->

            <div class="form-group">
                <label class="col-md-5 control-label">Contact No :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxPhn" placeholder="(+91)" CssClass="form-control" runat="server" Type="Number" required></asp:TextBox>
                    </div>
                    <asp:RegularExpressionValidator ID="RxvMobNo" runat="Server"
                        ControlToValidate="TextBoxPhn" ErrorMessage="** Invalid Mobile no."
                        ForeColor="#990000" ValidationExpression="^[7-9]\d{9}$"
                        Style="font-family: Calibri Light"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-5 control-label">Address :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxAdd" placeholder="enter college address" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4">
                    <br>
                    <asp:Button ID="ButtonSubmit" CssClass="btn btn-success" runat="server" Text="SUBMIT" onclick="ButtonSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
        </center>--%>
</asp:Content>

