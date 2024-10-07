<%@ page import="ecom.app.entities.Products"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"],
        input[type="number"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #218838;
        }
        .message {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message">Update Product</div>

        <% 
            // Assuming product details are stored in request attribute "product"
            Products product = (Products) request.getAttribute("product"); 
            if (product != null) {
        %>
            <form action="${pageContext.request.contextPath}/products/product_updation" method="post" enctype="multipart/form-data">
                <input type="hidden" name="product_id" value="<%= product.getProduct_id() %>">

                <label for="product_name">Product Name:</label>
                <input type="text" id="product_name" name="product_name" value="<%= product.getProduct_name() %>" required />

                <label for="description">Description:</label>
                <textarea id="description" name="description" required><%= product.getDescription() %></textarea>

                <label for="mrp">MRP:</label>
                <input type="number" id="mrp" name="mrp" value="<%= product.getMrp() %>" required />

                <label for="discount">Discount in Percentage:</label>
                <input type="number" id="discount" name="discount" value="<%= product.getDiscount() %>" required />

                   <label for="delivery_charge">Delivery Charge:</label>
                <input type="number" id="delivery_charge" name="delivery_charge" value="<%= product.getDelivery_charge() %>" required />
             
                <label for="final_price">Final Price:</label>
                <input type="number" id="final_price" name="final_price" value="<%= product.getFinal_price() %>" required />

                <label for="stock">Stock:</label>
                <input type="number" id="stock" name="stock" value="<%= product.getStock() %>" required />

                <label for="product_image">Product Image:</label>
                <input type="file" id="product_image" name="product_image" />

                <button type="submit">Update Product</button>
            </form>
        <% } else { %>
            <div class="error-message">Product not found.</div>
        <% } %>
    </div>
</body>
</html>
