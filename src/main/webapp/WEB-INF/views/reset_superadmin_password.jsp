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
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 40%;
            max-width: 500px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
		.button-group {
		            display: flex;
		            justify-content: space-between;
		        }
		        button {
		            width: 48%; /* Reduced width to fit two buttons */
		            padding: 10px;
		            background-color: #4CAF50;
		            color: white;
		            border: none;
		            border-radius: 4px;
		            cursor: pointer;
		        }
		        button:hover {
		            background-color: #45a049;
		        }
		        .back-button {
		            background-color: #ff6600; /* Different color for Back to Dashboard */
		        }
		        .back-button:hover {
		            background-color: #ff3300; /* Darkened hover state for Back to Dashboard */
		        }
		
        button:hover {
            background-color: #45a049;
        }
        .success, .error {
            text-align: center;
            margin-top: 20px;
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

		
				


        <form method="POST" action="/superAdmin/resetPassword">
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
				<div class="button-group">
				                <button type="submit">Reset Password</button>
				                <button type="button" class="back-button" onclick="window.location.href='${pageContext.request.contextPath}/superAdmin/login'">Back to Dashboard</button>
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
