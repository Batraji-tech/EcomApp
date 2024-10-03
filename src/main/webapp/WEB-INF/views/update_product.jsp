<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Product</title>
    <style>
        body {
            background-color: #E6F9E6; /* Light green background */
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }
        .form-container {
            border: 1px solid #003366; /* Dark blue border */
            border-radius: 10px;
            background-color: #ffffff; /* White background for the form */
            padding: 40px; /* Increased padding for a larger container */
            margin: 0 auto; /* Center the container */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            max-width: 800px; /* Increased max width */
        }
        h2 {
            color: #003366; /* Dark blue */
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 28px; /* Increased font size */
        }
        .message {
            color: #003366; /* Dark blue */
            margin-bottom: 20px;
            text-align: center;
            font-size: 16px;
        }
        label {
            font-weight: bold;
            color: #003366; /* Dark blue */
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #cccccc;
            transition: border-color 0.3s;
            width: 100%; /* Full width for input fields */
            margin-bottom: 15px; /* Space between inputs */
        }
        .form-control:focus {
            border-color: #00ff00; /* Green on focus */
            box-shadow: 0 0 5px rgba(0, 255, 0, 0.5);
        }
        .btn-danger, .btn-success {
            border-radius: 5px;
            font-size: 16px;
            margin-top: 10px; /* Space above buttons */
            padding: 10px; /* Padding for buttons */
        }
        .btn-danger {
            background-color: #00ff00; 
            border-color: #00ff00;
        }
        .btn-success {
            background-color: #00ff00; 
            border-color: #00ff00;
        }
        .btn-danger:hover, .btn-success:hover {
            background-color: #00cc00; /* Darker green on hover */
            border-color: #00cc00;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #003366; /* Dark blue */
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form class="form-container" method="post" action="">
                    <div class="text-center">
                        <img src="path/to/product_image.jpg" alt="Product Image" height="100px" />
                        <h2>Product Update</h2>
                        <p class="message">Update the product details below.</p>
                    </div>
                    
                    <input type="hidden" name="pid" value="123"> <!-- Example Product ID -->
                    
                    <div class="form-group">
                        <label for="name">Product Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Enter Product Name" value="Product Name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Product Description</label>
                        <textarea name="description" class="form-control" placeholder="Enter Product Description" required>Sample product description.</textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="mrp">MRP</label>
                        <input type="number" name="mrp" class="form-control" placeholder="Enter MRP" value="100.00" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="discount">Discount</label>
                        <input type="number" name="discount" class="form-control" placeholder="Enter Discount" value="10.00" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="final_price">Final Price</label>
                        <input type="number" name="final_price" class="form-control" placeholder="Enter Final Price" value="90.00" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="stock">Stock Quantity</label>
                        <input type="number" name="stock" class="form-control" placeholder="Enter Stock Quantity" value="50" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="delivery_charges">Delivery Charges</label>
                        <input type="number" name="delivery_charges" class="form-control" placeholder="Enter Delivery Charges" value="5.00" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="image">Product Image</label>
                        <input type="file" name="image" class="form-control" required>
                    </div>

                    <div class="row text-center">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-danger" onclick="window.location.href='/subadmin'">Cancel</button>
                        </div>
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-success">Update Product</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="footer">
        © 2024 Shopology. All rights reserved.
    </div>

</body>
</html>
