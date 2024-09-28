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
                <a href="#" class="nav-item">View Profile</a>
                <a href="#" class="nav-item">Logout</a>
            </div>
        </div>
    </header>

    <main class="container">
        <div class="box-container">
            <div class="box">View Category</div>
            <div class="box">Add Product</div>
            <div class="box">Delete Product</div>
            <div class="box">Update Product</div>
            <div class="box">View Product</div>
        </div>
    </main>
</body>
</html>
