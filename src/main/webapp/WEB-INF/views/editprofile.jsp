<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 50%;
            display: block;
            margin: 20px auto;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Profile</h2>

        <% String profileImage = (String) request.getAttribute("profileImage"); %>
        <% if (profileImage != null) { %>
            <img src="data:image/jpeg;base64,<%= profileImage %>" alt="Profile Image" />
        <% } else { %>
            <p>No Profile Image</p>
        <% } %>

        <form action="${pageContext.request.contextPath}/user/updateProfile" method="post" enctype="multipart/form-data">
            <label for="username"></label>
            <input id="username" type="hidden" name="username" value="${user.username}" required />

            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" value="${user.firstName}" required />

            <label for="mobileNo">Mobile No:</label>
            <input type="text" id="mobileNo" name="mobileNo" value="${user.mobileNo}" required />

            <label for="dateOfBirth">DOB:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" value="${user.dateOfBirth}" required />

            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" value="${user.lastName}" required />

            <label for="emailId">Email:</label>
            <input type="email" id="emailId" name="emailId" value="${user.emailId}" required />

            <label for="profileImage">Profile Image:</label>
            <input type="file" id="profileImage" name="profileImage" />

            <button type="submit">Update Profile</button>
        </form>
    </div>
</body>
</html>
