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
    input[type="text"], input[type="email"], input[type="date"], input[type="file"] {
        width: 100%;
        padding: 12px;
        margin: 5px 0 20px 0;
        border: 2px solid #295F98; 
        border-radius: 6px;
        box-sizing: border-box;
        transition: border-color 0.3s;
    }
    input[type="text"]:focus, input[type="email"]:focus, input[type="date"]:focus {
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
        text-align: left;
        margin-top: -15px;
        margin-bottom: 10px;
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

<script>
    // Store original form values to detect changes
    var originalValues = {};

    document.addEventListener("DOMContentLoaded", function () {
        // Store initial values in the originalValues object
        var formFields = ['firstName', 'lastName', 'mobileNo', 'emailId', 'dateOfBirth', 'username'];
        formFields.forEach(function (field) {
            var inputElement = document.getElementById(field);
            if (inputElement) {
                originalValues[field] = inputElement.value;
            }
        });

        // Real-time validation while typing
        document.getElementById("username").addEventListener("input", validateUsername);
    });

    function isFormChanged() {
        var formFields = ['firstName', 'lastName', 'mobileNo', 'emailId', 'dateOfBirth', 'username'];
        for (var i = 0; i < formFields.length; i++) {
            var field = formFields[i];
            var currentValue = document.getElementById(field).value;
            if (currentValue !== originalValues[field]) {
                return true;  // Form has changed
            }
        }
        var profileImageInput = document.getElementById("profileImage");
        if (profileImageInput.files.length > 0) {
            return true;  // File input has changed
        }
        return false;  // No changes made
    }

    function validateForm() {
        var isValid = true;

        // First Name Validation
        var firstName = document.getElementById("firstName").value;
        if (!/^[a-zA-Z]{3,20}$/.test(firstName)) {
            document.getElementById("firstNameError").textContent = "First Name must be 3-20 characters and alphabets only.";
            isValid = false;
        } else {
            document.getElementById("firstNameError").textContent = "";
        }

        // Last Name Validation
        var lastName = document.getElementById("lastName").value;
        if (!/^[a-zA-Z]{3,20}$/.test(lastName)) {
            document.getElementById("lastNameError").textContent = "Last Name must be 3-20 characters and alphabets only.";
            isValid = false;
        } else {
            document.getElementById("lastNameError").textContent = "";
        }

        // Mobile No Validation
        var mobileNo = document.getElementById("mobileNo").value;
        if (!/^\d{10}$/.test(mobileNo)) {
            document.getElementById("mobileNoError").textContent = "Mobile number must be exactly 10 digits.";
            isValid = false;
        } else {
            document.getElementById("mobileNoError").textContent = "";
        }

        // Email Validation
        var email = document.getElementById("emailId").value;
        if (!/^[a-zA-Z0-9._%+-]+@gmail\.com$/.test(email)) {
            document.getElementById("emailError").textContent = "Email must be a valid Gmail address.";
            isValid = false;
        } else {
            document.getElementById("emailError").textContent = "";
        }

        // Username Validation
        validateUsername();

        if (isValid) {
            if (isFormChanged()) {
                return confirm("Profile updated successfully. Click OK to view your profile.");
            } else {
                alert("No changes made to your profile.");
                return false;  // Prevent form submission as no changes were made
            }
        }

        return false;
    }

    function validateUsername() {
        const username = document.getElementById('username');
        if (username.value.length < 7 || username.value.length > 15 || !/^[A-Za-z0-9]+$/.test(username.value)) {
            document.getElementById('usernameError').textContent = 'Username must be 7-15 characters long and can contain only alphabets and numbers.';
        } else {
            document.getElementById('usernameError').textContent = '';
        }
    }
</script>
</head>
<body>
<div class="container">
<h2>Edit Profile</h2>
<form action="${pageContext.request.contextPath}/user/updateProfile" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" value="${user.firstName}" required />
    <div id="firstNameError" class="error-message"></div>

    <label for="dateOfBirth"></label>
    <input type="date" id="dateOfBirth" name="dateOfBirth" value="${user.dateOfBirth}" hidden />

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" value="${user.lastName}" required />
    <div id="lastNameError" class="error-message"></div>

    <label for="username">Username:</label>
    <input type="text" id="username" name="username" value="${user.username}" required />
    <div id="usernameError" class="error-message"></div>

    <label for="mobileNo">Mobile No:</label>
    <input type="text" id="mobileNo" name="mobileNo" value="${user.mobileNo}" required />
    <div id="mobileNoError" class="error-message"></div>

    <label for="emailId">Email:</label>
    <input type="email" id="emailId" name="emailId" value="${user.emailId}" required />
    <div id="emailError" class="error-message"></div>

    <label for="profileImage">Profile Image:</label>
    <input type="file" id="profileImage" name="profileImage" />

    <button type="submit">Update Profile</button>
</form>
</div>
</body>
</html>
