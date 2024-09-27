<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/superadmin.css">
    <style>
        .hidden {
            display: none;
        }
        .container {
            margin-top: 20px;
        }
        .form-container {
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .input-wrapper {
            background-color: white;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .form-container input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #033E3E;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #033E3E;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>Super Admin Dashboard</h1>
    </header>

    <div class="container">
        <ul class="nav-links">
            <li><a href="#" onclick="showResetPasswordForm()">Reset Password</a></li>
            <li><a href="/admin/viewProfile">View Profile</a></li>
            <li><a href="/admin/updateProfile">Update Profile</a></li>
            <li><a href="/admin/viewCustomers">View Customers</a></li>
            <li><a href="/admin/viewSubAdmins">View Sub Admins</a></li>
        </ul>

        <div id="resetPasswordForm" class="form-container hidden">
            <h2>Reset Password</h2>
            <form action="resetPassword.jsp" method="post">
                <div class="input-wrapper">
                    <input type="password" name="newPassword" placeholder="Enter new password" required>
                </div>
                <div class="input-wrapper">
                    <input type="password" name="confirmPassword" placeholder="Confirm new password" required>
                </div>
                <button type="submit">Reset Password</button>
            </form>
        </div>
    </div>

    <footer class="footer">
        <p>© 2024 Your E-Commerce Site | All Rights Reserved</p>
    </footer>

    <script>
        function showResetPasswordForm() {
            document.getElementById('resetPasswordForm').classList.remove('hidden');
        }
    </script>
</body>
</html>
