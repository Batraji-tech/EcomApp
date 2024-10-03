<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #E6F9E6;
            margin: 0;
            padding: 0;
            display: flex; /* Use flexbox to center content */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
        }
        header {
            background-color: #003366; 
            color: white;
            display: flex;
            justify-content: space-between; 
            align-items: center; 
            padding: 20px 30px; 
            width: 100%; /* Full width for the header */
            position: absolute; /* Fix the header at the top */
            top: 0; /* Align to top */
			padding-right:15px;
			
			
        }
        .container {
            width: 80%;
            max-width: 800px;
            margin: 0; /* Remove margin to center it */
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin: 0;
            font-size: 2.5em;
            text-align: left; /* Align text to the left */
        }
        .tab {
            text-align: center;
        }
        .link {
            background-color: #00ff00; /* Bright green */
            color: #003366; /* Dark blue text */
            text-decoration: none; /* Remove underline */
            border-radius: 5px;
            padding: 15px 25px;
            font-size: 16px;
            margin: 10px;
            display: inline-block; /* Make the link behave like a button */
            transition: background-color 0.3s ease;
        }
        .link:hover {
            background-color: #00cc00; /* Darker green on hover */
        }
        @media (max-width: 600px) {
            .link {
                width: 100%;
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>

    <header>
        <h1>Sub-Admin Dashboard</h1>
        <div class="profile-links">
            <a href="profile.jsp" class="link">View Profile</a>
            <a href="/" class="link">Logout</a>
        </div>
    </header>

    <div class="container">
        <div class="tab">
            <form>
                <a href="/products" class="link">Add Products</a>
                <a href="/update_table" class="link">Update Product</a>
                <a href="/remove_product" class="link">Remove Product</a>
                <a href="/view_product" class="link">View All Products</a>
                <a href="/view_productbycategoryname" class="link">View by Category Name</a>
            </form>
        </div>
    </div>

</body>
</html>
