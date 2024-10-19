<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ecom.app.entities.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Category Sales Analysis</title>
    <style>
        body {
            background-color: #F2EED7;
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }
        .report-container {
            border: 1px solid #295F98;
            border-radius: 10px;
            background-color: #ffffff;
            padding: 40px;
            margin: 0 auto;
            max-width: 600px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #FF9874;
            margin-bottom: 20px;
            text-align: center;
        }
        .btn-submit {
            background-color: #295F98;
            border-color: #295F98;
            color: white;
            font-size: 16px;
            width: 100%;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #1a3a6e;
            border-color: #1a3a6e;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #295F98;
            color: white;
        }
        tbody tr:hover {
            background-color: #f1f1f1;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #295F98;
        }
    </style>
</head>
<body>

    <div class="report-container">
        <h2>Category Sales Analysis</h2>

        <form action="/order/salesByCategory" method="get">
            <div class="form-group">
                <label for="categoryId">Category ID:</label>
                <input type="number" name="categoryId" id="categoryId" required>
            </div>
            <button type="submit" class="btn-submit">Get Sales Data</button>
        </form>

        <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
        %>

        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User ID</th>
                    <th>Total Amount</th>
                    <th>Payment Method</th>
                    <th>Status</th>
                    <th>Order Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (orders != null && !orders.isEmpty()) {
                        for (Order order : orders) {
                %>
                    <tr>
                        <td><%= order.getOrderId() %></td>
                        <td><%= order.getUserId() %></td>
                        <td><%= order.getTotalAmount() %></td>
                        <td><%= order.getPaymentMethod() %></td>
                        <td><%= order.getStatus() %></td>
                        <td><%= order.getOrderDate().toLocalDate() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6">No sales data found for this category.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="footer">
        © 2024 Shopology. All rights reserved.
    </div>

</body>
</html>
