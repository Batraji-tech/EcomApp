<<<<<<< HEAD
<<<<<<< HEAD
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
        <form>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group radio-group">
                <label>
                    <input type="radio" name="userType" value="Customer" required> Customer
                </label>
                <label>
                    <input type="radio" name="userType" value="Retailer" required> Retailer
                </label>
            </div>
			
            <button type="submit" class="login-button">Login</button>
        </form>
		<p class="register-link">Don't have an account? <a href="/user/openRegistrationPage">Register here</a></p>
		

    </div>
</body>
</html>
=======
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
        <form>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group radio-group">
                <label>
                    <input type="radio" name="userType" value="Customer" required> Customer
                </label>
                <label>
                    <input type="radio" name="userType" value="Retailer" required> Retailer
                </label>
            </div>
			
            <button type="submit" class="login-button">Login</button>
        </form>
		<p class="register-link">Don't have an account? <a href="/user/openRegistrationPage">Register here</a></p>
		

    </div>
</body>
</html>
>>>>>>> 7dbe465dde9125b25618cbff6036e9cc2988c401
=======
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
            <div class="form-group radio-group">
                <label>
                    <input type="radio" name="userType" value="Customer" required> Customer
                </label>
                <label>
                    <input type="radio" name="userType" value="Retailer" required> Retailer
                </label>
            </div>
			
            <button type="submit" class="login-button">Login</button>
        </form>
		<p class="register-link">Don't have an account? <a href="/user/openRegistrationPage">Register here</a></p>
		

    </div>
</body>
</html>
>>>>>>> 56c6e71fdc0efd2eec745b6abf5c0758d36b789f
 