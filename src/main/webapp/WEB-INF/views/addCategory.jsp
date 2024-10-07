<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Category</title>
    <style>
        body {
            background-color: #E6F9E6; /* Light grey background */
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .form-container {
            border: 1px solid #003366; /* Dark blue border */
            border-radius: 10px;
            background-color: #ffffff; /* White background for the form */
            padding: 40px;
            margin: 50px auto; /* Center the container */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px; /* Adjusted max width */
        }
        h2 {
            color: #003366; /* Dark blue */
            margin-bottom: 20px;
            text-align: center; /* Centered heading */
        }
        .message {
            color: #003366; /* Dark blue */
            margin-bottom: 20px;
            text-align: center;
        }
        label {
            font-weight: bold;
            color: #003366; /* Dark blue */
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #cccccc;
            width: 100%; /* Full width for input fields */
            margin-bottom: 15px; /* Space between inputs */
            padding: 10px; /* Padding for input fields */
        }
        .btn {
            border-radius: 5px;
            font-size: 16px;
            margin-top: 10px; /* Space above buttons */
            padding: 10px; /* Padding for buttons */
            width: 100%; /* Full width for buttons */
            background-color: #00ff00; 
            border: none;
            color: white;
        }
        .btn:hover {
            background-color: #00cc00; /* Darker green on hover */
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row">
          <form class="form-container" enctype="multipart/form-data" method="post" action="/category/add">
    <div class="text-center">
        <h2>Add Category</h2>
        <p class="message">Enter the category details below.</p>
    </div>
    <div class="form-group">
        <label for="categoryName">Category Name</label>
        <input type="text" placeholder="Enter Category Name" name="category_name" class="form-control" id="categoryName" required>
    </div>
    <div class="form-group">
        <label for="description">Description</label>
        <textarea name="description" placeholder="Enter Category Description" class="form-control" id="description" required></textarea>
    </div>
    
    <div class="form-group">
        <label for="image">Product Image</label>
        <input type="file" name="category_image" class="form-control" id="image" required>
    </div>
    
    <div class="row">
        <div class="col-md-6">
            <button type="reset" class="btn">Reset</button>
        </div>
        
        <div class="col-md-6">
            <button type="submit" class="btn">Add Category</button>
        </div>
    </div>
</form>

        </div>
    </div>

</body>
</html>
