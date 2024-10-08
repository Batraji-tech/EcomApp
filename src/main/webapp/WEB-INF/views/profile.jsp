<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ecom.app.entities.User" %>

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
    </header>

    <div class="container">
        <% User user = (User) request.getAttribute("user"); %>
        <div class="profile-box">

            <button class="edit-button" type="button" onclick="window.location.href='${pageContext.request.contextPath}/user/editprofile'">Edit Profile</button>


            <div class="user-details">
                <% String profileImage = (String) request.getAttribute("profileImage"); %>
                <% if (profileImage != null && !profileImage.isEmpty()) { %>
                    <img src="data:image/jpeg;base64,<%= profileImage %>" alt="Profile Image" />
                <% } else { %>
                    <p>No Profile Image</p>
                <% } %>

                <div class="field">
                    <label for="firstname">First Name:</label>
                    <input type="text" id="firstname" value="<%= user.getFirstName() %>" readonly>
                </div>

                <div class="field">
                    <label for="lastname">Last Name:</label>
                    <input type="text" id="lastname" value="<%= user.getLastName() %>" readonly>
                </div>

                <div class="field">
                    <label for="username">Username:</label>
                    <input type="text" id="username" value="<%= user.getUsername() %>" readonly>
                </div>

                <div class="field">
                    <label for="mobileno">Mobile No:</label>
                    <input type="text" id="mobileno" value="<%= user.getMobileNo() %>" readonly>
                </div>

                <div class="field">
                    <label for="emailId">Email Id:</label>
                    <input type="text" id="emailId" value="<%= user.getEmailId() %>" readonly>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2024 Your E-Commerce Site | All Rights Reserved</p>
    </footer>
</body>
</html>
