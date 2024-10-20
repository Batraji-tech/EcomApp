<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Order" %>
<%@ page import="java.util.Iterator" %>

<html>
<head>
    <title>Order Commissions</title>
    <style>
        body {
            background-color: #F2EED7; /* Soft background */
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }
        h2 {
            color: #FF9874; /* Soft orange */
            text-align: center;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="date"], input[type="submit"] {
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
            border: 1px solid #295F98; /* Dark blue */
        }
        input[type="submit"] {
            background-color: #295F98; /* Dark blue */
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #1a3a6e; /* Darker blue */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th {
            background-color: #295F98; /* Dark blue */
            color: white; /* White text */
            padding: 10px;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        tbody tr:hover {
            background-color: #f1f1f1; /* Light gray for row hover */
        }
    </style>
</head>
<body>
    <h2>Order Commissions</h2>
    <form action="/superAdmin/commissions/getCommissionsData" method="post">
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" required>
        
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" required>
        
        <input type="submit" value="Filter">
    </form>

    <table border="1">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Total Amount</th>
                <th>Commission (1%)</th>
                <th>Payment Method</th>
                <th>Status</th>
                <th>Order Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                for (Order order : orders) {
            %>
                <tr>
                    <td><%= order.getOrderId() %></td>
                    <td><%= order.getUserId() %></td>
                    <td><%= order.getTotalAmount() %></td>
                    <td><%= order.getTotalAmount() * 0.01 %></td> <!-- Calculate commission directly -->
                    <td><%= order.getPaymentMethod() %></td>
                    <td><%= order.getStatus() %></td>
                    <td><%= order.getOrderDate() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <%
        Double totalCommissions = (Double) request.getAttribute("totalCommissions");
        if (totalCommissions != null) {
    %>
        <h3>Total Commissions: <%= totalCommissions %></h3>
    <%
        }
    %>
</body>
</html>
