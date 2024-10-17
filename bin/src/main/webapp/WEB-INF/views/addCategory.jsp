<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Category</title>
    <style>
        body {
            background-color: #F2EED7;
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .form-container {
            border: 1px solid #295F98;
            border-radius: 10px;
            background-color: #ffffff;
            padding: 40px;
            margin: 50px auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
        }
        h2 {
            color: #FF9874;
            margin-bottom: 20px;
            text-align: center;
        }
        .message {
            color: #295F98;
            margin-bottom: 20px;
            text-align: center;
        }
        label {
            font-weight: bold;
            color: #295F98;
        }
        .form-control {
            border-radius: 5px;
            border: 2px solid #295F98; 
            width: 94%;
            margin-bottom: 15px;
            padding: 12px;
            font-size: 16px;
        }
        .form-control:focus {
            border-color: #295F98;
            outline: none;
        }
        .btn {
            border-radius: 5px;
            font-size: 16px;
            margin-top: 10px;
            padding: 10px;
            width: 100%;
            background-color: #295F98;
            border: none;
            color: white;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #1a3a6e;
        }
        .row {
            display: flex;
            justify-content: space-between;
        }
        .col-md-6 {
            flex: 0 0 48%;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row">
            <form class="form-container" enctype="multipart/form-data" method="post" action="/category/add">
                <div class="text-center">
                    <h2>Add Category</h2>
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
