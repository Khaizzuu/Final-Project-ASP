<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="statusOrder.aspx.cs" Inherits="Final_Project.statusOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="max-w-3xl mx-auto my-10 font-sans text-slate-700">
            <h2 class="text-2xl font-bold text-slate-800 mb-6">My Order History</h2>

            <asp:Repeater ID="rptOrders" runat="server" OnItemDataBound="rptOrders_ItemDataBound">
                <ItemTemplate>
            
                    <div class="bg-white rounded-xl border border-slate-200 shadow-sm hover:shadow-lg transition-all duration-300 overflow-hidden mb-8">
                
                        <div class="bg-slate-50 px-6 py-4 border-b border-slate-100 flex justify-between items-center">
                            <div>
                                <h3 class="text-lg font-bold text-slate-800">
                                    Order #<%# Eval("order_id") %>
                                </h3>
                                <span class="text-xs text-slate-500 uppercase tracking-wide">
                                    Placed on <%# Eval("order_date", "{0:dd MMM yyyy}") %>
                                </span>
                            </div>
                    
                            <span class="<%# GetStatusClasses(Eval("name")) %>">
                                <%# Eval("name") %>
                            </span>
                        </div>

                        <div class="p-0">
                            <table class="w-full text-left border-collapse">
                                <thead class="bg-white text-xs font-semibold text-slate-400 uppercase tracking-wider border-b border-slate-100">
                                    <tr>
                                        <th class="px-6 py-3">Item</th>
                                        <th class="px-6 py-3 text-right">Qty</th>
                                        <th class="px-6 py-3 text-right">Price</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-50">
                                    <asp:Repeater ID="rptItems" runat="server">
                                        <ItemTemplate>
                                            <tr class="hover:bg-slate-50 transition-colors">
                                                <td class="px-6 py-3 text-sm font-medium text-slate-700">
                                                    <%# Eval("name") %>
                                                </td>
                                                <td class="px-6 py-3 text-sm text-slate-500 text-right">
                                                    x<%# Eval("quantity") %>
                                                </td>
                                                <td class="px-6 py-3 text-sm font-bold text-slate-700 text-right">
                                                    RM <%# Eval("price_at_order", "{0:N2}") %>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>

                        <div class="bg-white px-6 py-4 border-t border-slate-100 flex justify-end items-center gap-3">
                            <span class="text-sm text-slate-500">Total Amount:</span>
                            <span class="text-xl font-extrabold text-emerald-600">
                                RM <%# Eval("total_amount", "{0:N2}") %>
                            </span>
                        </div>

                    </div>

                </ItemTemplate>
            </asp:Repeater>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-red-500 font-bold"></asp:Label>
        </div>
    </form>
</body>
</html>
