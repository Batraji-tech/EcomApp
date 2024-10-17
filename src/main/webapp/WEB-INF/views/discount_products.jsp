<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Products" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Discount Products - ElectroMart</title>
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
            flex-wrap: wrap; /* Allows wrapping to next line */
            max-width: 1200px; /* Maximum width of the product container */
            margin: 0 auto; /* Center the container */
        }
        .product {
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            text-align: center;
            flex: 0 0 30%; /* Set flex-basis to 30% for equal size */
            margin: 10px; /* Margin around each product */
            box-sizing: border-box; /* Ensures padding and border are included in the width */
        }
        img {
            width: 100%;
            height: 150px; /* Fixed height for equal sizing */
            object-fit: contain; /* Maintains aspect ratio */
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <h1>Discount Products</h1>

    <div class="products-row">
        <%
            List<Products> discountProducts = (List<Products>) request.getAttribute("discountProducts");
            for (Products product : discountProducts) {
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
