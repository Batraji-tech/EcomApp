<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Products" %>
<%@ page import="ecom.app.entities.Category" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ElectroMart - Home</title>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
			background-image: url('https://img.freepik.com/free-vector/winter-light-blue-gradient-vector-background_53876-126054.jpg');
			background-size: cover; /* Ensures the image covers the entire background */
			background-position: center;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #295F98;
            color: white;
            padding: 15px;
        }

        .nav-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        nav .logo {
            font-size: 24px;
            font-weight: bold;
			color:#FF9874;
        }

        nav .search-bar {
            flex-grow: 1;
            margin: 0 20px;
            position: relative; /* Position for icon */
            text-align: center;
        }

        nav .search-bar form {
            display: inline-block;
            position: relative;
        }

        nav .search-bar input {
            width: 400px;
            padding: 8px 40px 8px 15px; /* Add padding for the search icon */
            border-radius: 5px;
            border: none;
            text-align: left;
        }

        nav .search-bar button {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: #333;
        }

        nav ul {
            display: flex;
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        nav ul li {
            margin-left: 0px;
            position: relative;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px;
            display: block;
        }

        /* Dropdown menu for login */
        nav ul li .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        nav ul li:hover .dropdown-content {
            display: block;
        }

        nav ul li .dropdown-content a {
            color: black;
            text-decoration: none;
            display: block;
            padding: 12px 16px;
        }

        nav ul li .dropdown-content a:hover {
            background-color: #ddd;
        }
		.login-dropdown{
			margin-right:10px;
		}
		
		.shop-dropdown{
			margin-right:100px;
		}

        section {
            margin: 20px;
            text-align: center;
        }

        h1 {
            margin: 20px 0;
            font-size: 28px;
        }

        h2 {
            margin: 20px 0;
            font-size: 24px;
            color: #FF9874;
            border-bottom: 2px solid #295F98;
            display: inline-block;
            padding-bottom: 5px;
        }
		.exp-btn{
			background-color: #295F98;
			            color: white;
			            border: none;
			            padding: 10px;
			            border-radius: 5px;
			            text-align: center;
			            cursor: pointer;
			            display: flex;
			            align-items: center;
			            justify-content: center;
			            font-size: 16px;
			            transition: background-color 0.3s ease;
						margin-left:570px;
		}
		.exp-btn:hover {
		            background-color: #1a3a6e;
		            color: white;
		        }

        .products-row {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .product {
            margin-right: 20px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            text-align: center;
            flex: 1;
        }

        img {
            width: auto;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
        }

        .explore-button {
            background-color: #295F98;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .explore-button:hover {
            background-color: #1a3a6e;
            color: white;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <div class="logo">ElectroMart</div>

        <!-- Search Bar in Center -->
        <div class="nav-container">
            <div class="search-bar">
                <form action="${pageContext.request.contextPath}/products/search" method="get">
                    <input type="text" name="query" placeholder="Search for specific products..." required>
                    <button type="submit">
                        <i class="fas fa-search"></i> <!-- Lens icon -->
                    </button>
                </form>
            </div>
        </div>

        <!-- Navigation Links -->
        <ul>
            <!-- Login Dropdown -->
            <li class="login-dropdown">
                <a href="#">Login</a>
                <ul class="dropdown-content">
                    <li><a href="/superAdmin/login" onclick="submitLoginForm('super_admin')">Login as Super Admin</a></li>
                    <li><a href="/user/login" onclick="submitLoginForm('retailer')">Login</a></li>
               
                </ul>
            </li>

            <!-- Shop Dropdown -->
            <li class="shop-dropdown">
                <a href="#">Shop</a>
                <ul class="dropdown-content">
                    <li><a href="${pageContext.request.contextPath}/explore-all-categories">Shop by Category</a></li>
                    <li><a href="${pageContext.request.contextPath}/products/display1">All Products</a></li>
                </ul>
            </li>
        </ul>
    </nav>

    <!-- Welcome Section -->
    <section>
        <button onclick="window.location.href='${pageContext.request.contextPath}/products/display1'"class="exp-btn">Explore All Products</button>
    </section>
   
    <!-- Trends Section -->
    <section>
        <h2>New Trends</h2>
        <div class="products-row">
            <%
                List<Products> newTrends = (List<Products>) request.getAttribute("newTrends");
                for (int i = 0; i < newTrends.size(); i++) {
                    Products product = newTrends.get(i);
            %>
                <div class="product">
                    <a href="${pageContext.request.contextPath}/products/<%= product.getProduct_id() %>">
                    <img src="data:image/jpeg;base64,<%= product.getBase64ProductImage() %>" alt="<%= product.getProduct_name() %>">
                </a><p><%= product.getProduct_name() %>  &#8377;<%= product.getFinal_price() %></p>
                </div>
            <%
                if ((i + 1) % 3 == 0) {
            %>
                <div class="explore-button" onclick="window.location.href='${pageContext.request.contextPath}/explore-new-trends'">Explore All</div>
            <%
                }
            }
            %>
        </div>
    </section>
     
   

    <!-- New Arrivals Section -->
    <section>
        <h2>New Arrivals</h2>
        <div class="products-row">
            <%
                List<Products> newArrivals = (List<Products>) request.getAttribute("newArrivals");
                for (int i = 0; i < newArrivals.size(); i++) {
                    Products product = newArrivals.get(i);
            %>
                <div class="product">
                    <a href="${pageContext.request.contextPath}/products/<%= product.getProduct_id() %>">
                    <img src="data:image/jpeg;base64,<%= product.getBase64ProductImage() %>" alt="<%= product.getProduct_name() %>">
                </a><p><%= product.getProduct_name() %>  &#8377;<%= product.getFinal_price() %></p>
                </div>
            <%
                if ((i + 1) % 3 == 0) {
            %>
                <div class="explore-button" onclick="window.location.href='${pageContext.request.contextPath}/explore-new-arrivals'">Explore All</div>
            <%
                }
            }
            %>
        </div>
    </section>

    <!-- Discount Products Section -->
    <section>
        <h2>Discount Products</h2>
        <div class="products-row">
            <%
                List<Products> discountProducts = (List<Products>) request.getAttribute("discountProducts");
                for (int i = 0; i < discountProducts.size(); i++) {
                    Products product = discountProducts.get(i);
            %>
                <div class="product">
                  <a href="${pageContext.request.contextPath}/products/<%= product.getProduct_id() %>">
                    <img src="data:image/jpeg;base64,<%= product.getBase64ProductImage() %>" alt="<%= product.getProduct_name() %>">
                </a> <p><%= product.getProduct_name() %>  &#8377;<%= product.getFinal_price() %></p>
                </div>
            <%
                if ((i + 1) % 3 == 0) {
            %>
                <div class="explore-button" onclick="window.location.href='${pageContext.request.contextPath}/explore-discount-products'">Explore All</div>
            <%
                }
            }
            %>
        </div>
    </section>

    <!-- Best Brands Section -->
    <section>
        <h2>Best Brands</h2>
        <div class="products-row">
            <%
                List<Products> bestBrands = (List<Products>) request.getAttribute("bestBrands");
                for (int i = 0; i < bestBrands.size(); i++) {
                    Products product = bestBrands.get(i);
            %>
                <div class="product">
                   <a href="${pageContext.request.contextPath}/products/<%= product.getProduct_id() %>">
                    <img src="data:image/jpeg;base64,<%= product.getBase64ProductImage() %>" alt="<%= product.getProduct_name() %>">
                </a><p><%= product.getProduct_name() %>  &#8377;<%= product.getFinal_price() %></p>
                </div>
            <%
                if ((i + 1) % 3 == 0) {
            %>
                <div class="explore-button" onclick="window.location.href='${pageContext.request.contextPath}/explore-best-brands'">Explore All</div>
            <%
                }
            }
            %>
        </div>
    </section>
    
     <!-- Category Section -->
<section>
    <h2>Shop By Category</h2>
    <div class="products-row">
        <%
            List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
            for (int i = 0; i < categoryList.size(); i++) {
                Category category = categoryList.get(i);
        %>
            <div class="product">
                <!-- Link to the products of the selected category -->
                <a href="<%= request.getContextPath() %>/products/category/<%= category.getCategory_id() %>">
                    <!-- Display the category image -->
                    <img src="data:image/jpeg;base64,<%= category.getBase64CategoryImage() %>" alt="<%= category.getCategory_name() %>" style="width:200px;height:200px;">
                </a>
                <!-- Display the category name -->
                <p><%= category.getCategory_name() %></p>
            </div>
        <%
            if ((i + 1) % 3 == 0) {
        %>
            <!-- Explore All button after every 3 categories -->
            <div class="explore-button" onclick="window.location.href='<%= request.getContextPath() %>/explore-all-categories'">Explore All</div>
        <%
            }
        }
        %>
    </div>
</section>


    <script>
        // JavaScript function for handling login dropdown selection
        function submitLoginForm(role) {
            window.location.href = '${pageContext.request.contextPath}/login?role=' + role;
        }
    </script>
</body>
</html>
