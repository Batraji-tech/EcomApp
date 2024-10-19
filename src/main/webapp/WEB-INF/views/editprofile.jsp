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
            font-family: 'Arial', sans-serif;
            background-color: #F2EED7; 
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #FF9874; 
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
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
            margin-top: 15px;
            font-weight: bold;
            color: #555; 
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="file"] {
            width: 100%;
            padding: 12px;
            margin: 5px 0 20px 0;
            border: 2px solid #295F98; 
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="date"]:focus {
            border-color: #80bdff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #295F98; 
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1a3a6e; 
        }

        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }

        @media (max-width: 600px) {
            .container {
                padding: 15px;
            }

            button {
                font-size: 14px;
            }
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
