<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");

    if (newPassword != null && confirmPassword != null) {
        if (newPassword.equals(confirmPassword)) {
            // Here you would typically update the password in your database
            out.println("<script>alert('Password has been reset successfully!');</script>");
        } else {
            out.println("<script>alert('Passwords do not match. Please try again.');</script>");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
</head>
<body>
    <div class="container">
        <h2>Reset Password</h2>
        <form action="resetPassword.jsp" method="post">
            <input type="password" name="newPassword" placeholder="Enter new password" required>
            <input type="password" name="confirmPassword" placeholder="Confirm new password" required>
            <button type="submit">Reset Password</button>
        </form>
    </div>
</body>
</html>
