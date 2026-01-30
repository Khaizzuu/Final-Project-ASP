<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="Final_Project.Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="max-w-4xl mx-auto mt-10 bg-white shadow-xl rounded-2xl overflow-hidden border border-gray-100 font-sans">
    
            <div class="bg-emerald-50 p-8 border-b border-emerald-100 flex flex-col md:flex-row justify-between items-center gap-6">
        
                <div class="flex items-center gap-4">
                    <div class="w-12 h-12 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center shadow-sm">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold text-gray-800">Order Confirmed!</h2>
                        <p class="text-gray-500 text-sm">Thank you for dining with us.</p>
                    </div>
                </div>

                <div class="flex gap-8 text-right bg-white px-6 py-3 rounded-xl border border-emerald-100 shadow-sm">
                    <div>
                        <p class="text-xs text-gray-400 uppercase font-bold tracking-wider">Order ID</p>
                        <div class="text-lg font-bold text-gray-800">
                            #<asp:Label ID="lblOrderId" runat="server" Text="000"></asp:Label>
                        </div>
                    </div>
                    <div>
                        <p class="text-xs text-gray-400 uppercase font-bold tracking-wider">Date</p>
                        <div class="text-sm font-medium text-gray-600 mt-1">
                            <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                        </div>
                    </div>
                    <div>
                        <p class="text-xs text-gray-400 uppercase font-bold tracking-wider">Status</p>
                        <span class="inline-block mt-1 bg-emerald-100 text-emerald-700 text-xs px-3 py-1 rounded-full font-bold uppercase">
                            <asp:Label ID="lblStatus" runat="server" Text="Paid"></asp:Label>
                        </span>
                    </div>
                </div>
            </div>

            <div class="p-8">
                <h3 class="text-lg font-bold text-gray-700 mb-6">Order Summary</h3>
        
                <div class="overflow-x-auto border rounded-lg border-gray-200 mb-8">
                    <table class="w-full text-left border-collapse">
                        <thead class="bg-gray-50 text-gray-500 uppercase text-xs font-bold tracking-wider">
                            <tr>
                                <th class="p-4 border-b">Item Name</th>
                                <th class="p-4 border-b text-center">Quantity</th>
                                <th class="p-4 border-b text-right">Price</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            <asp:Repeater ID="rptOrderItems" runat="server">
                                <ItemTemplate>
                                    <tr class="hover:bg-gray-50 transition">
                                        <td class="p-4 font-medium text-gray-700">
                                            <%# Eval("name") %>
                                        </td>
                                        <td class="p-4 text-center">
                                            <span class="inline-block bg-gray-100 text-gray-600 px-3 py-1 rounded font-bold text-xs">
                                                x<%# Eval("quantity") %></span></td>
                                        <td class="p-4 text-right font-semibold text-gray-900">
                                            RM <%# Eval("price_at_order", "{0:N2}") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>

                <div class="flex flex-col md:flex-row justify-between items-center gap-6 border-t pt-8">
            
                    <div class="flex gap-4 w-full md:w-auto">
                        <asp:Button ID="menuBtn" runat="server" Text="Start New Order" 
                            CssClass="bg-emerald-600 hover:bg-emerald-700 text-white font-bold py-3 px-6 rounded-lg shadow transition transform hover:-translate-y-0.5 cursor-pointer" OnClick="menuBtn_Click" />
                
                        <asp:Button ID="orderHistoryBtn" runat="server" Text="Order History" 
                            CssClass="bg-white hover:bg-gray-50 text-gray-700 font-semibold py-3 px-6 rounded-lg border border-gray-300 transition cursor-pointer" OnClick="orderHistoryBtn_Click" />
                    </div>

                    <div class="text-right">
                        <span class="text-gray-500 text-sm font-medium uppercase tracking-wide mr-4">Total Paid <span class="text-gray-500 text-sm font-medium uppercase tracking-wide mr-4">Total Paid</span>
                        <span class="text-4xl font-extrabold text-emerald-600">
                            RM <asp:Label ID="lblGrandTotal" runat="server" Text="0.00"></asp:Label>
                        </span>
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
