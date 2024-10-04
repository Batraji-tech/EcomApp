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

        <!-- Display error message if exists -->
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="/superadmin/login" method="post" autocomplete="off">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter Username" required autocomplete="off">
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter Password"  required autocomplete="off">
            </div>
            <button type="submit">Login</button>
        </form>
        <br>
        <div class="reset_password">
            <a href="/reset_password">Forgot Password?</a>
        </div>
    </div>
</body>
</html>
