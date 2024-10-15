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
            background-color: #F2EED7; /* Soft background */
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff; /* White background */
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px; /* Space between containers */
        }
        h2 {
            color: #FF9874; /* Soft orange */
            margin-bottom: 20px;
            text-align: center;
        }
        .search-container {
            padding: 40px;
            text-align: center; /* Center align text */
        }
        .btn-search {
            background-color: #295F98; /* Dark blue */
            color: white; /* White text */
            font-size: 16px;
            width: 20%;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
        }
        .btn-search:hover {
            background-color: #1a3a6e; /* Darker blue */
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
            background-color: #295F98; /* Dark blue */
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
        .btn-back {
            display: inline-block;
            padding: 10px 15px;
            border-radius: 5px;
            color: white;
            background-color: #295F98; /* Dark blue */
            text-decoration: none;
            transition: background-color 0.3s;
            margin-top: 20px;
            text-align: center;
        }
        .btn-back:hover {
            background-color: #1a3a6e; /* Darker blue */
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

        <!-- Back to Dashboard Button -->
        <a href="/subadmin" class="btn-back">Back to Dashboard</a>
    </div>
    
    <div class="footer">
    </div>

</body>
</html>
