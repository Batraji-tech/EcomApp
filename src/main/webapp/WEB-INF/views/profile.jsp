<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">


  </head>
<body>
    <header class="header">
        <div class="logo">Shopology</div>
            </div>
    </header>

                <input type="text" id="mobileno" value="+1234567890" placeholder="Enter Mobile No" readonly>
 

    <div class="container">
        <div class="profile-box">
            <img src="https://i.pinimg.com/222x/f5/3e/c6/f53ec61db2e49c82b057554cb4a0cb91.jpg" alt="Profile Image" class="profile-image-top">
            <div class="user-details">
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" value="John" placeholder="Enter First Name" readonly>

                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" value="Doe" placeholder="Enter Last Name" readonly>

                <label for="username">Username:</label>
                <input type="text" id="username" value="johndoe" placeholder="Enter Username" readonly>

                <label for="address">Address:</label>
                <input type="text" id="address" value="123 Main St" placeholder="Enter Address" readonly>

                <label for="mobileno">Mobile No:</label>
                <input type="text" id="mobileno" value="+1234567890" placeholder="Enter Mobile No" readonly>


                <label for="gender">Gender:</label>
                <input type="text" id="gender" value="Male" placeholder="Enter Gender" readonly>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2024 Your E-Commerce Site | All Rights Reserved</p>
    </footer>
</body>
</html>
