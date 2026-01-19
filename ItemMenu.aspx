<%@ Page Title="Burger Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemMenu.aspx.cs" Inherits="Final_Project.ItemMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .menu-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .menu-title {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 2.5em;
        }
        
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            padding: 20px 0;
        }
        
        .menu-item {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            background: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.15);
        }
        
        .item-image {
            border-radius: 8px;
            margin-bottom: 15px;
        }
        
        .item-name {
            font-weight: bold;
            font-size: 1.3em;
            color: #333;
            margin: 10px 0;
        }
        
        .item-description {
            color: #666;
            font-size: 0.95em;
            margin: 10px 0;
            line-height: 1.4;
        }
        
        .item-price {
            font-size: 1.2em;
            font-weight: bold;
            color: #e74c3c;
            margin: 15px 0;
        }
        
        .add-cart-btn {
            background-color: #27ae60;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .add-cart-btn:hover {
            background-color: #219a52;
        }
    </style>

    <div class="menu-container">
        <h1 class="menu-title">🍔 Our Delicious Burger Menu</h1>
        
        <div class="menu-grid">
            <asp:Repeater ID="RepeaterMenu" runat="server" OnItemCommand="RepeaterMenu_ItemCommand">
                <ItemTemplate>
                    <div class="menu-item">
                        <asp:Image ID="ItemImage" runat="server" 
                            ImageUrl='<%# Eval("image_url") %>' 
                            AlternateText='<%# Eval("name") %>'
                            CssClass="item-image"
                            Width="250px" 
                            Height="200px" />
                        
                        <div class="item-name">
                            <%# Eval("name") %>
                        </div>
                        
                        <div class="item-description">
                            <%# Eval("description") %>
                        </div>
                        
                        <div class="item-price">
                            RM <%# Eval("price", "{0:F2}") %>
                        </div>
                        
                        <asp:Button ID="AddToCartBtn" runat="server" 
                            Text="Add to Cart" 
                            CssClass="add-cart-btn"
                            CommandName="AddToCart" 
                            CommandArgument='<%# Eval("menu_item_id") %>' />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>



