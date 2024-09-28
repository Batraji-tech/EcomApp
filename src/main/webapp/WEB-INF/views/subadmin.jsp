
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subadmin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/subadmin.css">
</head>
<body>
    <header class="navbar">
        <div class="container">
            <div class="logo">Shopology</div>
            <div class="nav-links">
                <a href="/profile" class="nav-item"> Profile</a>
                <a href="/" class="nav-item">Logout</a>
            </div>
        </div>
    </header>
 
    <main class="container">
        <div class="dropdown-container">
            <div class="dropdown">
                <button class="dropbtn">View Category</button>
                <div class="dropdown-content">
                    <label for="view-type">View Type:</label>
                    <select id="view-type">
                        <option value="view-all">View All</option>
                        <option value="alphabetically-asc">View Alphabetically Ascending</option>
                        <option value="alphabetically-desc">View Alphabetically Descending</option>
                    </select>
                    <button class="view-results">View Results</button>
                </div>
            </div>
 
            <div class="dropdown">
                <button class="dropbtn">Add Product</button>
                <div class="dropdown-content">
                    <form class="add-product-form" enctype="multipart/form-data">
                        <label for="category">Select Category:</label>
                        <select id="category" required>
                            <option value="">Select Category</option>
                            <option value="fridge">Fridge</option>
                            <option value="mobiles">Mobiles</option>
                            <option value="laptops">Laptops</option>
                        </select>
                        <input type="text" placeholder="Product Name" required>
                        <textarea placeholder="Description" required></textarea>
                        <input type="number" placeholder="Quantity" required>
                        <input type="number" placeholder="Price" required>
                        <input type="number" placeholder="Discount (%)" required>
                        <input type="number" placeholder="Tax (%)" required>
                        <input type="number" placeholder="Delivery Charges" required>
                        <input type="number" placeholder="Total Amount" required>
                        <label for="image">Upload Image:</label>
                        <input type="file" id="image" name="image" accept="image/*" required>
                        <button type="submit">Add</button>
                    </form>
                </div>
            </div>
 
            <div class="dropdown">
                <button class="dropbtn">Delete Product</button>
                <div class="dropdown-content">
                    <form class="delete-product-form">
                        <input type="text" placeholder="Enter Product ID" required>
                        <input type="text" placeholder="Product Name" required>
                        <button type="submit">Delete</button>
                    </form>
                </div>
            </div>
 
            <div class="dropdown">
                <button class="dropbtn">Update Product</button>
                <div class="dropdown-content">
                    <form class="update-product-form" enctype="multipart/form-data">
                        <label for="update-category">Select Category:</label>
                        <select id="update-category" required>
                            <option value="">Select Category</option>
                            <option value="fridge">Fridge</option>
                            <option value="mobiles">Mobiles</option>
                            <option value="laptops">Laptops</option>
                        </select>
                        <input type="text" placeholder="Product Name" required>
                        <textarea placeholder="Description" required></textarea>
                        <input type="number" placeholder="Quantity" required>
                        <input type="number" placeholder="Price" required>
                        <input type="number" placeholder="Discount (%)" required>
                        <input type="number" placeholder="Tax (%)" required>
                        <input type="number" placeholder="Delivery Charges" required>
                        <input type="number" placeholder="Total Amount" required>
                        <label for="update-image">Upload New Image:</label>
                        <input type="file" id="update-image" name="update-image" accept="image/*">
                        <button type="submit">Update</button>
                    </form>
                </div>
            </div>
 
            <div class="dropdown">
                <button class="dropbtn">View Product</button>
                <div class="dropdown-content">
                    <form class="view-product-form">
                        <label for="view-category">Select Category:</label>
                        <select id="view-category" required>
                            <option value="">Select Category</option>
                            <option value="fridge">Fridge</option>
                            <option value="mobiles">Mobiles</option>
                            <option value="laptops">Laptops</option>
                        </select>
                        <label for="view-like">View Like:</label>
                        <select id="view-like" required>
                            <option value="view-all">View All</option>
                            <option value="price-low-high">Price Low to High</option>
                            <option value="price-high-low">Price High to Low</option>
                        </select>
                        <button type="submit">View Results</button>
                    </form>
                </div>
            </div>
        </div>
 
        <div class="results-display">
            <!-- Space for display of results -->
            <h2>Results</h2>
        </div>
    </main>
</body>
</html>
