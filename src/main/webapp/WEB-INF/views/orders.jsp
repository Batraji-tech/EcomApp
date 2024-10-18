<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Order" %>
<%@ page import="ecom.app.entities.CartItems" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css">
    <style>
        body {
            background-color: #F2EED7; /* Soft background */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .orders-container {
            margin: 20px;
        }
        h1 {
            color: #FF9874; /* Soft orange for headings */
            margin-bottom: 20px;
        }
        .order {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 15px;
            background-color: #f9f9f9;
        }
        .order h2 {
            color: #295F98; /* Dark blue for order titles */
        }
        .order-item {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 10px;
            background-color: #fff;
        }
        .order-total {
            font-weight: bold;
            margin-top: 10px;
            color: #295F98; /* Dark blue for total */
        }
        .message, .error {
            margin: 10px 0;
        }
        .error {
            color: red;
        }
        .message {
            color: green;
        }
    </style>
</head>
<body>

<%
    // Display messages from RedirectAttributes
    String error = (String) request.getAttribute("error");
    String message = (String) request.getAttribute("message");

    if (error != null) {
%>
        <div class="error"><%= error %></div>
<%
    }
    if (message != null) {
%>
        <div class="message"><%= message %></div>
<%
    }

    List<Order> orders = (List<Order>) request.getAttribute("orders"); // Retrieve orders from request
%>

<div class="orders-container">
    <h1>My Orders</h1>

<%
    if (orders != null && !orders.isEmpty()) {
        for (Order order : orders) {
%>
            <div class="order">
                <h2>Order #<%= order.getOrderId() %></h2>
                <p>Date: <%= order.getOrderDate() %></p>
                <%
                    List<CartItems> orderItems = order.getOrderItems();
                    for (CartItems item : orderItems) {
                %>
                    <div class="order-item">
                        <div class="item-details">
                            <h3><%= item.getProductName() %></h3>
                            <p>Price: ₹<%= item.getPrice() %></p>
                            <p>Quantity: <%= item.getQuantity() %></p>
                        </div>
                    </div>
                <%
                    }
                %>
                <div class="order-total">
                    Total: ₹<%= order.getTotalAmount() %>
                </div>
            </div>
<%
        }
    } else {
%>
        <p>You have no orders yet.</p>
<%
    }
%>
</div>

</body>
</html>