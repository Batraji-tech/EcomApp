<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search by Category Name</title>
    <style>
        body {
            background-color: #E6F9E6; /* Light green background */
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }
        .search-container {
            border: 1px solid #003366; /* Dark blue border */
            border-radius: 10px;
            background-color: #ffffff; /* White background for the search form */
            padding: 40px;
            margin: 0 auto;
            max-width: 500px; /* Maximum width */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #003366; /* Dark blue */
            margin-bottom: 20px;
            text-align: center;
        }
        .btn-search {
            background-color: #00ff00; /* Bright green */
            border-color: #00ff00;
            color: #003366; /* Dark blue text */
            font-size: 16px;
            width: 100%;
            border-radius: 5px;
            margin-top: 20px;
        }
        .btn-search:hover {
            background-color: #00cc00; /* Darker green */
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
        <div class="search-container">
            <h2>Search by Category Name</h2>

            <form>
                <div class="form-group">
                    <label for="categoryName">Select Category:</label>
                    <select name="categoryName" id="categoryName" required>
                        <option value="" disabled selected>Select a category</option>
                        <option value="refrigerator">Refrigerator</option>
                        <option value="mobiles">Mobiles</option>
                        <option value="laptops">Laptops</option>
                    </select>
                </div>
                <button type="submit" class="btn-search">Search Products</button>
            </form>
        </div>
    </div>

    <div class="footer">
        © 2024 Shopology. All rights reserved.
    </div>

</body>
</html>
