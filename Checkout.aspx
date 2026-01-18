<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Final_Project.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel2" runat="server">
                <asp:Repeater ID="rptCartItem" runat="server">
                    <ItemTemplate>
                        <table>
                            <thead>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                            </thead>
                            <tr>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("quantity") %></td>
                                <td><%# Eval("price") %></td>
                                <td><%# Eval("total") %></td>
                            </tr>
                        </table>
        
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Button ID="checkout" runat="server" Text="Checkout" OnClick="checkout_Click" />
                <asp:Label ID="lblGrandTotal" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblPanel2" runat="server" Text="Label"></asp:Label>

            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Label ID="lblPanel1" runat="server" Text="Label"></asp:Label>
                <asp:Button ID="returnMenuButton" runat="server" Text="Return to Menu" OnClick="returnMenuButton_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
