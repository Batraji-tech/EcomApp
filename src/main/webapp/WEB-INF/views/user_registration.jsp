<%@page import="ecom.app.entities.Role"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <script src="../js/registerPageValidation.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #F2EED7;
            color: #295F98;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            overflow-y: auto;
        }

        .container {
            background-color: #FFFFFF;
            padding: 50px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 370px;
            text-align: left;
            display: flex;
            flex-direction: column;
            height: 600px; 
        }

        h2 {
            margin-bottom: 15px;
            text-align: center;
            color:#FF9874;
        }

        .form-group {
            margin-bottom: 10px;
            margin-right: 20px;
        }

        input[type="text"],
        input[type="tel"],
        input[type="email"],
        input[type="date"],
        input[type="password"],
        textarea,
        select {
            width: 100%;
            padding: 8px;
            border: 2px solid #295F98;
            border-radius: 5px;
            background-color: white;
            color: black;
        }

        .radio-group {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
            margin-top: 15px;
        }

        .radio-group label {
            display: flex;
            align-items: center;
            margin: 0 10px;
            cursor: pointer;
        }

        input[type="radio"] {
            appearance: none; 
            width: 20px;
            height: 20px;
            border: 2px solid #295F98;
            border-radius: 50%;
            outline: none;
            cursor: pointer;
            margin-right: 5px;
            transition: background-color 0.3s, border-color 0.3s;
        }

        input[type="radio"]:checked {
            background-color: #295F98;
            border-color: #1a3a6e;
        }

        input[type="radio"]:hover {
            border-color: #1a3a6e;
        }

        .register-button {
            background-color: #295F98;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .register-button:hover {
            background-color: #1a3a6e;
        }
    </style>
</head>
<body>
    <%
        List<Role> rolesList = (List<Role>) request.getAttribute("listOfRoles");
    %>

    <div class="container">
        <h2>Registration</h2>
        <form action="/user/register" method="post" enctype="multipart/form-data" onsubmit="return validateRegisterForm()">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstname" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastname" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile No:</label>
                <input type="tel" id="mobileNo" name="mobileNo" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="emailId" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dateOfBirth" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="file-input-group">
                <label for="profileImage">Profile Image:</label>
                <input type="file" id="profileImage" name="profileImage" accept=".jpg, .jpeg, .png" required>
            </div>
            <div class="radio-group">
                <label>Select Role:</label>
                <% for (Role role : rolesList) { %>
                    <label>
                        <input type="radio" name="roleId" value="<%=role.getRoleId()%>" />
                        <%= role.getRoleName() %>
                    </label>
                <% } %>
            </div>
            <button type="submit" class="register-button">Register</button>
            <%@include file="message.jsp" %>
        </form>
    </div>
</body>
</html>
