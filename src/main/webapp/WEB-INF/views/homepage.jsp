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
        </nav>
    </header>
 
    <!-- Categories Bar -->
    <div class="categories-bar">
        <div class="category">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyEvwHlH4wWYWbzMREwGMExULUIjd0KGkhXw&s" alt="Refrigerators">
            <a href="/products/display">Refrigerators</a>
        </div>
        <div class="category">
            <img src="https://opsg-img-cdn-gl.heytapimg.com/epb/202407/26/TaMP5ogUFuQFtKFr.png" alt="Mobiles">
            <p>Mobiles</p>
        </div>
        <div class="category">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8f0gPxkniKMZ39z8_9mRNakRtpnmOitd1aA&s" alt="Laptops">
            <p>Laptops</p>
        </div>
    </div>
 
    <!-- Featured Products Section -->
    <div class="featured-products">
        <h1>Featured Products</h1>
        <h2>Check out our latest products that are trending this season!</h2>
    </div>
 
    <!-- Medium Image Row -->
	<div class="slideshow-container">
	     <div class="slides fade">
	       <img src="https://5.imimg.com/data5/SELLER/Default/2023/8/339012359/NZ/CI/HL/22035967/ikall-s2-smartphone-6-8-inch-hd-display-6gb-ram-6gb-virtual-ram-128gb-storage-android-13-0-500x500.jpg"alt="Image 1" />
	     </div>
	     <div class="slides fade">
	       <img src="https://static.digit.in/default/63043a830597c650a77e5b892de23c519eb5100e.jpeg"alt="Image 2"/>
	     </div>
	     <div class="slides fade">
	       <img src="https://5.imimg.com/data5/EO/YH/XB/SELLER-2694128/haier-refrigetor.jpg"alt="Image 3"/>
	     </div>
 
	     <a class="prev" onclick="plusSlides(-1)">❮</a>
	     <a class="next" onclick="plusSlides(1)">❯</a>
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
	<script>	let slideIndex = 0;
	showSlides();
 
	function plusSlides(n) {
	  slideIndex += n;
	  showSlides();
	}
 
	function showSlides() {
	  const slides = document.getElementsByClassName("slides");
	  if (slideIndex >= slides.length) {
	    slideIndex = 0; // Reset to first slide if at the end
	  }
	  if (slideIndex < 0) {
	    slideIndex = slides.length - 1; // Go to last slide if at the start
	  }
	  for (let i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none"; // Hide all slides
	  }
	  slides[slideIndex].style.display = "block"; // Show the current slide
	}
 
	// Optional: Automatic slide show
	setInterval(() => {
	  plusSlides(1);
	}, 20000); // Change slide every 3 seconds
</script>
		
</body>
</html>