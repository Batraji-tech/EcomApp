<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ecom.app.entities.Products"%>
<%@ page import="java.util.List"%>
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
            position: relative;
        }
        .message {
            font-size: 24px;
            font-weight: bold;
            color: #FF9874; 
            margin-bottom: 20px;
        }
        .container {
            max-width: 1200px;
            margin-top: 60px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
			margin-left:40px;
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
        /* Search Bar Styles */
        .search-bar {
            padding: 10px;
            margin: 0 auto 20px; 
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 80%; 
            max-width: 600px; 
            display: block; 
        }
        .back-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #295F98;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .back-button:hover {
            background-color: #1a3a6e;
        }
    </style>
</head>
<body>

    <a class="back-button" href="/subadmin">Back to Dashboard</a>

    <div class="container">
        <div class="message">Manage Products</div>

        <!-- Search Bar -->
        <input type="text" id="filter" class="search-bar" placeholder="Search for products..." />

        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>MRP</th>
                    <th>Discount in %</th>
                    <th>Final Price</th>
                    <th>Delivery Charge</th>
                    <th>Stock</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="product-table-body">
                <%
                    List<Products> products = (List<Products>) request.getAttribute("products");
                    if (products != null) {
                        for (Products product : products) {
                %>
                            <tr class="product-row" data-id="<%= product.getProduct_id() %>" 
                                data-name="<%= product.getProduct_name().toLowerCase() %>"
                                data-description="<%= product.getDescription().toLowerCase() %>"
                                data-mrp="<%= product.getMrp() %>"
                                data-discount="<%= product.getDiscount() %>"
                                data-final_price="<%= product.getFinal_price() %>"
                                data-delivery_charge="<%= product.getDelivery_charge() %>"
                                data-stock="<%= product.getStock() %>">
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

    <script>
        function filterProducts() {
            const filterValue = document.getElementById('filter').value.toLowerCase();
            const rows = document.querySelectorAll('.product-row');

            rows.forEach(row => {
                const productId = row.dataset.id.toLowerCase();
                const productName = row.dataset.name;
                const description = row.dataset.description;
                const mrp = row.dataset.mrp.toString();
                const discount = row.dataset.discount.toString();
                const finalPrice = row.dataset.final_price.toString();
                const deliveryCharge = row.dataset.delivery_charge.toString();
                const stock = row.dataset.stock.toString();

                const isMatch = 
                    productId.includes(filterValue) ||
                    productName.includes(filterValue) ||
                    description.includes(filterValue) ||
                    mrp.includes(filterValue) ||
                    discount.includes(filterValue) ||
                    finalPrice.includes(filterValue) ||
                    deliveryCharge.includes(filterValue) ||
                    stock.includes(filterValue);

                row.style.display = isMatch ? '' : 'none';
            });
        }

        document.getElementById('filter').addEventListener('input', filterProducts);
    </script>

</body>
</html>
