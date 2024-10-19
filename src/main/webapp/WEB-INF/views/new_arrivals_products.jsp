<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            padding: 20px; /* Added padding for overall spacing */
        }
        h1 {
            color: #FF9874; /* Soft orange */
            text-align: center;
            margin-bottom: 30px;
        }
        .products-row {
            display: flex;
            justify-content: center;
            flex-wrap: wrap; /* Allow wrapping for responsive layout */
            gap: 20px; /* Space between products */
        }
        .product {
            margin: 10px; /* Margin for product containers */
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
            width: 250px; /* Fixed width for uniformity */
            height: 350px; /* Fixed height for uniformity */
            display: flex;
            flex-direction: column; /* Stack items vertically */
            justify-content: flex-start; /* Align items at the top */
            padding: 15px;
            transition: box-shadow 0.3s; /* Smooth shadow effect */
        }
        .product:hover {
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Shadow on hover */
        }
        img {
            width: 100%;
            height: 200px; /* Fixed height for images */
            object-fit: contain; /* Contain image */
            border-radius: 5px;
        }
        a {
            text-decoration: none;
            color: white; /* Text color for links */
            background-color: white; /* Dark blue */
            padding: 10px;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s; /* Smooth color transition */
        }
        a:hover {
            background-color: white; /* Darker blue on hover */
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
