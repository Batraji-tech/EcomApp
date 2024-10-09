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

        <!-- Display error message if it exists -->
        <%
            String errorMessage = (String) request.getAttribute("error");
            if (errorMessage != null) {
        %>
            <div class="error" style="color: red;">
                <%= errorMessage %>
            </div>
        <%
            }
        %>

        <br>
        <form action="/superAdmin/login" method="post" autocomplete="off">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required autocomplete="off">
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required autocomplete="off">
            </div>
            <button type="submit">Login</button>
        </form>
        <br>
        <div class="reset_password">
            <a href="/superAdmin/forgotpassword">Forgot Password?</a>
        </div>
        <br>
       
    </div>
</body>
</html>
