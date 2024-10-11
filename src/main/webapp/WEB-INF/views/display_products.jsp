<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.Products"%>
<html>
<head>
<title>Products Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.dashboard-header {
	background-color: #0073e6;
	color: white;
	padding: 20px 0;
	text-align: center;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.dashboard-header h1 {
	font-size: 40px;
	font-weight: bold;
	margin: 0;
}

.controls {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 90%;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.controls select {
	padding: 10px;
	font-size: 16px;
	border-radius: 4px;
	border: 1px solid #ccc;
	outline: none;
	cursor: pointer;
}

.controls .back-home {
	text-decoration: none;
	color: white;
	background-color: #0073e6;
	padding: 10px 20px;
	border-radius: 4px;
	transition: background-color 0.2s ease-in-out;
}

.controls .back-home:hover {
	background-color: #005bb5;
}

.container {
	width: 90%;
	margin: 0 auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.product-card {
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 16px;
	margin: 5px;
	width: 23%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
	transition: transform 0.2s ease-in-out;
}

.product-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.product-card img {
	width: 100%;
	height: 200px;
	border-radius: 8px 8px 0 0;
	object-fit: contain;
	background-color: #f4f4f4;
}

.product-card h3 {
	font-size: 18px;
	color: #333;
	margin: 15px 0;
}

.product-card p {
	color: #555;
	font-size: 16px;
	margin-bottom: 15px;
}

.button-container {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

.product-card a {
	text-decoration: none;
	color: white;
	padding: 10px 20px;
	border-radius: 4px;
	display: inline-block;
	transition: background-color 0.2s ease-in-out;
	margin: 0 5px;
	white-space: nowrap;
}

.product-card .details-btn {
	background-color: #0073e6;
}

.product-card .details-btn:hover {
	background-color: #005bb5;
}

.product-card .wishlist-btn {
	background-color: #ffc107;
}

.product-card .wishlist-btn:hover {
	background-color: #e0a800;
}

.no-products {
	text-align: center;
	font-size: 24px;
	color: #999;
	margin-top: 100px;
}
</style>

<script>
        function sortProducts() {
            var sortOption = document.getElementById("sortDropdown").value;
            window.location.href = "<%=request.getContextPath()%>/products?sort=" + sortOption;
        }
 
        function addToWishlist(productId) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "<%=request.getContextPath()%>
	/products/addToWishlist", true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				alert(xhr.responseText);
			}
		};
		xhr.send("id=" + productId);
	}
</script>
</head>
<body>

	<div class="dashboard-header">
		<h1>Products Dashboard</h1>
	</div>

	<div class="controls">
		<div>
			<label for="sortDropdown">Sort by:</label> <select id="sortDropdown"
				onchange="sortProducts()">
				<option value="alphabetical">Price</option>
				<option value="priceAsc">Low to High</option>
				<option value="priceDesc">High to Low</option>
			</select>
		</div>
		<a href="<%=request.getContextPath()%>/" class="back-home">Back to
			Home</a>
	</div>

	<div class="container">
		<%
		List<Products> products = (List<Products>) request.getAttribute("products");

		if (products != null && !products.isEmpty()) {
			for (Products product : products) {
		%>
		<div class="product-card">
			<%
			// Fetch the Base64 image string
			String base64Image = product.getBase64ProductImage();
			%>
			<img
				src="data:image/jpeg;base64,<%=base64Image != null ? base64Image : ""%>"
				alt="<%=product.getProduct_name()%>" />
			<h3><%=product.getProduct_name()%></h3>
			<p>
				Price: &#8377;<%=product.getFinal_price()%></p>
			<div class="button-container">
				<a
					href="<%=request.getContextPath()%>/products/<%=product.getProduct_id()%>"
					class="details-btn">More Details</a>
				<form action="<%=request.getContextPath()%>/wishlist/addToWishlist"
					method="post">
					<input type="hidden" name="productId"
						value="<%=product.getProduct_id()%>">
					<button type="submit">Add to Wishlist</button>
				</form>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<div class="no-products">No products available</div>
		<%
		}
		%>
	</div>
</body>
</html>