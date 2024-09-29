<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/editprofile.css">
</head>
<body>
    <header class="header">
        <div class="logo">Shopology</div>
    </header>

    <div class="container">
        <div class="profile-box">
            <h2>Update Profile</h2>
            <form action="" method="post">
                <div class="user-details">
                    <label for="firstname">First Name:</label>
                    <input type="text" id="firstname" name="firstname" placeholder="Enter First Name" required>

                    <label for="lastname">Last Name:</label>
                    <input type="text" id="lastname" name="lastname" placeholder="Enter Last Name" required>

                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username"  placeholder="Enter Username" required>

                    <label for="mobileno">Mobile No:</label>
                    <input type="text" id="mobileno" name="mobileno" placeholder="Enter Mobile No" required>

                    <label for="emailId">Email Id:</label>
                    <input type="email" id="emailId" name="emailId" placeholder="Enter Email Id" required>
                </div>
                <button type="submit" class="update">Update</button>
            </form>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2024 Your E-Commerce Site | All Rights Reserved</p>
    </footer>
</body>
</html>

