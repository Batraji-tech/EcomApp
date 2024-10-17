<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ecom.app.entities.Category" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Product</title>
    <style>
        body {
            background-color: #F2EED7; /* Soft background */
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .form-container {
            border: 2px solid #ffffff; /* Dark blue border */
            border-radius: 10px;
            background-color: #ffffff; /* White background for the form */
            padding: 40px;
            margin: 50px auto; /* Center the container */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px; /* Increased max width */
        }
        h2 {
            color: #FF9874; /* Soft orange */
            margin-bottom: 20px;
            text-align: center; /* Centered heading */
        }
        .message {
            color: #295F98; /* Dark blue */
            margin-bottom: 20px;
            text-align: center;
        }
        label {
            font-weight: bold;
            color: #295F98; /* Dark blue */
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #295F98; /* Dark blue border */
            width: 97%; /* Full width for input fields */
            margin-bottom: 15px; /* Space between inputs */
            padding: 10px; /* Padding for input fields */
        }
        .form-control:focus {
            border-color: #295F98 ; /* Green on focus */
            box-shadow: 0 0 5px #295F98;
        }
        .category-dropdown {
            width: 500%; /* Default width, can be adjusted */
            max-width: 800px; /* Max width can be set */
        }
        .btn {
            border-radius: 5px;
            font-size: 16px;
            margin-top: 10px; /* Space above buttons */
            padding: 10px; /* Padding for buttons */
            width: 100%; /* Full width for buttons */
            background-color: #295F98; /* Dark blue */
            border: none;
            color: white; /* White text for buttons */
            cursor: pointer;
        }
        .btn:hover {
            background-color: #1a3a6e; /* Darker blue on hover */
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row">
            <form class="form-container" enctype="multipart/form-data" method="post" action="/products/add">
                <div class="text-center">
                    <h2>Product Addition</h2>
                </div>
                <div class="form-group">
                    <label for="name">Product Name</label>
                    <input type="text" placeholder="Enter Product Name" name="product_name" class="form-control" id="name" required>
                </div>
                <div class="form-group">
                    <label for="description">Product Description</label>
                    <textarea name="description" placeholder="Enter Product Description" class="form-control" id="description" required></textarea>
                </div>
                <div class="form-group">
                    <label for="mrp">MRP</label>
                    <input type="number" step="0.01" placeholder="Enter MRP" name="mrp" class="form-control" id="mrp" required>
                </div>
                <div class="form-group">
                    <label for="discount">Discount</label>
                    <input type="number" step="0.01" placeholder="Enter Discount" name="discount" class="form-control" id="discount">
                </div>
                <div class="form-group">
                    <label for="delivery_charges">Delivery Charges</label>
                    <input type="number" step="0.01" placeholder="Enter Delivery Charges" name="delivery_charge" class="form-control" id="delivery_charges">
                </div>
                <div class="form-group">
                    <label for="final_price">Final Price</label>
                    <input type="number" step="0.01" placeholder="Enter Final Price" name="final_price" class="form-control" id="final_price" required>
                </div>
                <div class="form-group">
                    <label for="stock">Stock Quantity</label>
                    <input type="number" placeholder="Enter Stock Quantity" name="stock" class="form-control" id="stock" required>
                </div>
            
             <label for="category_id">Category</label>
                <select name="category_id" id="category_id" class="form-control" required>
                <%
                        List<Category> categories = (List<Category>) request.getAttribute("categories");
                      for (Category category : categories) {
                %>
                <option value="<%= category.getCategory_id() %>"><%= category.getCategory_name() %></option>
              <%
                 }
              %>
             </select>
                 </div>
                <div class="form-group">
                    <label for="image">Product Image</label>
                    <input type="file" name="product_image" class="form-control" id="image" required>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <button type="reset" class="btn">Reset</button>
                    </div>
                    <div class="col-md-6">
                        <button type="submit" class="btn">Add Product</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
