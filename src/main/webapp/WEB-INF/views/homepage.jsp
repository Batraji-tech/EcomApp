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
            background-color: #F2EED7; /* Soft background */
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
		        
		        .shop-dropdown {
		            margin-right: 10px;
		        }

		        .account-dropdown {
		            margin-right: 60px;
		        }

        section {
            margin: 20px;
            text-align: center;
        }

        h1 {
            margin: 20px 0;
            font-size: 28px;
            color: #FF9874; /* Soft orange */
        }

        h2 {
            margin: 20px 0;
            font-size: 24px;
            color: #FF9874; /* Soft orange */
            border-bottom: 2px solid #295F98;
            display: inline-block;
            padding-bottom: 5px;
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
            background-color: #295F98; /* Dark blue */
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
            background-color: #1a3a6e; /* Darker blue */
            color: white;
        }

        .explore-all-products {
            background-color: #295F98; /* Dark blue */
            color: white;
            border: none;
            padding: 8px;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            margin-top: 10px; /* Add margin for spacing */
        }

        .explore-all-products:hover {
            background-color: #1a3a6e; /* Darker blue */
            color: white;
        }

        .login-dropdown {
            margin-right: 100px;
        }

        .shop-dropdown {
            margin-right: 10px;
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

	        </div>
	        <ul>
	            <li class="shop-dropdown">
	                <a href="#">Shop</a>
	                <ul class="dropdown-content">
	                    <li><a href="/explore-all-categories">Shop by Category</a></li>
	                    <li><a href="/products/display1">All Products</a></li>
	                </ul>
	            </li>
	        <!-- My Account Dropdown -->
			<ul>
			            <li class="login-dropdown">
			                <a href="#">Login</a>
			                <ul class="dropdown-content">
			                    <li><a href="/superAdmin/login" onclick="submitLoginForm('super_admin')">Login as Super Admin</a></li>
			                    <li><a href="/user/login" onclick="submitLoginForm('retailer')">Login</a></li>
			                </ul>

	    </ul>
	</nav>

    <!-- Welcome Section -->
    <section>
        <button onclick="window.location.href='${pageContext.request.contextPath}/products/display1'" class="explore-all-products">Explore All Products</button>
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
                <button class="explore-all-products" onclick="window.location.href='${pageContext.request.contextPath}/explore-new-trends'">Explore All </button>
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
                <button class="explore-all-products" onclick="window.location.href='${pageContext.request.contextPath}/explore-new-arrivals'">Explore All</button>
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
                <button class="explore-all-products" onclick="window.location.href='${pageContext.request.contextPath}/explore-discount-products'">Explore All</button>
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
                <button class="explore-all-products" onclick="window.location.href='${pageContext.request.contextPath}/explore-best-brands'">Explore All</button>
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
            <!-- Explore All Products button after every 3 categories -->
            <button class="explore-all-products" onclick="window.location.href='<%= request.getContextPath() %>/explore-all-categories'">Explore All</button>
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
