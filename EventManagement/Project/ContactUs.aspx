<%@ Page Title="" Language="C#" MasterPageFile="~/Project/MasterPageMain.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
        }
        .contact-form {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
    <div class="container">
        <h1>Contact Us</h1>
        <div class="contact-form">
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="Mesage"></asp:Label>
            <asp:TextBox ID="message" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lmessage" runat="server"></asp:Label>
            <asp:Button ID="Button1" OnClick="hh_click" runat="server" Text="Send" />

        </div>
    </div>

    <br />
</asp:Content>

