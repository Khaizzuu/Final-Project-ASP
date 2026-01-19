<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Final_Project.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="max-w-4xl mx-auto mt-12 p-8 bg-white shadow-xl rounded-2xl border border-gray-100">
            <asp:Panel ID="Panel2" runat="server">
        
                <h2 class="text-2xl font-bold text-gray-800 mb-6 flex items-center gap-2">
                    🛒 Your Shopping Cart
                </h2>

                <div class="overflow-x-auto rounded-lg border border-gray-200 mb-8">
                    <table class="min-w-full divide-y divide-gray-200">
                
                        <thead class="bg-gray-50">
                            <tr>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Name</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Quantity</th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Price</th>
                                <th scope="col" class="px-6 py-3 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Total</th>
                            </tr>
                        </thead>

                        <tbody class="bg-white divide-y divide-gray-200">
                            <asp:Repeater ID="rptCartItem" runat="server">
                                <ItemTemplate>
                                    <tr class="hover:bg-gray-50 transition-colors">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                            <%# Eval("name") %>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                            x <%# Eval("quantity") %>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                            RM <%# Eval("price", "{0:N2}") %>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-emerald-600 text-right">
                                            RM <%# Eval("total", "{0:N2}") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>

                <div class="flex flex-col items-end gap-4 border-t pt-6">
            
                    <div class="text-xl text-gray-700">
                        Total Amount: 
                        <span class="font-extrabold text-2xl text-emerald-600 ml-2">
                            RM <asp:Label ID="lblGrandTotal" runat="server" Text="0.00"></asp:Label>
                        </span>
                    </div>

                    <div class="w-full sm:w-auto">
                        <asp:Button ID="checkout" runat="server" Text="Proceed to Checkout" OnClick="checkout_Click" 
                            CssClass="w-full sm:w-auto bg-slate-900 hover:bg-slate-800 text-white font-bold py-3 px-8 rounded-lg shadow-lg transform transition hover:-translate-y-0.5 cursor-pointer" />
                    </div>
            
                    <asp:Label ID="lblPanel2" runat="server" CssClass="text-xs text-red-400 mt-2" Visible="false"></asp:Label>
                </div>

            </asp:Panel>


            <asp:Panel ID="Panel1" runat="server" CssClass="text-center py-16">
        
                <div class="mb-6 bg-gray-50 w-24 h-24 rounded-full flex items-center justify-center mx-auto">
                    <svg class="w-12 h-12 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path></svg>
                </div>
        
                <h3 class="text-2xl font-bold text-gray-800 mb-2">Your Cart is Empty</h3>
                <p class="text-gray-500 mb-8">
                    <asp:Label ID="lblPanel1" runat="server" Text="Looks like you haven't added anything yet."></asp:Label>
                </p>
        
                <asp:Button ID="returnMenuButton" runat="server" Text="Return to Menu" OnClick="returnMenuButton_Click" 
                    CssClass="inline-block bg-emerald-600 hover:bg-emerald-700 text-white font-semibold py-3 px-8 rounded-full transition shadow-md cursor-pointer" />

            </asp:Panel>

        </div>
    </form>
</body>
</html>
