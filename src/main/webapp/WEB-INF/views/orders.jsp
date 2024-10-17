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
    <style>
        body {
            background-color: #F2EED7; /* Soft background */
            font-family: Arial, sans-serif;
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }
		nav {
				    display: flex;
				    justify-content: space-between;
				    align-items: center;
				    background-color: #295F98; /* Dark blue */
				    color: #FF9874; /* Soft orange */
				    padding: 10px 15px; /* Padding for the navbar */
				    position: relative;
				    z-index: 10;
				    margin: 0; /* Ensure no margin on the navbar */
				}


		        .nav-container {
		            display: flex;
		            justify-content: center;
		            align-items: center;
		            flex-grow: 1;
		            margin: 0 0px;
		        }

		        nav .logo {
		            font-size: 28px;
		            font-weight: bold;
		            margin-right: 20px;
		            color: #FF9874; /* Soft orange */
		        }

		        nav .search-bar {
		            flex-grow: 1;
		            position: relative;
		            text-align: center;
		        }

		        nav .search-bar form {
		            display: flex;
		            justify-content: center;
		            align-items: center;
		            margin: 0; /* Remove margin to merge elements */
		        }

		        nav .search-bar input {
		            width: 400px;
		            padding: 8px 15px;
		            border-radius: 5px 0 0 5px; 
		            border: 1px solid #ccc;
		            outline: none;
		            font-size: 16px;
		        }

		        nav .search-bar button {
		            background-color: white; /* White background for the button */
		            color: black; /* Black icon color */
		            border: 1px solid #ccc; /* Match the input border */
		            padding: 2px; /* Padding for the button */
		            border-radius: 0 5px 5px 0; /* Rounded right corners */
		            cursor: pointer;
		            display: flex;
		            align-items: center;
		            margin-left: -3px; /* Overlap the button with the input */
		        }

		        nav .search-bar button img {
		            width: 30px; /* Set icon width */
		            height: 30px; /* Set icon height */
		        }

		        nav ul {
		            display: flex;
		            list-style-type: none;
		            padding: 0;
		            margin: 0;
		            gap: 15px;
		        }

		        nav ul li {
		            position: relative;
		        }

		        nav ul li a {
		            color: white;
		            text-decoration: none;
		            padding: 10px;
		            display: block;
		            line-height: 1.5;
		        }

		        nav ul li .dropdown-content {
		            display: none;
		            position: absolute;
		            background-color: white;
		            min-width: 172px;
		            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
		            z-index: 20;
		        }

		        nav ul li:hover .dropdown-content {
		            display: block;
		        }

		        nav ul li .dropdown-content a {
		            color: black;
		            font-size: 16px;
		            text-decoration: none;
		            display: block;
		            padding: 10px;
		        }

		        nav ul li .dropdown-content a:hover {
		            background-color: #ddd;
		        }

		        .back-home {
		            text-decoration: none;
		            color: white;
		            background-color: #295F98; /* Dark blue */
		            margin-right: 10px;
		            border-radius: 4px;
		            transition: background-color 0.2s ease-in-out;
		        }

		        .back-home:hover {
		            background-color:#295F98 ; /* Darker blue on hover */
		        }
				.shop-dropdown {
				         margin-right: 8px; /* Spacing for dropdown */
				     }
					
					.back-home{
						margin-right: 20px;
					}
					
       
        .orders-container {
            margin: 20px;
        }
        .order {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #ffffff; /* White background for contrast */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .order h2 {
            color: #FF9874; /* Soft orange */
            margin-bottom: 10px;
            font-size: 1.5em; /* Larger font size for order ID */
        }
        .order-item {
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 15px;
            background-color: #f9f9f9; /* Light grey for items */
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .order-item h3 {
            margin: 0;
            color: #295F98; /* Dark blue for product name */
            font-size: 1.2em; /* Slightly larger font for product name */
        }
        .order-item p {
            margin: 5px 0;
            font-size: 0.9em; /* Smaller font size for price and quantity */
        }
        .order-total {
            font-weight: bold;
            margin-top: 15px;
            text-align: right;
            color: #FF9874; /* Soft orange for total */
            font-size: 1.2em; /* Larger font size for total */
        }
        .message, .error {
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
        }
        .error {
            color: red;
            background-color: #f8d7da; /* Light red background for error */
            border: 1px solid #f5c6cb; /* Red border */
        }
        .message {
            color: green;
            background-color: #d4edda; /* Light green background for message */
            border: 1px solid #c3e6cb; /* Green border */
        }
		.wishlist{
			margin-right:30px;
			color:white;
			margin-top:13.5px;
			text-decoration: none;
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

<nav>
       <div class="logo">ElectroMart</div>
       <div class="nav-container">
           <div class="search-bar">
               <form action="/search" method="get">
                   <input type="text" name="query" placeholder="Search for specific products..." required>
                   <button type="submit" class="search-button">
                       <img src="https://www.shutterstock.com/image-vector/magnify-icon-vector-eps10-260nw-1220721013.jpg" alt="Search"/>
                   </button>
               </form>
           </div>
           <a href="<%= request.getContextPath() %>/" class="back-home">Home</a>
		<a href="${pageContext.request.contextPath}/cart/view" class="back-home">Cart Items</a>
       </div>
       <ul>
           <li class="shop-dropdown">
               <a href="#">Shop</a>
               <ul class="dropdown-content">
                   <li><a href="/explore-all-categories">Shop by Category</a></li>
                   <li><a href="/products/display1">All Products</a></li>
               </ul>
           </li>
		   <a href="${pageContext.request.contextPath}/wishlist/view" class="wishlist">Wishlist</a>
       </ul>
   </nav>


<div class="orders-container">
    <h1 style="color: #FF9874;">My Orders</h1>

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
