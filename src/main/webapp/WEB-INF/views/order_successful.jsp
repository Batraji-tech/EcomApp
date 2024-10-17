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
    </style>
</head>
<body>
    <h1>Order Successful!</h1>
    <div class="success-message">
        Thank you for your order! Your products will be delivered soon.
    </div>
    <img src="${pageContext.request.contextPath}/assets/ordersuccess.png" alt="Delivery Scooter">
</body>
</html>
