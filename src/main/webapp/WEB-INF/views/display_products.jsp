<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Products" %>
<html>
<head>
    <title>Products Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F2EED7; /* Soft background */
            margin: 0;
            padding: 0;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #295F98; /* Dark blue */
            color: #FF9874; /* Soft orange */
            padding: 10px 15px;
            position: relative;
            z-index: 10;
        }

        .nav-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            margin: 0 20px;
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
            margin: 0;
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
            background-color: white;
            color: black;
            border: 1px solid #ccc;
            padding: 2px;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            display: flex;
            align-items: center;
            margin-left: -3px;
        }

        nav .search-bar button img {
            width: 30px;
            height: 30px;
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
            background-color: #1a3a6e; /* Darker blue on hover */
        }

        .controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .controls select {
            padding: 10px;
            font-size: 16px;
            border-radius: 4px;
            border: 1px solid #ccc;
            outline: none;
            cursor: pointer;
        }

        .container {
            width: 90%;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 16px;
            margin: 5px;
            width: 23%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.2s ease-in-out;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .product-card img {
            width: 100%;
            height: 200px;
            border-radius: 8px 8px 0 0;
            object-fit: contain;
            background-color: #f4f4f4;
        }

        .product-card h3 {
            font-size: 18px;
            color: #FF9874; /* Soft orange */
            margin: 15px 0;
        }

        .product-card p {
            color: #555;
            font-size: 16px;
            margin-bottom: 15px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .product-card a {
            text-decoration: none;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            display: inline-block;
            transition: background-color 0.2s ease-in-out;
            margin: 0 5px;
            white-space: nowrap;
        }

        .product-card .details-btn {
            background-color: #295F98; /* Button color */
        }

        .product-card .details-btn:hover {
            background-color: #1a3a6e ; /* Button hover color */
        }

        .no-products {
            text-align: center;
            font-size: 24px;
            color: #999;
            margin-top: 100px;
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
		           margin-right: 100px;
		       }
    </style>

    <script>
        function sortProducts() {
            var sortOption = document.getElementById("sortDropdown").value;
            window.location.href = "<%= request.getContextPath() %>/products?sort=" + sortOption;
        }
    </script>
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
            <a href="<%= request.getContextPath() %>/homepageuser" class="back-home"> Home</a>
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
    
    <div class="controls">
        <div>
            <label for="sortDropdown">Sort by:</label>
            <select id="sortDropdown" onchange="sortProducts()">
                <option value="alphabetical">Price</option>
                <option value="priceAsc">Low to High</option>
                <option value="priceDesc">High to Low</option>
            </select>
        </div>
    </div>

    <div class="container">
        <%
            List<Products> products = (List<Products>) request.getAttribute("products");

            if (products != null && !products.isEmpty()) {
                for (Products product : products) {
        %>
                    <div class="product-card">
                        <%
                            String base64Image = product.getBase64ProductImage();
                        %>
                        <img src="data:image/jpeg;base64,<%= base64Image != null ? base64Image : "" %>" alt="<%= product.getProduct_name() %>" />
                        <h3><%= product.getProduct_name() %></h3>
                        <p>Price: &#8377;<%= product.getFinal_price() %></p>
                        <div class="button-container">
                            <a href="<%= request.getContextPath() %>/products/<%= product.getProduct_id() %>" class="details-btn">More Details</a>
                        </div>
                    </div>
        <%
                }
            } else {
        %>
                <div class="no-products">No products available</div>
        <%
            }
        %>
    </div>
</body>
</html>
