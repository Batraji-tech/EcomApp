<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ecom.app.entities.Products" %>
<%@ page import="ecom.app.entities.Feedback" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.User" %>


<html>
<head>
    <title>Product Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #F2EED7; /* Soft background */
            margin: 0;
            padding: 0;
            color: #333;
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

        .product-container {
            max-width: 1200px;
            margin: 40px auto;
            display: flex;
            flex-direction: row;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }
        .product-image {
            flex: 1;
            padding: 20px;
        }
        .product-image img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            object-fit: contain;
            background-color: #e6e6e6;
        }
        .product-details {
            flex: 2;
            padding: 20px;
        }
        .product-details h1 {
            font-size: 34px;
            margin-bottom: 20px;
            color: #295F98; /* Soft orange */
        }
        .price-details {
            font-size: 26px;
            color: #ff5722;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn-container {
            display: flex;
            gap: 20px; /* Space between buttons */
            margin-top: 30px;
            flex-wrap: nowrap; /* Keep buttons in a single line */
        }
        .btn-container button {
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
            cursor: pointer;
            background-color: #295F98; /* Dark blue */
            color: white;
            border: none;
        }
        .btn-container button:hover {
            background-color: #1a3a6e; /* Darker blue */
        }
        .feedback-section {
            margin: 60px 60px; /* Added left and right margins */
            background-color: #295F98; /* Button background color */
            color: white; /* Button text color */
            padding: 12px 25px; /* Padding for buttons */
            border: none; /* No border */
            border-radius: 6px; /* Rounded corners */
            font-size: 16px; /* Font size */
            font-weight: bold; /* Bold text */
            cursor: pointer; /* Pointer on hover */
            transition: background-color 0.3s ease, transform 0.2s; /* Smooth transitions */
        }
        .btn-container button:hover {
            background-color: #1a3a6e; /* Darker shade on hover */
            transform: translateY(-2px); /* Slight lift effect */
        }
        .feedback-section {
            margin: 40px 50px; /* Top and bottom 40px, left and right 50px */
            padding: 20px;
            background-color: #fff; /* White background for contrast */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .feedback-section h2 {
            margin-bottom: 20px;
            color: #FF9874; /* Soft orange */
            font-size: 28px;
            text-align: center;
        }
        .feedback-section form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .feedback-section textarea {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            resize: none;
            height: 100px;
            font-size: 16px;
            font-family: inherit;
        }
        .feedback-section button[type="submit"] {
            background-color: #295F98; /* Dark blue */
            color: white;
            border: none;
            padding: 8px 20px; /* Reduced padding */
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 14px; /* Reduced font size */
			width:15%;
        }
        .feedback-section button[type="submit"]:hover {
            background-color: #1a3a6e; /* Darker blue */
        }
        .testimonial-list {
            margin-top: 20px;
            margin-bottom: 10px;
            color: #FF9874; /* Soft orange for heading */
        }
        .feedback-section textarea {
            width: 100%; /* Full width */
            padding: 12px; /* Increased padding for comfort */
            border: 1px solid #ccc; /* Border color */
            border-radius: 5px; /* Rounded corners */
            resize: vertical; /* Allow vertical resizing only */
            margin-bottom: 15px; /* Spacing below the textarea */
            font-size: 16px; /* Font size */
            line-height: 1.5; /* Improved line height */
        }
        .feedback-section button[type="submit"] {
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            background-color: #295F98; /* Dark blue background */
            color: white; /* White text */
            border: none; /* No border */
            transition: background-color 0.3s ease, transform 0.2s; /* Smooth transitions */
            cursor: pointer;
        }
        .feedback-section button[type="submit"]:hover {
            background-color: #1a3a6e; /* Darker blue on hover */
            transform: translateY(-2px); /* Slight lift effect */
        }
        .feedback-item {
            background-color: #f9f9f9; /* Light background for each feedback */
            border-left: 4px solid #295F98; /* Left border for emphasis */
            padding: 15px; /* Padding around feedback text */
            margin-bottom: 15px; /* Space between feedback items */
            border-radius: 6px; /* Rounded corners */
            transition: background-color 0.3s; /* Smooth background transition */
        }
        .feedback-item:hover {
            background-color: #e9ecef; /* Slightly darker on hover */
        }
        .feedback-item strong {
            color: #295F98; /* Dark blue for user name */
            font-size: 18px; /* Slightly larger font size */
        }
        .feedback-item small {
            display: block; /* Display date on a new line */
            color: #888; /* Lighter color for the date */
            font-size: 14px; /* Smaller font size for date */
            margin-top: 5px; /* Space above the date */
        }
        .feedback-section h3 {
            margin-top: 30px; /* Spacing above user feedback heading */
            font-size: 24px; /* Larger font size for emphasis */
            color: #295F98; /* Match the theme */
            border-bottom: 2px solid #FF9874; /* Underline effect */
            padding-bottom: 5px; /* Padding below heading */
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
            <a href="<%= request.getContextPath() %>/" class="back-home"> Home</a>
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
    <div class="product-container">
        <%
             User user =  (User)session.getAttribute("user");  
            Products product = (Products) session.getAttribute("product");
            String message = (String) request.getAttribute("message");
            List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList");
            String base64Image = product.getBase64ProductImage(); // Get the product image
        %>

        <!-- Message Display -->
        <c:if test="${not empty message}">
            <p style="font-weight:bold; color:green">${message}</p>
        </c:if>

        <!-- Product Image Section -->
        <div class="product-image">
            <%
                if (base64Image != null) {
            %>
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= product.getProduct_name() %>">
            <%
                } else {
            %>
                <img src="https://via.placeholder.com/500" alt="No Image Available">
            <%
                }
            %>
        </div>

        <!-- Product Details Section -->
        <div class="product-details">
            <h1><%= product.getProduct_name() %></h1>
            <p><strong>Description:</strong> <%= product.getDescription() %></p>
            <p><strong>MRP:</strong> &#8377;<%= product.getMrp() %></p>
            <p><strong>Discount:</strong> <%= product.getDiscount() %>%</p>
            <p><strong>Stock:</strong> <%= product.getStock() > 0 ? product.getStock() + " available" : "Out of Stock" %></p>
            <p class="price-details">Final Price: &#8377;<%= product.getFinal_price() %></p>

            <!-- Buttons for actions -->
            <div class="btn-container">
                <form action="${pageContext.request.contextPath}/cart/add" method="POST">
                    <input type="hidden" name="productId" value="<%= product.getProduct_id() %>">
                    <button type="submit">Add to Cart</button>
                </form>

                <form action="${pageContext.request.contextPath}/cart/buynow" method="GET">
                    <input type="hidden" name="productId" value="<%= product.getProduct_id() %>">
                    <button type="submit">Buy Now</button>
                </form>
                <form action="${pageContext.request.contextPath}/wishlist/addToWishlist" method="POST">
                    <input type="hidden" name="productId" value="<%= product.getProduct_id() %>">
                    <button type="submit" class="add-to-wishlist">Add to Wishlist</button>
                </form>
               
                      
                     <% if(user!=null){  %>                      
                      <form action="${pageContext.request.contextPath}/homepageuser" method="GET">
                    <button type="submit" class="back-button">Back to Products</button>
                </form>
                     <%} 
                      else{   %>     
                      <form action="${pageContext.request.contextPath}/" method="GET">
                    <button type="submit" class="back-button">Back to Products</button>
                </form>
                     <%} %> 
                      
                      
                      
                      
                      
                
            </div>
        </div>
    </div>

    <!-- Feedback Section -->
    <div class="feedback-section">
        <h2>Leave Feedback</h2>
        <form action="${pageContext.request.contextPath}/feedback/submit" method="POST">
            <textarea name="feedbackText" placeholder="Enter your feedback..." required></textarea>
            <input type="hidden" name="productId" value="<%= product.getProduct_id() %>">
            <input type="hidden" name="userId" value="<%= session.getAttribute("userId") != null ? session.getAttribute("userId") : 0 %>">
            <button type="submit">Submit Feedback</button>
        </form>

        <h3>User Feedback</h3>
        <ul class="testimonial-list" id="feedback-list">
            <%
                if (feedbackList != null && !feedbackList.isEmpty()) {
                    for (Feedback feedback : feedbackList) {
            %>
                <li class="feedback-item">
                    <strong>User <%= feedback.getUserId() %>:</strong>
                    <p><%= feedback.getFeedbackText() %></p>
                    <small><%= feedback.getFeedbackDate() %></small>
                </li>
            <%
                    }
                } else {
            %>
                <li class="feedback-item">No feedback available yet.</li>
            <%
                }
            %>
        </ul>
    </div>

</body>
</html>
