<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="RestaurantProject.RegisterUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 350px; margin: 50px auto; padding: 25px; border: 1px solid #ccc; border-radius: 10px;">
        <h2>Create Account</h2>

        <label>Username:</label>
        <asp:TextBox ID="txtRegUser" runat="server" CssClass="form-control"></asp:TextBox>
        
        <br /><br />

        <label>Password:</label>
        <asp:TextBox ID="txtRegPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>

        <br /><br />
        
        <asp:Button ID="ButtonRegister" runat="server" Text="Register" OnClick="ButtonRegister_Click" />
        
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>