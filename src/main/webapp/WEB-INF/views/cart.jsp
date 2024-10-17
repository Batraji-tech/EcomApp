<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.CartItems"%>
<%@ page import="ecom.app.entities.Cart"%>
<html>
<head>
<title>Your Cart</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>
	<h1>Your Cart</h1>



	<%
	List<CartItems> cartItems = (List<CartItems>) session.getAttribute("cartItems");

	if (cartItems != null && !cartItems.isEmpty()) {
	%>
	<form action="${pageContext.request.contextPath}/cart/removeMultiple"
		method="post">
		<table>
			<thead>
				<tr>
					<th>Select</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Quantity</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (CartItems item : cartItems) {
				%>
				<tr>
					<td><input type="checkbox" name="productIds"
						value="<%=item.getProductId()%>" /></td>
					<td><%=item.getProductName()%></td>
					<td><%=item.getDescription()%></td>
					<td><%=item.getPrice()%></td>
					<td><%=item.getQuantity()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<button type="submit">Remove Selected</button>
	</form>

	<!-- Proceed to Checkout Button -->
	<form action="${pageContext.request.contextPath}/cart/checkout"
		method="get">
		<button type="submit" class="proceed-checkout">Proceed to
			Checkout</button>
	</form>


	<%
	} else {
	%>
	<p>Your cart is empty.</p>
	<%
	}
	%>

	<a href="<%=request.getContextPath() + "/homepageuser"%>">Back to
		Home</a>

	<%@include file="message.jsp"%>

</body>
</html>
