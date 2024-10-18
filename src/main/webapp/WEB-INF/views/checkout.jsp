<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="ecom.app.entities.CartItems"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/checkout.css">
<style>
	body {
	    background-color: #F2EED7; /* Soft background */
	    font-family: Arial, sans-serif;
	    margin: 0;
	    padding: 20px; /* Added padding for a better layout */
	}

	h1, h2 {
	    color: #FF9874; /* Soft orange */
	    text-align: center; /* Center-align headings */
	    margin: 10px 0; /* Space around headings */
	}

	.address-section, .order-summary {
	    background-color: white; /* White background for sections */
	    padding: 20px; /* Padding around content */
	    border-radius: 8px; /* Rounded corners */
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
	    margin-bottom: 20px; /* Space between sections */
	}

	.address-input {
	    width: 100%;
	    height: 40px; /* Adjusted height for better appearance */
	    padding: 10px;
	    font-size: 16px;
	    box-sizing: border-box;
	    border: 1px solid #ccc; /* Light border for input */
	    border-radius: 4px; /* Rounded corners */
	}

	.address-actions {
	    margin-top: 10px;
	    text-align: center; /* Center-align buttons */
	}

	.proceed-button, .edit-button {
	    background-color: #295F98; /* Dark blue */
	    color: white; /* Text color */
	    border: none; /* No border */
	    padding: 10px 20px;
	    font-size: 16px;
	    border-radius: 5px; /* Rounded corners */
	    cursor: pointer;
	    transition: background-color 0.3s, transform 0.2s; /* Transition effects */
	    margin-right: 10px; /* Space between buttons */
	}

	.proceed-button:hover, .edit-button:hover {
	    background-color: #1a3a6e; /* Darker blue */
	    transform: scale(1.05); /* Slightly enlarge on hover */
	}

	.order-summary table {
	    width: 100%;
	    border-collapse: collapse;
	    margin-top: 20px; /* Space above table */
	}

	thead {
	    background-color: #295F98; /* Dark blue */
	    color: white; /* Text color */
	}

	th, td {
	    padding: 12px; /* Space within cells */
	    text-align: left;
	    border-bottom: 1px solid #ddd; /* Light bottom border */
	}

	tbody tr:hover {
	    background-color: #f1f1f1; /* Light hover effect */
	}

	.total {
	    font-weight: bold; /* Bold for totals */
	}

	button {
	    background-color: #295F98; /* Dark blue */
	    color: white; /* Text color */
	    border: none; /* No border */
	    padding: 10px 15px;
	    border-radius: 5px; /* Rounded corners */
	    cursor: pointer;
	    margin-top: 20px; /* Space above button */
	    transition: background-color 0.3s; /* Transition effect */
	}

	button:hover {
	    background-color: #1a3a6e; /* Darker blue */
	}

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



