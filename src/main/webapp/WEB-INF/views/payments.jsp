<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Options</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #cce0f5;
            margin: 0;
            padding: 20px;
        }

        .payment-container {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 1200px; 
            margin: auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .payment-options {
            display: flex;
            justify-content: space-between;
			        }

		.payment-card {
		    flex: 1;
	        margin: 0 10px;
		    border: 2px solid #ccc;
		    border-radius: 8px;
			padding: 15px;
		    background: #2E4053;
			transition: transform 0.2s;
					}
					
        .payment-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .payment-card img {
            max-width: 150px;
            margin-right: 8px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

		input {
		    padding: 5px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    width: 100%;
		    max-width: 150px;
		}
        button {
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>

<body>
    <div class="payment-container">
        <h2>Select a Payment Option</h2>
        <div class="payment-options">
            <div class="payment-card">
                <h3>Card Payment</h3>
                <div>
					<img src="${pageContext.request.contextPath}/assets/Cardsimage.png" alt="Card Options">

                    
                </div>
                <form>
                    <input type="text" placeholder="Card Number" required>
                    <input type="text" placeholder="Expiry Date (MM/YY)" required>
                    <input type="text" placeholder="CVV" required>
                    <button type="submit">Verify Card Details</button>
                </form>
            </div>
            <div class="payment-card">
                <h3>Other UPI Apps</h3>
                <form>
                    <input type="text" placeholder="UPI ID" required>
                    <button type="submit">Verify</button>
                </form>
            </div>
            <div class="payment-card">
                <h3>QR Code Payment</h3>
				<img src="${pageContext.request.contextPath}/assets/qr.jpeg" alt="QR Code">
                <p>   Scan to pay</p>
            </div>
            <div class="payment-card">
                <h3>COD Available</h3>
				<img src="${pageContext.request.contextPath}/assets/cashon Delivery img.jpg" alt="Cash On Delivery">
                 
				<button type="button" onclick="window.location.href='${pageContext.request.contextPath}/order_successful'">Cash on Delivery</button>
            </div>
        </div>
    </div>
</body>

</html>
