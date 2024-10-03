<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css">
</head>
<body>
    <div class="orders-container">
        <h1>My Orders</h1>
        <div class="order">
            <h2>Order #12345</h2>
            <p>Date: 2024-09-29</p>
            <div class="order-item">
                <img src="product1.jpg" alt="Product 1">
                <div class="item-details">
                    <h3>Product 1</h3>
                    <p>Price: $29.99</p>
                    <p>Quantity: 1</p>
                </div>
            </div>
            <div class="order-item">
                <img src="product2.jpg" alt="Product 2">
                <div class="item-details">
                    <h3>Product 2</h3>
                    <p>Price: $49.99</p>
                    <p>Quantity: 2</p>
                </div>
            </div>
            <div class="order-total">
                <h3>Total: $129.97</h3>
            </div>
        </div>
        <div class="order">
            <h2>Order #12346</h2>
            <p>Date: 2024-09-28</p>
            <div class="order-item">
                <img src="product3.jpg" alt="Product 3">
                <div class="item-details">
                    <h3>Product 3</h3>
                    <p>Price: $19.99</p>
                    <p>Quantity: 1</p>
                </div>
            </div>
            <div class="order-total">
                <h3>Total: $19.99</h3>
            </div>
        </div>
    </div>
</body>
</html>
 