<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css">
</head>
<body>
    <div class="cart-container">
        <h1>My Cart</h1>
        <div class="cart-item">
            <img src="product1.jpg" alt="Product 1">
            <div class="item-details">
                <h2>Product 1</h2>
                <p>Price:780</p>
                <p>Quantity: 1</p>
                <button class="remove-btn">Remove</button>
            </div>
        </div>
        <div class="cart-item">
            <img src="product2.jpg" alt="Product 2">
            <div class="item-details">
                <h2>Product 2</h2>
                <p>Price: 2099</p>
                <p>Quantity: 2</p>
                <button class="remove-btn">Remove</button>
            </div>
        </div>
        <div class="total">
            <h2>Total: $129.97</h2>
            <button class="checkout-btn">Proceed to Checkout</button>
        </div>
    </div>
</body>
</html>