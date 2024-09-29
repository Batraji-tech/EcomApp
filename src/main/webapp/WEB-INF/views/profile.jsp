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
		
		<%
						User user = (User) request.getAttribute("user");
						
					%>
					
		
        <div class="profile-box">
			<button type="submit" class="edit-button"onclick="window.location.href='/editprofile'">Edit</button>
            <div class="user-details">
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" value="<%= user.getFirstName() %>" placeholder="Enter First Name" readonly>

                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" value="<%= user.getLastName() %>" placeholder="Enter Last Name" readonly>

                <label for="username">Username:</label>
                <input type="text" id="username" value="<%= user.getUsername() %>" placeholder="Enter Username" readonly>

                <label for="mobileno">Mobile No:</label>
                <input type="text" id="mobileno" value="<%= user.getMobileNo() %>" placeholder="Enter Mobile No" readonly>
            
				<label for="emailId">Email Id:</label>
		   <input type="text" id="emailId" value="<%= user.getEmailId() %>" placeholder="Enter Email Id" readonly>
				</div>
        </div>
    </div>
	

    <footer class="footer">
        <p>&copy; 2024 Your E-Commerce Site | All Rights Reserved</p>
    </footer>
</body>
</html>
