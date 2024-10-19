<%@ page import="ecom.app.entities.CartItems"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
<style>
    body {
        background-color: #F2EED7;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
    }

    h1, h2 {
        color: #FF9874;
        text-align: center;
        margin: 10px 0;
    }

    .address-section, .order-summary {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }

    .address-input {
        width: 100%;
        height: 40px;
        padding: 10px;
        font-size: 16px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .address-actions {
        margin-top: 10px;
        text-align: center;
    }

    .proceed-button, .edit-button, .confirm-button {
        background-color: #295F98;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        margin-right: 10px;
    }

    .proceed-button:hover, .edit-button:hover, .confirm-button:hover {
        background-color: #1a3a6e;
        transform: scale(1.05);
    }

    .confirm-button:disabled {
        background-color: #ccc;
        cursor: not-allowed;
    }

    .order-summary table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
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

    tbody tr:hover {
        background-color: #f1f1f1;
    }

    .total {
        font-weight: bold;
    }

    button {
        background-color: #295F98;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
        transition: background-color 0.3s;
    }

    button:hover {
        background-color: #1a3a6e;
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

    function validateAddress() {
        const address = document.getElementById('deliveryAddress').value.trim();
        const confirmButton = document.getElementById('confirmButton');
        if (address === "") {
            confirmButton.disabled = true;
        } else {
            confirmButton.disabled = false;
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById('deliveryAddress').addEventListener('input', validateAddress);
        validateAddress();  // Check initially if the address is already filled
    });
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
                <%=deliveryAddress != null && !deliveryAddress.isEmpty() ? "readOnly" : ""%> />
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
            <button type="submit" class="confirm-button" id="confirmButton">Confirm Order</button>
        </form>
    </div>
</body>
</html>
