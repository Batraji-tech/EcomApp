<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
		
		<form action="/user/login" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
			<div>
			<label for="role">Select Role:</label>
			<select id="role" name="role">
			    <option value="customer">Customer</option>
			    <option value="retailer">Retailer</option>
			</select>

         <div>
			<div>
            <button type="submit" class="login-button">Login</button>
			<div>
        </form>
		<p class="register-link">Don't have an account? <a href="/user/openRegistrationPage">Register here</a></p>
		
		<%@include file="message.jsp" %>


    </div>
</body>
</html>