<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa;
            text-align: center;
            padding: 50px;
        }
        h1 {
            color: #00796b;
            margin-bottom: 20px;
        }
        .success-message {
            font-size: 1.5em;
            margin-bottom: 30px;
        }
        img {
            max-width: 500px; 
            height: auto;
        }
        .back-home {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #295F98; /* Dark blue */
            color: white; /* White text */
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            text-decoration: none; /* Remove underline */
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .back-home:hover {
            background-color: #1a3a6e; /* Darker blue */
        }
    </style>
</head>
<body>
    <a href="<%= request.getContextPath() %>/homepageuser" class="back-home">Back to Home</a>
    <h1>Order Successful!</h1>
    <div class="success-message">
        Thank you for your order! Your products will be delivered soon.
    </div>
    <img src="${pageContext.request.contextPath}/assets/ordersuccess.png" alt="Delivery Scooter">
</body>
</html>
