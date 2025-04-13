<%@ page import="java.util.*, com.cafe.dao.MenuDAO, com.cafe.model.MenuItem" %>
<%
    // Fetch menu items from the database
    List<MenuItem> menuList = MenuDAO.getAllMenuItems();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jakarta.servlet.http.*" %>
<%
    // Retrieve the cart from the session (initialize if not exists)
    List<String> cart = (List<String>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    // Add items to the cart if requested
    String item = request.getParameter("item");
    String price = request.getParameter("price");
    if (item != null && price != null) {
        cart.add(item + " - Rs " + price);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - FOOD PLACE CAFE - Restaurant</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #a8e063, #56ab2f);
            color: white;
            font-family: 'Poppins', sans-serif;
            padding: 20px;
        }

        .container-wrapper {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            max-width: 1200px;
            margin: auto;
        }

        .menu-container, .cart-container {
            flex: 1 1 500px;
            background: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
        }

        .menu-title, .cart-title {
            text-align: center;
            margin-bottom: 20px;
        }

        .menu-section {
            margin-bottom: 30px;
        }

        .menu-section h2 {
            background: #ffcc00;
            padding: 10px;
            border-radius: 8px;
            color: black;
        }

        .menu-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #666;
        }

        .menu-item:last-child {
            border-bottom: none;
        }

        .btn-warning {
            font-size: 14px;
        }

        .cart-title {
            background: #333;
            padding: 10px;
            border-radius: 8px;
        }

        .cart-items {
            color: #ffd700;
            margin-bottom: 8px;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .btn-container a {
            width: 48%;
        }

        @media (max-width: 768px) {
            .container-wrapper {
                flex-direction: column;
            }
            .btn-container {
                flex-direction: column;
                gap: 10px;
            }
            .btn-container a {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <div class="container-wrapper">
        <!-- Menu Section -->
        <div class="menu-container">
            <h1 class="menu-title">🍽️ FOOD PLACE CAFE - Menu</h1>

            <div class="menu-section">
                <h2>Main Course</h2>
                <div class="menu-item">
                    <span>Cheeseburger - Rs 34</span>
                    <a href="menu.jsp?item=Cheeseburger&price=34" class="btn btn-sm btn-warning">Add</a>
                </div>
                <div class="menu-item">
                    <span>Cheese Sandwich - Rs 22</span>
                    <a href="menu.jsp?item=Cheese Sandwich&price=22" class="btn btn-sm btn-warning">Add</a>
                </div>
                <div class="menu-item">
                    <span>Chicken Burgers - Rs 23</span>
                    <a href="menu.jsp?item=Chicken Burgers&price=23" class="btn btn-sm btn-warning">Add</a>
                </div>
                <div class="menu-item">
                    <span>Spicy Chicken - Rs 33</span>
                    <a href="menu.jsp?item=Spicy Chicken&price=33" class="btn btn-sm btn-warning">Add</a>
                </div>
                <div class="menu-item">
                    <span>Hot Dog - Rs 24</span>
                    <a href="menu.jsp?item=Hot Dog&price=24" class="btn btn-sm btn-warning">Add</a>
                </div>
            </div>

            <div class="menu-section">
                <h2>Appetizers</h2>
                <div class="menu-item">
                    <span>Fruit Salad - Rs 13</span>
                    <a href="menu.jsp?item=Fruit Salad&price=13" class="btn btn-sm btn-warning">Add</a>
                </div>
                <div class="menu-item">
                    <span>Cocktails - Rs 12</span>
                    <a href="menu.jsp?item=Cocktails&price=12" class="btn btn-sm btn-warning">Add</a>
                </div>
                <div class="menu-item">
                    <span>Nuggets - Rs 14</span>
                    <a href="menu.jsp?item=Nuggets&price=14" class="btn btn-sm btn-warning">Add</a>
                </div>
            </div>

            <div class="menu-section">
                <h2>Beverages</h2>
                <div class="menu-item">
                    <span>Milk Shake - Rs 3</span>
                    <a href="menu.jsp?item=Milk Shake&price=3" class="btn btn-sm btn-warning">Add</a>
                </div>
                <div class="menu-item">
                    <span>Iced Tea - Rs 2</span>
                    <a href="menu.jsp?item=Iced Tea&price=2" class="btn btn-sm btn-warning">Add</a>
                </div>
                <div class="menu-item">
                    <span>Orange Juice - Rs 4</span>
                    <a href="menu.jsp?item=Orange Juice&price=4" class="btn btn-sm btn-warning">Add</a>
                </div>
            </div>
        </div>

        <!-- Cart Section -->
        <div class="cart-container">
            <h2 class="cart-title">🛒 Your Cart</h2>
            <%
                if (cart.isEmpty()) {
                    out.println("<p>Your cart is empty.</p>");
                } else {
                    for (String cartItem : cart) {
                        out.println("<p class='cart-items'>" + cartItem + "</p>");
                    }
            %>
            <form action="order.jsp" method="post">
                <button type="submit" class="btn btn-success w-100 mt-2">Proceed to Order</button>
            </form>
            <% } %>

            <div class="btn-container mt-4">
                <a href="dashboard.jsp" class="btn btn-secondary">🔙 Back to Dashboard</a>
                <a href="order.jsp" class="btn btn-primary">📦 View Orders</a>
            </div>
        </div>
    </div>

</body>
</html>
