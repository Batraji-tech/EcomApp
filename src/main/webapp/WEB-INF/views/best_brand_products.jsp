<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Products" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Best Brands - ElectroMart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F2EED7; /* Soft background */
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #FF9874; /* Soft orange */
            text-align: center;
            margin-bottom: 30px;
        }
        .products-row {
            display: flex;
            justify-content: space-between; /* Evenly distributes space between items */
            flex-wrap: wrap;
            max-width: 1200px; /* Maximum width of the product container */
            margin: 0 auto; /* Center the container */
        }
        .product {
            margin: 10px; /* Margin around each product */
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            text-align: center;
            flex: 1 1 calc(33.333% - 20px); /* 3 products per row, with space */
            max-width: 250px; /* Max width for each product */
            box-sizing: border-box; /* Ensures padding and border are included in the width */
        }
        img {
            width: 100%;
            height: auto;
            object-fit: contain; /* Maintains aspect ratio */
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <h1>Best Brands</h1>

    <div class="products-row">
        <%
            List<Products> bestBrands = (List<Products>) request.getAttribute("bestBrands");
            for (Products product : bestBrands) {
        %>
            <div class="product">
                <a href="${pageContext.request.contextPath}/products/<%= product.getProduct_id() %>">
                    <img src="data:image/jpeg;base64,<%= product.getBase64ProductImage() %>" alt="<%= product.getProduct_name() %>">
                </a>
                <h3><%= product.getProduct_name() %></h3>
                <p>&#8377;<%= product.getFinal_price() %></p>
            </div>
        <%
            }
        %>
    </div>

</body>
</html>
