<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Products</title>
    <style>
        body {
            background-color: #E6F9E6;
            font-family: Arial, sans-serif;
            margin: 0; 
        }
        .message {
            color: #003366;
            font-size: 16px;
            font-weight: bold;
            text-align: left; 
            margin: 20px; 
        }
        .container {
            width: 80%; 
            margin: auto; 
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            background: white; 
        }
        table {
            width: 100%;
            border-collapse: collapse; 
        }
        th, td {
            border: 1px solid #003366;
            padding: 10px;
            text-align: left; 
        }
        th {
            background-color: #003366;
            color: white;
        }
        .productname {
            font-weight: bold;
            color: #003366; 
        }
        .price {
            color: #00ff00; 
            font-weight: bold;
        }
        .btn {
            padding: 10px 15px;
            border-radius: 5px;
            color: #003366; 
            border: none;
            cursor: pointer;
            background-color: #00ff00; 
            transition: background-color 0.3s;
            margin: 5px; 
        }
        .btn:hover {
            background-color: #00cc00; 
        }
        /* Set specific widths for the MRP and Final Price columns */
        th:nth-child(5), td:nth-child(5) { /* MRP column */
            width: 150px; /* Adjust the width as needed */
        }
        th:nth-child(7), td:nth-child(7) { /* Final Price column */
            width: 150px; /* Adjust the width as needed */
        }
    </style>
</head>
<body>

    <div class="message">All Products</div>

    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>MRP</th>
                    <th>Final Price</th>
                    <th>Stock</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>
                        <img src="path/to/product-image1.jpg" alt="Product" style="height: 150px; max-width: 180px;">
                    </td>
                    <td class="productname">Product Name 1</td>
                    <td>₹ 1,200.00</td>
                    <td class="price">₹ 1,100.00</td>
                    <td>50</td>
                    <td>
                        
                        <button class="btn">Remove Product</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>
                        <img src="path/to/product-image2.jpg" alt="Product" style="height: 150px; max-width: 180px;">
                    </td>
                    <td class="productname">Product Name 2</td>
                    <td>₹ 1,500.00</td>
                    <td class="price">₹ 1,400.00</td>
                    <td>30</td>
                    <td>
                        
                        <button class="btn">Remove Product</button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>
                        <img src="path/to/product-image3.jpg" alt="Product" style="height: 150px; max-width: 180px;">
                    </td>
                    <td class="productname">Product Name 3</td>
                    <td>₹ 2,000.00</td>
                    <td class="price">₹ 1,800.00</td>
                    <td>20</td>
                    <td>
                      
                        <button class="btn">Remove Product</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</body>
</html>
