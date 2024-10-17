<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.Category" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Best Brands - ElectroMart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .products-row {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        .product {
            margin: 20px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            text-align: center;
            max-width: 250px;
        }
        img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <h1>Shop By Category</h1>

    <div class="products-row">
        <%
            List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
            for (Category product : categoryList) {
        %>
             <div class="product">
                    <a href="${pageContext.request.contextPath}/products/category/<%= product.getCategory_id() %>">
                    <img src="data:image/jpeg;base64,<%= product.getBase64CategoryImage() %>" alt="<%= product.getCategory_name() %>">
                </a><p><%= product.getCategory_name() %> 
                </div>
            
        <%
            }
        %>
    </div>

</body>
</html>
