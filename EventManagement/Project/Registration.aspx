<%@ Page Title="" Language="C#" MasterPageFile="~/Project/MasterPageMain.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <div class="well form-horizontal" style="width:60%">
        <h2 style="text-align:center"><b>Registration Form</b></h2>
        <hr><br />
        
        <div class="wrapper">
            <div class="form-group">
                <label class="col-md-5 control-label">Student ID :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxID" ReadOnly="true" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-5 control-label">Name :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxName" placeholder="enter your full name" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                </div>
            </div>

            
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
                <label class="col-md-5 control-label">Age :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxAge" placeholder="enter your age" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-5" for="dob">College Name :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxClgName" placeholder="enter your college name" CssClass="form-control" runat="server" required></asp:TextBox>
                    </div>
                </div>
            </div>

            
            <div class="form-group">
                <label class="col-md-5 control-label">Password :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxPass" placeholder="enter a password" CssClass="form-control" runat="server" TextMode="Password" required></asp:TextBox>
                    </div>
                </div>
            </div>

            
            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4">
                    <br>
                    <asp:Button ID="ButtonSubmit" CssClass="btn btn-success" runat="server" Text="SUBMIT" onclick="ButtonSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
        </center>
</asp:Content>

