<<<<<<< HEAD:src/main/webapp/WEB-INF/views/superadmin_login.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Superadmin Login Page</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login_superadmin.css">
</head>
<body>
    <div class="login-container">
        <h2>Super Admin Login</h2>
        <form action="superadmin_login.jsp" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        
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
		<p class="register-link">Don't have an account? <a href="/register">Register here</a></p>
    </div>
</body>
</html>
>>>>>>> 958b0dda5d2a4b250206c332ff12d6ae2b6b0c5a:src/main/webapp/WEB-INF/views/login.jsp
 