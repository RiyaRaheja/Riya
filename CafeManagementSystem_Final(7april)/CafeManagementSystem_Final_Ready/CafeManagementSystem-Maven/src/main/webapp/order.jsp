<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jakarta.servlet.http.*" %>
<%
    // Retrieve cart items from session
    List<String> cart = (List<String>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("menu.jsp"); // Redirect if cart is empty
        return;
    }

    // Calculate total price
    double totalPrice = 0.0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Summary</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #222;
            color: white;
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .order-container {
            max-width: 800px;
            margin: auto;
            background: black;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
        }
        .order-title {
            text-align: center;
            margin-bottom: 20px;
        }
        .order-item {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #444;
        }
        .total {
            font-size: 20px;
            font-weight: bold;
            color: yellow;
        }
        .print-container {
            background: white;
            color: black;
            padding: 20px;
            border-radius: 10px;
            margin-top: 40px;
        }
        .print-title {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }
        .print-item {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #ddd;
            padding: 5px 0;
        }
        .print-total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
        }
        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="order-container">
        <h1 class="order-title">🛒 Order Summary</h1>

        <div class="order-list">
            <%
                for (String cartItem : cart) {
                    String[] parts = cartItem.split(" - Rs "); // Extract item and price
                    String itemName = parts[0];
                    double itemPrice = Double.parseDouble(parts[1]);
                    totalPrice += itemPrice;
            %>
            <div class="order-item">
                <span><%= itemName %></span>
                <span>Rs <%= itemPrice %></span>
            </div>
            <% } %>
        </div>

        <div class="order-item total">
            <span>Total Amount:</span>
            <span>Rs <%= totalPrice %></span>
        </div>

        <!-- Buttons for Printing & Navigation -->
        <div class="btn-container">
            <button class="btn btn-primary" onclick="printBill()">🖨️ Print Bill</button>
            <a href="menu.jsp" class="btn btn-warning">🍽️ Back to Menu</a>
            <a href="dashboard.jsp" class="btn btn-secondary">🔙 Back to Dashboard</a>
        </div>
    </div>

    <!-- Visible Print Bill Section (Receipt at Bottom) -->
    <div id="printSection" class="print-container">
        <h2 class="print-title">FOOD PLACE CAFE</h2>
        <p>📍 Kharar, Mohali</p>
        <hr>
        <h3>Order Receipt</h3>
        <div>
            <%
                for (String cartItem : cart) {
                    String[] parts = cartItem.split(" - Rs ");
                    String itemName = parts[0];
                    double itemPrice = Double.parseDouble(parts[1]);
            %>
            <div class="print-item">
                <span><%= itemName %></span>
                <span>Rs <%= itemPrice %></span>
            </div>
            <% } %>
        </div>
        <hr>
        <div class="print-total">
            <strong>Total: Rs <%= totalPrice %></strong>
        </div>
        <p style="text-align:center; margin-top:10px;">Thank you for your order! 🍽️</p>
    </div>

    <script>
        function printBill() {
            var printContent = document.getElementById("printSection").innerHTML;
            var originalContent = document.body.innerHTML;

            document.body.innerHTML = printContent;
            window.print();
            document.body.innerHTML = originalContent;
        }
    </script>

</body>
</html>
<%
    // Clear the cart after order is placed
    session.removeAttribute("cart");
%>
