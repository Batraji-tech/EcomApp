<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ecom.app.entities.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sales Performance Report</title>
    <style>
        body {
            background-color: #F2EED7; /* Soft background */
            font-family: 'Arial', sans-serif;
            padding: 0;
            margin: 0;
        }
        .report-container {
            border: 1px solid #295F98; /* Dark blue */
            border-radius: 10px;
            background-color: #ffffff; /* White */
            padding: 40px;
            margin: 20px auto;
            max-width: 800px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* Align items to the left */
        }
        h2 {
            color: #FF9874; /* Soft orange */
            margin-bottom: 20px;
            text-align: center; /* Left-align heading */
            font-size: 28px;
            width: 100%; /* Full width for left alignment */
        }
        .form-group {
            display: flex;
            flex-direction: column;
            width: 100%;
            margin-bottom: 20px;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #295F98; /* Dark blue */
        }
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #295F98; /* Dark blue */
            border-radius: 5px;
            font-size: 16px;
        }
        .btn-submit {
            background-color: #295F98; /* Dark blue */
            border: none;
            color: white;
            font-size: 18px;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-submit:hover {
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
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }
        tbody tr:hover {
            background-color: #f9f9f9; /* Light gray for row hover */
        }
       
        @media (max-width: 600px) {
            .report-container {
                padding: 20px;
            }
            h2 {
                font-size: 24px;
            }
            .btn-submit {
                font-size: 16px;
            }
            th, td {
                font-size: 14px;
                padding: 8px;
            }
        }
    </style>
</head>
<body>

    <div class="report-container">
        <h2>Sales Performance Report</h2>

        <form action="/superAdmin/salesPerformance/getSalesData" method="post">
            <div class="form-group">
                <label for="startDate">Start Date:</label>
                <input type="date" name="startDate" id="startDate" required 
                       value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label>
                <input type="date" name="endDate" id="endDate" required 
                       value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
            </div>
            <button type="submit" class="btn-submit">Get Sales Data</button>
        </form>

        <%
            List<Order> salesData = (List<Order>) request.getAttribute("orders");
            Double totalSales = (Double) request.getAttribute("totalSales");
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
                    if (salesData != null && !salesData.isEmpty()) {
                        for (Order order : salesData) {
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
                        <td colspan="6">No sales data found.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
            if (totalSales != null) {
        %>
        <h3>Total Sales: <%= totalSales %></h3>
        <%
            }
        %>
    </div>

   

</body>
</html>
