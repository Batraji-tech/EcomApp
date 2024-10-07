<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link href="../css/styles.css" rel="stylesheet"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef; /* Light background for better contrast */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 400px; /* Set a max width for the container */
            background: white;
            padding: 30px; /* Increased padding for better spacing */
            border-radius: 10px; /* Softer corners */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Slightly heavier shadow for depth */
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333; /* Darker text for better readability */
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold; /* Make labels stand out */
            color: #555; /* Soft gray for label text */
        }
        input {
            width: 100%;
            padding: 12px; /* Increased padding for input fields */
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px; /* Set a standard font size for input text */
            transition: border-color 0.3s; /* Smooth transition for border color */
        }
        input:focus {
            border-color: #4CAF50; /* Highlight border color on focus */
            outline: none; /* Remove default outline */
        }
        .button-group {
            display: flex;
            justify-content: space-between;
        }
        button {
            width: 48%; /* Reduced width to fit two buttons */
            padding: 12px; /* Increased padding for buttons */
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px; /* Increased font size for better readability */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }
        button:hover {
            background-color: #45a049; /* Darker green on hover */
        }
        .back-button {
            background-color: #ff6600; /* Different color for Back to Dashboard */
        }
        .back-button:hover {
            background-color: #ff3300; /* Darkened hover state for Back to Dashboard */
        }
        .success, .error {
            text-align: center;
            margin-top: 20px;
            font-weight: bold; /* Bold for success/error messages */
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Reset Password</h1>
        <form method="POST" action="/user/resetPassword">
            <div>
                <label for="username">Username:</label>
                <input type="text" name="username" id="username" required/>
            </div>
            <div>
                <label for="newPassword">New Password:</label>
                <input type="password" name="newPassword" id="newPassword" required/>
            </div>
            <div>
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" name="confirmPassword" id="confirmPassword" required/>
            </div>
            <div class="button-group">
                <button type="submit">Reset Password</button>
                <button type="button" class="back-button" onclick="window.location.href='${pageContext.request.contextPath}/subadmin'">Back to Dashboard</button>
            </div>
        </form>

        <c:if test="${not empty message}">
            <div class="alert success">
                ${message}
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="alert error">
                ${error}
            </div>
        </c:if>
    </div>
</body>
</html>
