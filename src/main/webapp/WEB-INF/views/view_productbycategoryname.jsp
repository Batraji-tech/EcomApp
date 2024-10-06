<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ecom.app.entities.Products" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search by Category Name</title>
    <style>
        body {
            background-color: #E6F9E6; /* Light green background */
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }
        .search-container {
            border: 1px solid #003366; /* Dark blue border */
            border-radius: 10px;
            background-color: #ffffff; /* White background for the search form */
            padding: 40px;
            margin: 0 auto;
            max-width: 500px; /* Maximum width */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #003366; /* Dark blue */
            margin-bottom: 20px;
            text-align: center;
        }
        .btn-search {
            background-color: #00ff00; /* Bright green */
            border-color: #00ff00;
            color: #003366; /* Dark blue text */
            font-size: 16px;
            width: 100%;
            border-radius: 5px;
            margin-top: 20px;
        }
        .btn-search:hover {
            background-color: #00cc00; /* Darker green */
            border-color: #00cc00;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #003366; /* Dark blue */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #003366; /* Dark blue */
            color: white;
        }
        tbody tr:hover {
            background-color: #f1f1f1; /* Light gray on hover */
        }
        img {
            width: 50px; /* Set the width of images */
            height: auto; /* Maintain aspect ratio */
            border-radius: 4px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="search-container">
            <h2>Search by Category Name</h2>

            <form action="/products/view_productbycategoryname">
                <div class="form-group">
                    <label for="categoryName">Select Category:</label>
                    <select name="category_id" id="category_id" required>
                        <option value="" disabled selected>Select a category</option>
                        <option value="1">Refrigerator</option>
                        <option value="2">Mobiles</option>
                        <option value="3">Laptops</option>
                    </select>
                </div>
                <button type="submit" class="btn-search">Search Products</button>
            </form>
        </div>
    </div>
    
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>MRP</th>
                    <th>Discount</th>
                    <th>Final Price</th>
                    <th>Stock</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Products> products = (List<Products>) request.getAttribute("products");
                    if (products != null) {
                        for (Products product : products) {
                %>
                    <tr>
                        <td><%= product.getProduct_id() %></td>
                        <td>
                            <img src="data:image/jpeg;base64,<%= product.getBase64ProductImage() %>" alt="Product Image">
                        </td>
                        <td><%= product.getProduct_name() %></td>
                        <td><%= product.getDescription() %></td>
                        <td><%= product.getMrp() %></td>
                        <td><%= product.getDiscount() %></td>
                        <td><%= product.getFinal_price() %></td>
                        <td><%= product.getStock() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="8">No products found.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    
    <div class="footer">
        © 2024 Shopology. All rights reserved.
    </div>

</body>
</html>
