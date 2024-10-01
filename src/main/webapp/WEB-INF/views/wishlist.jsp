<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wishlist</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css">
</head>
<body>
    <div class="wishlist-container">
        <h1>My Wishlist</h1>
        <div class="wishlist-item">
            <img src="product1.jpg" alt="Product 1">
            <div class="item-details">
                <h2>Product 2</h2>
				<p>mobile</p>
                <p>25000</p>
                <button class="view-details-btn" onclick="openModal('product1')">View More Details</button>
                <button class="remove-btn">Remove</button>
            </div>
        </div>
        <div class="wishlist-item">
            <img src="product2.jpg" alt="Product 2">
            <div class="item-details">
                <h2>Product 2</h2>
				<p>Laptops</p>
                <p>27000</p>
                <button class="view-details-btn" onclick="openModal('product2')">View More Details</button>
                <button class="remove-btn">Remove</button>
            </div>
        </div>
    </div>
 
    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">×</span>
            <img id="modal-img" src="" alt="Product Image">
            <div id="modal-details"></div>
        </div>
    </div>
 
    <script src="script.js"></script>
</body>
</html>