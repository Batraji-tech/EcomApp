<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Category" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shop By Category - ElectroMart</title>
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
    </style>
</head>
<body>

    <h1>Shop By Category</h1>

    <div class="products-row">
        <%
            List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
            for (Category category : categoryList) {
        %>
            <div class="product">
                <a href="${pageContext.request.contextPath}/products/category/<%= category.getCategory_id() %>">
                    <img src="data:image/jpeg;base64,<%= category.getBase64CategoryImage() %>" alt="<%= category.getCategory_name() %>">
                </a>
                <p><%= category.getCategory_name() %></p>
            </div>
        <%
            }
        %>
    </div>

</body>
</html>
