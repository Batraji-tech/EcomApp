<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ecom.app.entities.User" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        header {
            background-color: rgba(0, 51, 102, 0.8);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 30px;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        .profile-links {
            display: flex;
            align-items: center;
            margin: auto; /* Center the profile links */
        }

        .container {
            width: 80%;
            max-width: 800px;
            margin-top: 100px; /* Space for the fixed header */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin: 0;
            font-size: 2.5em;
            text-align: left;
        }

        .greeting {
            font-size: 1.2em;
            margin-left: 15px; /* Space between the greeting and buttons */
        }

        .tab {
            text-align: center;
        }

        .link {
            background-color: #00ff00;
            color: #003366;
            text-decoration: none;
            border-radius: 5px;
            padding: 15px 25px;
            font-size: 16px;
            margin: 10px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .link:hover {
            background-color: #00cc00;
        }

        .profile-links button {
            background-color: #007BFF; /* Bootstrap primary color */
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 0 10px; /* Add some margin to space out buttons */
        }

        .profile-links button:hover {
            background-color: #0056b3; /* Darker blue */
        }

        @media (max-width: 600px) {
            .link {
                width: 100%;
                margin: 5px 0;
            }
        }

        .marquee {
            font-size: 1.5em;
            color: white;
            background-color: rgba(0, 51, 102, 0.8);
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            text-align: center;
            position: fixed;
            bottom: 0;
            left: 0;
        }
    </style>
</head>

<body>

    <header>
        <h1>Sub-Admin Dashboard</h1>
        <div class="profile-links">
            <% User user = (User) request.getAttribute("user"); %>
            <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/user/profile?username=${user.username}'">View Profile</button>
            <a href="/" class="link">Logout</a>
         

        </div>
    </header>

    <div class="container">
        <div class="tab">
            <a href="/products" class="link">Add Products</a>
            <a href="/products/view_product_update_table" class="link">Update Product</a>
            <a href="/products/remove_product" class="link">Remove Product</a>
            <a href="/products/view_product" class="link">View All Products</a>
            <a href="/products/view_productbycategoryname" class="link">View by Category Name</a>
             <a href="/user/resetPassword" class ="link"'>Reset Password</a>
           
        </div>
 

</body>
</html>
