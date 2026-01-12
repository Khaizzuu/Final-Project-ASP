<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Final_Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>

    <div style="width: 300px; margin: 50px auto; padding: 20px; border: 1px solid #ccc; border-radius: 10px;">
        <h2>Login</h2>
        
        <label>Usernae:</label>
        <asp:TextBox ID="txtUser" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvUser" runat="server" 
            ControlToValidate="txtUser" ErrorMessage="Username is required" 
            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br /><br />

        <label>Password:</label>
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPass" runat="server" 
            ControlToValidate="txtPass" ErrorMessage="Password is required" 
            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br /><br />

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</html>
