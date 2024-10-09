<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home - Electronics Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .container {
            width: 90%;
            margin: 0 auto;
        }
        .product {
            border: 1px solid #ddd;
            padding: 15px;
            margin: 10px;
            width: 300px;
            float: left;
            text-align: center;
        }
        .product img {
            max-width: 100%;
            height: auto;
        }
        .product-name {
            font-size: 18px;
            font-weight: bold;
        }
        .price {
            color: green;
        }
        .discount {
            color: red;
            text-decoration: line-through;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #45a049;
        }
        .clear {
            clear: both;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Top Trending Products</h1>
        
        <%
            // Assuming the list of products is set as an attribute in the request or session
            List<ecom.app.entities.Products> products = (List<ecom.app.entities.Products>) request.getAttribute("products");
            if (products != null) {
                for (ecom.app.entities.Products product : products) {
        %>
        <div class="product">
            <img src="data:image/jpeg;base64,<%= product.getBase64ProductImage() %>" alt="<%= product.getProduct_name() %> Image" />
            <div class="product-name"><%= product.getProduct_name() %></div>
            <div class="description"><%= product.getDescription() %></div>
            <div class="price">₹<%= product.getFinal_price() %></div>
            <div class="discount">₹<%= product.getMrp() %></div>
            <button class="button">More Details</button>
        </div>
        <%
                }
            }
        %>
        <div class="clear"></div>
    </div>
</body>
</html>
