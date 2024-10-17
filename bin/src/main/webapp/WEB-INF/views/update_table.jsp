<%@ page import="ecom.app.entities.Products"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #F2EED7; 
        }
        .message {
            font-size: 24px;
            font-weight: bold;
            color: #FF9874; 
            margin-bottom: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        thead {
            background-color: #295F98; 
            color: white;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            font-weight: bold;
        }
        tbody tr:hover {
            background-color: #f1f1f1; 
        }
        .btn-update {
            background-color: #295F98; 
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
        .btn-update:hover {
            background-color: #1a3a6e; 
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="message">Manage Products</div>
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>MRP</th>
                    <th>Discount in % </th>
                    <th>Final Price</th>
                    <th>Delivery Charge </th>
                    <th>Stock</th>
                    <th>Action</th>
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
                                    <img src="data:image/jpeg;base64,<%= product.getBase64ProductImage() %>" alt="Product Image" style="width:50px;height:50px;">
                                </td>
                                <td><%= product.getProduct_name() %></td>
                                <td><%= product.getDescription() %></td>
                                <td><%= product.getMrp() %></td>
                                <td><%= product.getDiscount() %></td>
                                <td><%= product.getFinal_price() %></td>
                                <td><%= product.getDelivery_charge() %></td>
                                <td><%= product.getStock() %></td>
                                <td>
                                    <form action="/products/edit_product/<%= product.getProduct_id() %>" method="get">
                                        <input type="hidden" name="pid" value="<%= product.getProduct_id() %>">
                                        <button type="submit" class="btn-update">Update</button>
                                    </form>
                                </td>
                            </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="10">No products found.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
