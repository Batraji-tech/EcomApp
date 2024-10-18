<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.CartItems"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
    <style>
        .address-section { margin-bottom: 20px; }
        .address-input { width: 100%; height: 100px; padding: 10px; font-size: 16px; box-sizing: border-box; }
        .address-actions { margin-top: 10px; }
        .proceed-button, .edit-button { padding: 10px 20px; font-size: 16px; margin-right: 10px; cursor: pointer; }
    </style>
    <script>
	function makeAddressReadOnly() {
		document.getElementById('deliveryAddress').readOnly = true;
	}

	function makeAddressEditable() {
		document.getElementById('deliveryAddress').readOnly = false;
		document.getElementById('deliveryAddress').focus();
	}

	function handleDeliveryButtonClick() {
		const deliveryAddress = document.getElementById('deliveryAddress').value;
		if (!deliveryAddress.trim()) {
			alert("Please enter your delivery address.");
			return;
		}
		document.getElementById('addressForm').submit();
	}
</script>
</head>
<body>
    <h1>Checkout</h1>

    <div class="address-section">
        <h2>Delivery Address</h2>
        <%
        String deliveryAddress = (String) session.getAttribute("deliveryAddress");
        %>
        <form id="addressForm" action="${pageContext.request.contextPath}/address/saveAddress" method="post">
            <label for="deliveryAddress">Delivery Address:</label> 
            <input type="text" id="deliveryAddress" name="deliveryAddress" class="address-input" required
                value="<%=deliveryAddress != null ? deliveryAddress : ""%>"
                <%=deliveryAddress != null && !deliveryAddress.isEmpty() ? "readOnly" : ""%>>
            <div class="address-actions">
                <button type="button" class="proceed-button" onclick="handleDeliveryButtonClick()">Deliver to this Address</button>
                <button type="button" class="edit-button" onclick="makeAddressEditable()">Edit Delivery Address</button>
            </div>
        </form>
    </div>

<div class="order-summary">
    <h2>Order Summary</h2>

    <%
    List<String> outOfStockMessages = (List<String>) session.getAttribute("outOfStockMessages");
    if (outOfStockMessages != null && !outOfStockMessages.isEmpty()) {
        %>
        <div class="alert alert-warning">
            <h3>Out of Stock Items:</h3>
            <ul>
                <%
                for (String message : outOfStockMessages) {
                    %>
                    <li><%= message %></li>
                    <%
                }
                %>
            </ul>
        </div>
        <%
        // Clear the messages from session after displaying them
        session.removeAttribute("outOfStockMessages");
    }
    %>

        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<CartItems> cartItems = (List<CartItems>) request.getAttribute("cartItems");
                double total = 0.0;
                Double deliveryChargeObj = (Double) request.getAttribute("deliveryCharge");
                double deliveryCharge = (deliveryChargeObj != null) ? deliveryChargeObj : 0.0;

                if (cartItems != null && !cartItems.isEmpty()) {
                    for (CartItems item : cartItems) {
                        double itemTotal = item.getPrice() * item.getQuantity();
                        total += itemTotal;
                %>
                <tr>
                    <td><%=item.getProductName()%></td>
                    <td><%=item.getQuantity()%></td>
                    <td><%=String.format("%.2f", item.getPrice())%></td>
                    <td><%=String.format("%.2f", itemTotal)%></td>
                </tr>
                <%
                    }
                    total += deliveryCharge;
                %>
                <tr>
                    <td colspan="3" class="total">Delivery Charge</td>
                    <td><%=String.format("%.2f", deliveryCharge)%></td>
                </tr>
                <tr>
                    <td colspan="3" class="total">Total</td>
                    <td><%=String.format("%.2f", total)%></td>
                </tr>
                <%
                } else {
                %>
                <tr>
                    <td colspan="4">No items in your cart.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <form action="/payment/openPaymentPage" method="get">
            <input type="hidden" name="totalAmount" value="<%= total %>">
            <button type="submit">Confirm Order</button>
        </form>
    </div>
</body>
</html>
