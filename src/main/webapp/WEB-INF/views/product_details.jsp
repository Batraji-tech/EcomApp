<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="ecom.app.entities.Products"%>
<%@ page import="ecom.app.entities.Feedback"%>
<%@ page import="ecom.app.entities.User"%>

<%@ page import="java.util.List"%>

<html>
<head>
<title>Product Details</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f0f2f5;
	margin: 0;
	padding: 0;
	color: #333;
}

.product-container {
	max-width: 1200px;
	margin: 40px auto;
	display: flex;
	flex-direction: row;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.product-image {
	flex: 1;
	padding: 20px;
}

.product-image img {
	width: 100%;
	height: auto;
	border-radius: 10px;
	object-fit: contain;
	background-color: #e6e6e6;
}

.product-details {
	flex: 2;
	padding: 20px;
}

.product-details h1 {
	font-size: 34px;
	margin-bottom: 20px;
	color: #444;
}

.price-details {
	font-size: 26px;
	color: #ff5722;
	font-weight: bold;
	margin-bottom: 20px;
}

.btn-container {
	display: flex;
	gap: 20px;
	margin-top: 30px;
}

.btn-container button {
	padding: 12px 25px;
	border-radius: 6px;
	font-size: 16px;
	font-weight: bold;
	transition: all 0.3s ease;
	cursor: pointer;
}

.add-to-cart {
	background-color: #28a745;
	color: white;
}

.add-to-cart:hover {
	background-color: #218838;
	transform: translateY(-2px);
}

.buy-now {
	background-color: #ff5722;
	color: white;
}

.buy-now:hover {
	background-color: #e64a19;
	transform: translateY(-2px);
}

.back-button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 12px 25px;
	border-radius: 6px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.back-button:hover {
	background-color: #0069d9;
}

.feedback-section {
	margin-top: 40px;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.feedback-section h2 {
	margin-bottom: 10px;
}

#feedback-list {
	list-style-type: none;
	padding: 0;
}

#feedback-list li {
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}
</style>
</head>
<body>

	<div class="product-container">
		<%
		User user = (User) session.getAttribute("user");
		Products product = (Products) session.getAttribute("product");
		String message = (String) request.getAttribute("message");
		List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList");
		String base64Image = product.getBase64ProductImage(); // Get the product image
		%>

		<!-- Message Display -->
		<c:if test="${not empty message}">
			<p style="font-weight: bold; color: green">${message}</p>
		</c:if>

		<!-- Product Image Section -->
		<div class="product-image">
			<%
			if (base64Image != null) {
			%>
			<img src="data:image/jpeg;base64,<%=base64Image%>"
				alt="<%=product.getProduct_name()%>">
			<%
			} else {
			%>
			<img src="https://via.placeholder.com/500" alt="No Image Available">
			<%
			}
			%>
		</div>

		<!-- Product Details Section -->
		<div class="product-details">
			<h1><%=product.getProduct_name()%></h1>
			<p>
				<strong>Description:</strong>
				<%=product.getDescription()%></p>
			<p>
				<strong>MRP:</strong> &#8377;<%=product.getMrp()%></p>
			<p>
				<strong>Discount:</strong>
				<%=product.getDiscount()%>%
			</p>
			<p>
				<strong>Stock:</strong>
				<%=product.getStock() > 0 ? product.getStock() + " available" : "Out of Stock"%></p>
			<!-- Stock Info -->
			<p class="price-details">
				Final Price: &#8377;<%=product.getFinal_price()%></p>

			<div class="btn-container">
				<!-- Add to Cart Button -->
				<form action="${pageContext.request.contextPath}/cart/add"
					method="POST">
					<input type="hidden" name="productId"
						value="${product.getProduct_id()}">
					<button type="submit" class="add-to-cart">Add to Cart</button>
				</form>

				<!-- Buy Now Button -->
				<form action="${pageContext.request.contextPath}/cart/buynow"
					method="GET">
					<input type="hidden" name="productId"
						value="${product.getProduct_id()}"> <input type="hidden"
						name="fromCart" value="false">
					<!-- Indicate this is a direct buy -->
					<button type="submit" class="buy-now">Buy Now</button>
				</form>
			</div>

			<!-- Back to Products Button -->
			<%
			if (user != null) {
			%>
			<form action="${pageContext.request.contextPath}/homepageuser"
				method="GET" style="margin-top: 20px;">
				<button type="submit" class="back-button">Back to Products</button>
			</form>

			<%
			} else {
			%>
			<form action="${pageContext.request.contextPath}/" method="GET"
				style="margin-top: 20px;">
				<button type="submit" class="back-button">Back to Products</button>
			</form>

			<%
			}
			%>


		</div>
	</div>

	<!-- Feedback Section -->
	<div class="feedback-section">
		<h2>Leave Feedback</h2>
		<form action="${pageContext.request.contextPath}/feedback/submit"
			method="POST">
			<textarea name="feedbackText" placeholder="Enter your feedback..."
				required></textarea>
			<input type="hidden" name="productId"
				value="<%=product.getProduct_id()%>"> <input type="hidden"
				name="userId"
				value="<%=session.getAttribute("userId") != null ? session.getAttribute("userId") : 0%>">
			<button type="submit">Submit Feedback</button>
		</form>

		<h3>User Feedback</h3>
		<ul id="feedback-list">
			<%
			if (feedbackList != null) {
				for (Feedback feedback : feedbackList) {
			%>
			<li><strong>User <%=feedback.getUserId()%>:
			</strong> <%=feedback.getFeedbackText()%> <br> <small><%=feedback.getFeedbackDate()%></small></li>
			<%
			}
			} else {
			%>
			<li>No feedback available yet.</li>
			<%
			}
			%>
		</ul>
	</div>

</body>
</html>