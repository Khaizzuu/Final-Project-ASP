<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterUserRestaurant.aspx.cs" Inherits="Final_Project.RegisterUserRestaurant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register User</title>
</head>
<body>

    <form id="form1" runat="server">
      <div style="width: 350px; margin: 50px auto; padding: 20px; border: 1px solid #ccc; border-radius: 10px;">
            <h2>Register New User</h2>
            
            <label>Name (Username):</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                ControlToValidate="txtName" ErrorMessage="Name is required" 
                ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <br /><br />

            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="Email is required" 
                ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="Invalid email format" 
                ForeColor="Red" Display="Dynamic" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br /><br />

            <label>Password:</label>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPass" runat="server" 
                ControlToValidate="txtPass" ErrorMessage="Password is required" 
                ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <br /><br />

            <label>Confirm Password:</label>
            <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:CompareValidator ID="cvPass" runat="server" 
                ControlToValidate="txtConfirmPass" ControlToCompare="txtPass" 
                ErrorMessage="Passwords do not match" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
            <br /><br />

            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            <br /><br />
            
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <a href="LoginRestaurant.aspx">Already have an account? Login here</a>
        </div>
    </form>
</body>
</html>
