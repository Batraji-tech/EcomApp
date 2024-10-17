<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Category" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View by category - ElectroMart</title>
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
            padding: 20px;
            text-align: center;
            flex: 0 0 calc(33.33% - 30px); /* Three products per row, adjusted for margin */
            box-sizing: border-box; /* Includes padding and border in the width */
            backdrop-filter: blur(10px); /* Optional: Adds a blur effect behind the product cards */
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
