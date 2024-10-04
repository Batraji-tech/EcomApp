<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login_superadmin.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #003366;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .forgot-password-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #00ff00;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        button:hover {
            background-color: #00cc00; /* Darkened the hover color for better visibility */
        }

        .error {
            color: red;
            margin-top: 10px;
            text-align: center;
        }

        .message {
            color: green;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="forgot-password-container">
        <h2>Forgot Password</h2>

        <%-- Display error message if exists --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <%-- Display success message if exists --%>
        <% if (request.getAttribute("message") != null) { %>
            <div class="message"><%= request.getAttribute("message") %></div>
        <% } %>

        <form id="emailVerificationForm" action="${pageContext.request.contextPath}/superadmin/verify_email" method="post">
            <div class="input-group" id="emailGroup">
                <br>
                <center><strong><label for="email">Enter your email</label></strong></center>
                <input type="email" id="email" name="email" required placeholder="example@domain.com">
                <button type="submit" onclick="hideEmailGroup()">Verify Email</button>
            </div>
        </form>

        <%-- Password reset section --%>
        <div id="resetPasswordSection" style="display:none;">
            <form id="resetPasswordForm" action="${pageContext.request.contextPath}/superadmin/resetpassword" method="post">
                <input type="hidden" name="email" value="${request.getAttribute("email")}" />
                
                <%-- Display error message for password issues --%>
                <% if (request.getAttribute("error") != null) { %>
                    <div class="error"><%= request.getAttribute("error") %></div>
                <% } %>

                <div class="input-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" required placeholder="Enter new password">
                </div>
                <div class="input-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm new password">
                </div>
                <button type="submit">Reset Password</button>
            </form>
        </div>
    </div>

    <script>
        function hideEmailGroup() {
            document.getElementById('emailGroup').style.display = 'none';
            document.getElementById('resetPasswordSection').style.display = 'block';
        }

        <%-- JavaScript to handle displaying the password reset section if email is verified --%>
        window.onload = function() {
            var emailVerified = "<%= request.getAttribute("emailVerified") != null ? request.getAttribute("emailVerified") : "false" %>";
            if (emailVerified === "true") {
                hideEmailGroup(); // Show the password reset section if the email is already verified
            }
        };
    </script>
</body>
</html>
