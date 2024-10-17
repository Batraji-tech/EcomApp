<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.Wishlist"%>
<%@ page import="ecom.app.entities.Products"%>
<html>
<head>
    <title>Your Wishlist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F2EED7; /* Light background for contrast */
            margin: 0;
            padding: 20px; /* Add some padding for better layout */
			
        }

		body {
		    font-family: Arial, sans-serif;
		    background-color: #F2EED7; /* Light background for contrast */
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

        .action-button {
            background-color: #295F98; /* Dark blue for buttons */
            color: white; /* White text */
            border: none; /* Remove border */
            padding: 8px 12px; /* Button padding */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer on hover */
            transition: background-color 0.3s ease; /* Smooth transition */
            margin-right: 5px; /* Space between buttons */
        }

        .action-button:hover {
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

        .shop-dropdown {
            margin-right: 100px; /* Spacing for dropdown */
        }
		
		.back-home{
			margin-right: 20px;
		}
		
    </style>
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
        </ul>
    </nav>

    <h1>Your Wishlist</h1>

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

    List<Wishlist> wishlistItems = (List<Wishlist>) request.getAttribute("wishlistItems");
    List<Products> products = (List<Products>) request.getAttribute("products");

    if (wishlistItems != null && !wishlistItems.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            for (int i = 0; i < wishlistItems.size(); i++) {
                Wishlist item = wishlistItems.get(i);
                Products product = products.get(i);
            %>
            <tr>
                <td><%= product != null ? product.getProduct_name() : "Product not found" %></td>
                <td><%= product != null ? product.getDescription() : "Description not available" %></td>
                <td>&#8377;<%= product != null ? product.getFinal_price() : "Price not available" %></td>
                <td>
                    <form action="${pageContext.request.contextPath}/wishlist/moveToCart" method="post" style="display:inline;">
                        <input type="hidden" name="wishlistId" value="<%= item.getWishlistId() %>">
                        <button type="submit" class="action-button">Move to Cart</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/wishlist/remove" method="post" style="display:inline;">
                        <input type="hidden" name="wishlistId" value="<%= item.getWishlistId() %>">
                        <button type="submit" class="action-button">Remove</button>
                    </form>
                </td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p>Your wishlist is empty.</p>
    <%
    }
    %>

   
</body>
</html>
