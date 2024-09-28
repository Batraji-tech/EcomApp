<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Home Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css">
</head>
<body>
    <!-- Top Rectangle Bar -->
    <header class="header">
        <div class="logo">Shopology</div>
        <div class="search-container">
            <input type="text" placeholder="Search products..." class="search-bar">
            <button class="search-button">��</button>
        </div>
        <nav class="nav-links">
            <a href="#" class="nav-item">Home</a>
            <div class="dropdown">
                <button class="dropbtn">Login</button>
                <div class="dropdown-content">
                    <a href="/login_superadmin">Login as Super Admin</a>

	                    <a href="/user/login">Login </a>

                </div>
            </div>
            <a href="/register_subadmin" class="nav-item">Register as Retailer</a>
        </nav>
    </header>
 
    <!-- Categories Bar -->
    <div class="categories-bar">
        <div class="category">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyEvwHlH4wWYWbzMREwGMExULUIjd0KGkhXw&s" alt="Refrigerators">
            <p>Refrigerators</p>
        </div>
        <div class="category">
            <img src="https://opsg-img-cdn-gl.heytapimg.com/epb/202407/26/TaMP5ogUFuQFtKFr.png" alt="Mobiles">
            <p>Mobiles</p>
        </div>
        <div class="category">
            <img src="https://img.lovepik.com/element/45012/8521.png_860.png" alt="Laptops">
            <p>Laptops</p>
        </div>
    </div>
 
    <!-- Featured Products Section -->
    <div class="featured-products">
        <h1>Featured Products</h1>
        <h2>Check out our latest mobile phones that are trending this season!</h2>
    </div>
 
    <!-- Medium Image Row -->
    <div class="medium-image-row">
        <img src="https://fdn2.gsmarena.com/vv/bigpic/motorola-edge-50-ultra.jpg" alt="Image 1">
        <img src="https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-redmi-12-1.jpg" alt="Image 2">
        <img src="https://cf-images.dustin.eu/cdn-cgi/image/format=auto,quality=75,width=828,,fit=contain/image/d2000012787115/apple-iphone-16-512gb-vit.jpg" alt="Image 3">
        <img src="https://5.imimg.com/data5/SELLER/Default/2024/1/380260334/DB/ZV/JS/10650349/oneplus-mobile-phone.jpg" alt="Image 4">
        <img src="https://fdn2.gsmarena.com/vv/bigpic/google-pixel-8.jpg" alt="Image 5">
        <img src="https://assets-prd.ignimgs.com/2022/11/07/samsung-1667848036739.png" alt="Image 6">
        <img src="https://api.technodom.kz/f3/api/v1/images/800/800/244122_1.jpg" alt="Image 7">
    </div>
 
    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>About Us</h3>
                <p>We are a leading ecommerce platform, offering a wide range of products at competitive prices.</p>
            </div>
            <div class="footer-section">
                <h3>Customer Service</h3>
                <ul>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Returns</a></li>
                    <li><a href="#">Shipping Information</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Legal</h3>
                <ul>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Follow Us</h3>
                <ul>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Instagram</a></li>
                </ul>
            </div>
        </div>
        <p>&copy; 2024 Your E-Commerce Site | All Rights Reserved</p>
    </footer>
</body>
</html>