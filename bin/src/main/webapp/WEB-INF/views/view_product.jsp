<%@ page import="ecom.app.entities.Products"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Products</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f4f4f4;
}

/* Message */
.message {
    font-size: 24px;
    font-weight: bold;
    color: #333;
    margin-bottom: 20px;
}

/* Container */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Table Styles */
table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background-color: #003366; /* Dark Blue */
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
    background-color: #f1f1f1; /* Light Gray on hover */
}

/* Image Styling */
img {
    border-radius: 4px;
    object-fit: cover; 
}

/* Responsive Styles */
@media (max-width: 768px) {
    th, td {
        padding: 8px;
        font-size: 14px;
    }

    .message {
        font-size: 20px;
    }

    img {
        width: 40px; 
        height: 40px;
    }
}
</style>
</head>
<body>
	<div class="message">All Products</div>

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
                        <img src="data:image/jpeg;base64,<%= product.getBase64ProductImage() %>" alt="Product Image" style="width:50px;height:50px;">
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
</body>
</html>
