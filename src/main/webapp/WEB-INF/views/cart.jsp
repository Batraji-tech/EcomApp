<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.CartItems"%>
<%@ page import="ecom.app.entities.Cart"%>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F2EED7; /* Soft background */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #295F98; /* Dark blue */
            color: #FF9874; /* Soft orange */
            padding: 0px 15px; /* Adjusted padding for the navbar */
            position: relative;
            z-index: 10;
            margin: 0; /* Ensure no margin on the navbar */
        }

        .nav-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            margin: 0;
			
        }

        nav .logo {
            font-size: 26px;
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
			margin-bottom:19px;
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
            padding: 8px;
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
            padding: 8px 12px; /* Add padding for button-like appearance */
        }

        .back-home:hover {
            background-color:#295F98 ; /* Darker blue on hover */
        }

        .shop-dropdown {
            margin-right: 100px; /* Spacing for dropdown */
        }

        h1 {
            color: #FF9874; /* Soft orange for heading */
            text-align: center; /* Center the heading */
            margin-top: 20px; /* Optional: adjust as needed */
        }

        table {
            width: 100%;
            border-collapse: collapse; /* Collapse borders */
            margin-top: 20px; /* Space above the table */
        }

        th, td {
            border: 1px solid #ddd; /* Light border for table cells */
            padding: 12px; /* Padding inside table cells */
            text-align: left; /* Align text to the left */
        }

        th {
            background-color: #295F98; /* Dark blue for header */
            color: white; /* White text for header */
        }

        tr:nth-child(even) {
            background-color: #f2f2f2; /* Alternate row color */
        }

        tr:hover {
            background-color: #ddd; /* Highlight on hover */
        }

        button {
            background-color: #295F98; /* Dark blue for buttons */
            color: white; /* White text */
            border: none; /* Remove border */
            padding: 8px 12px; /* Button padding */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer on hover */
            transition: background-color 0.3s ease; /* Smooth transition */
            margin-top: 20px; /* Space above buttons */
        }

        button:hover {
            background-color: #1a3a6e; /* Darker blue on hover */
        }

        .error {
            margin: 20px 0; /* Space above and below error message */
            color: red; /* Red color for error */
        }

        .message {
            margin: 20px 0; /* Space above and below message */
            color: green; /* Green color for message */
        }

        .proceed-checkout {
            background-color: #295F98; /* Dark blue for checkout button */
            color: white; /* White text */
            border: none; /* Remove border */
            padding: 10px 15px; /* Button padding */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer on hover */
            transition: background-color 0.3s ease; /* Smooth transition */
            margin-top: 20px; /* Space above button */
        }

        .proceed-checkout:hover {
            background-color:#295F98 ; /* Darker blue on hover */
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>
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
            <a href="${pageContext.request.contextPath}/wishlist/view" class="back-home">Wishlist</a>
        </div>
        <ul>
            <li class="shop-dropdown">
                <a href="#">Shop</a>
                <ul class="dropdown-content">
                    <li><a href="/explore-all-categories">Shop by Category</a></li>
                    <li><a href="/products/display1">All Products</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <h1>Your Cart</h1>

    <%
    List<CartItems> cartItems = (List<CartItems>) session.getAttribute("cartItems");

    if (cartItems != null && !cartItems.isEmpty()) {
    %>
    <form action="${pageContext.request.contextPath}/cart/removeMultiple" method="post">
        <table>
            <thead>
                <tr>
                    <th>Select</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (CartItems item : cartItems) {
                %>
                <tr>
                    <td>
                        <input type="checkbox" name="productIds" value="<%= item.getProductId() %>"/>
                    </td>
                    <td><%= item.getProductName() %></td>
                    <td><%= item.getDescription() %></td>
                    <td>&#8377;<%= item.getPrice() %></td>
                    <td><%= item.getQuantity() %></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <button type="submit">Remove Selected</button>
    </form>

    <!-- Proceed to Checkout Button -->
    <form action="${pageContext.request.contextPath}/cart/checkout" method="get">
        <button type="submit" class="proceed-checkout">Proceed to Checkout</button>
    </form>

    <%
    } else {
    %>
    <p>Your cart is empty.</p>
    <%
    }
    %>
    
    <a href="<%=request.getContextPath() + "/homepageuser"%>">Back to
		Home</a>
	<%@include file="message.jsp"%>
    

</body>
</html>
