<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.Products"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Products</title>
<style>
body {
	background-color: #F2EED7; /* Soft background */
	font-family: Arial, sans-serif;
	margin: 0;
}

.message {
	color: #FF9874; /* Soft orange */
	font-size: 30px;
	font-weight: bold;
	text-align: left;
	margin: 20px;
}

.container {
	width: 80%;
	margin: auto;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	background: white;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #295F98; /* Dark blue */
	padding: 10px;
	text-align: left;
}

th {
	background-color: #295F98; /* Dark blue */
	color: white;
}

.productname {
	font-weight: bold;
	color: #295F98; /* Dark blue */
}

.price {
	color: #295F98;
	font-weight: bold;
}

.btn {
	padding: 10px 15px;
	border-radius: 5px;
	color: white;
	border: none;
	cursor: pointer;
	background-color: #295F98; /* Dark blue */
	transition: background-color 0.3s;
	margin: 5px;
}

.btn:hover {
	background-color: #1a3a6e; /* Darker blue */
}

th:nth-child(5), td:nth-child(5) {
	width: 150px;
}

th:nth-child(7), td:nth-child(7) {
	width: 150px;
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
					<th>MRP</th>
					<th>Final Price</th>
					<th>Stock</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Products> products = (List<Products>) request.getAttribute("products");
				if (products != null && !products.isEmpty()) {
					for (Products product : products) {
				%>
				<tr>
					<td><%=product.getProduct_id()%></td>
					<td><img
						src="data:image/jpeg;base64,<%=product.getBase64ProductImage()%>"
						alt="Product Image" style="width: 50px; height: 50px;"></td>
					<td class="productname"><%=product.getProduct_name()%></td>
					<td class="price"><%=product.getMrp()%></td>
					<td class="price"><%=product.getFinal_price()%></td>
					<td><%=product.getStock()%></td>
					<td>
						<form
							action="/products/remove_product/<%=product.getProduct_id()%>"
							method="get">
							<button type="submit" class="btn">Remove</button>
						</form>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="7">No products available.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>
