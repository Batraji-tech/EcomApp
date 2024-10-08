<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ecom.app.entities.Products" %>
<%@ page import="java.util.Base64" %> <!-- Import for Base64 encoding -->
 
<html>
<head>
    <title>Product Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            color: #333;
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
            color: #444;
        }
        .product-details p {
            font-size: 18px;
            margin: 10px 0;
            color: #666;
        }
        .price-details {
            font-size: 26px;
            color: #ff5722;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .product-status {
            font-size: 16px;
            color: #28a745;
        }
        .btn-container {
            display: flex;
            gap: 20px;
            margin-top: 30px;
        }
        .btn-container a {
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
            text-align: center;
            width: 140px;
        }
        .add-to-cart {
            background-color: #28a745;
            color: white;
        }
        .add-to-cart:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        .buy-now {
            background-color: #ff5722;
            color: white;
        }
        .buy-now:hover {
            background-color: #e64a19;
            transform: translateY(-2px);
        }
        .back-button {
            background-color: #007bff;
            color: white;
        }
        .back-button:hover {
            background-color: #0069d9;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
 
    <div class="product-container">
        <%
            // Fetch the product object from the request scope
            Products product = (Products) request.getAttribute("product");
            
            // Get the Base64 encoded image string
            String base64Image = product.getBase64ProductImage();
        %>
 
        <!-- Product Image Section -->
        <div class="product-image">
            <%
                // Display the product image if it exists
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
 
            <!-- Display product fields -->
            <p><strong>Description:</strong> <%= product.getDescription() %></p>
            <p><strong>MRP:</strong> &#8377;<%= product.getMrp() %></p>
            <p><strong>Discount:</strong> <%= product.getDiscount() %> %</p>
            <p><strong>Delivery Charges:</strong> &#8377;<%= product.getDelivery_charge() %></p>
            <p class="price-details">Final Price: &#8377;<%= product.getFinal_price() %></p>
            
            
 
            <!-- Buttons for actions -->
            <div class="btn-container">
                <a href="/cart/add" class="add-to-cart">Add to Cart</a>
                <a href="#" class="buy-now">Buy Now</a>
                <a href="<%= request.getContextPath() %>/product/display1" class="back-button">Back to Products</a>
            </div>
        </div>
    </div>
 
</body>
</html>