<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Products" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Arrivals - ElectroMart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F2EED7; /* Soft background */
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #FF9874;
            margin: 20px 0;
        }
        .products-row {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin: 0 auto; /* Center the container */
            padding: 0 15px; /* Add padding to prevent horizontal scroll */
            max-width: 1200px; /* Set a max width for the container */
        }
        .product {
            margin: 15px; /* Margin for spacing */
            background: rgba(255, 255, 255, 0.8); /* White background with transparency */
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            flex: 0 0 30%; /* Set flex-basis to 30% for equal size */
            margin: 10px; /* Margin around each product */
            box-sizing: border-box; /* Ensures padding and border are included in the width */
        }
        img {
            width: 100%;
            height: 200px; /* Set a fixed height for consistency */
            object-fit: contain; /* Ensures full image visibility */
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <h1>New Arrivals</h1>

    <div class="products-row">
        <%
            List<Products> newArrivals = (List<Products>) request.getAttribute("newArrivals");
            for (Products product : newArrivals) {
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
