<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/superadmin_dashboard.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .sidebar {
            width: 200px;
            float: left;
            background-color: #333;
            padding: 15px;
        }
        .sidebar h2 {
            text-align: center;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            display: block;
            padding: 10px;
            background-color: #e4e4e4;
            border-radius: 5px;
        }
        .sidebar ul li a:hover {
            background-color: #ddd;
        }
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }
        .section {
            display: none;
        }
        .profile-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .profile-table th, .profile-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .profile-table th {
            background-color: #4CAF50;
            color: white;
            text-align: left;
        }
        .profile-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .profile-table tr:hover {
            background-color: #ddd;
        }
        .update-form {
            margin-top: 20px;
        }
        .update-form div {
            margin-bottom: 10px;
        }
        .update-form label {
            display: block;
            margin-bottom: 5px;
        }
        .update-form input[type="text"],
        .update-form input[type="email"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .update-form button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .update-form button:hover {
            background-color: #45a049;
        }
        .success-message {
            color: green;
            margin-top: 20px;
            display: none;
        }
    </style>
    <script>
        let originalValues = {};

        function storeOriginalValues() {
            originalValues = {
                firstName: document.getElementById('firstName').value,
                lastName: document.getElementById('lastName').value,
                emailId: document.getElementById('emailId').value,
                mobileNo: document.getElementById('mobileNo').value,
                username: document.getElementById('username').value
            };
        }

        function showSection(sectionId) {
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => {
                section.style.display = 'none';
            });
            document.getElementById(sectionId).style.display = 'block';
        }

        // Show the dashboard section by default
        document.addEventListener('DOMContentLoaded', () => {
            showSection('dashboard');
            storeOriginalValues();
        });

        function showSuccessMessage() {
            alert('Profile updated successfully!');
        }

        function showNoChangesMessage() {
            alert('No changes made.');
        }

        function validateForm() {
            const firstName = document.getElementById('firstName').value;
            const lastName = document.getElementById('lastName').value;
            const emailId = document.getElementById('emailId').value;
            const mobileNo = document.getElementById('mobileNo').value;
            const username = document.getElementById('username').value;

            const namePattern = /^[A-Za-z]{1,30}$/;
            const emailPattern = /^[^\s@]+@gmail\.com$/;
            const phonePattern = /^\d{10}$/;
            const usernamePattern = /^[A-Za-z0-9_]{1,20}$/;

            if (!namePattern.test(firstName)) {
                alert('First Name should be max 30 characters, no spaces, and only alphabets.');
                return false;
            }
            if (!namePattern.test(lastName)) {
                alert('Last Name should be max 30 characters, no spaces, and only alphabets.');
                return false;
            }
            if (!emailPattern.test(emailId)) {
                alert('Please enter a valid Gmail ID.');
                return false;
            }
            if (!phonePattern.test(mobileNo)) {
                alert('Mobile No should be exactly 10 digits.');
                return false;
            }
            if (!usernamePattern.test(username)) {
                alert('Username should be max 20 characters, and only allow underscore, numbers, and alphabets.');
                return false;
            }

            return true;
        }

        function updateProfileSection() {
            document.querySelector('.profile-table tr:nth-child(2) td:nth-child(2)').innerText = document.getElementById('firstName').value;
            document.querySelector('.profile-table tr:nth-child(3) td:nth-child(2)').innerText = document.getElementById('lastName').value;
            document.querySelector('.profile-table tr:nth-child(4) td:nth-child(2)').innerText = document.getElementById('emailId').value;
            document.querySelector('.profile-table tr:nth-child(5) td:nth-child(2)').innerText = document.getElementById('mobileNo').value;
            document.querySelector('.profile-table tr:nth-child(6) td:nth-child(2)').innerText = document.getElementById('username').value;
        }

        function submitForm(event) {
            event.preventDefault(); // Prevent the default form submission

            if (validateForm()) {
                const firstName = document.getElementById('firstName').value;
                const lastName = document.getElementById('lastName').value;
                const emailId = document.getElementById('emailId').value;
                const mobileNo = document.getElementById('mobileNo').value;
                const username = document.getElementById('username').value;

                if (
                    firstName === originalValues.firstName &&
                    lastName === originalValues.lastName &&
                    emailId === originalValues.emailId &&
                    mobileNo === originalValues.mobileNo &&
                    username === originalValues.username
                ) {
                    showNoChangesMessage();
                } else {
                    const form = event.target;
                    const formData = new FormData(form);

                    fetch(form.action, {
                        method: form.method,
                        body: formData
                    })
                    .then(response => response.text())
                    .then(data => {
                        showSuccessMessage();
                        updateProfileSection(); // Update the profile section with new values
                        storeOriginalValues(); // Update original values after successful submission
                    })
                    .catch(error => console.error('Error:', error));
                }
            }
        }
		
    </script>
</head>
<body>
    <div class="sidebar">
        <h2>Super Admin</h2>
        <ul>
            <li><a href="javascript:void(0);" onclick="showSection('viewprofile')">My Profile</a></li>
            <li><a href="javascript:void(0);" onclick="showSection('updateProfile')">Update Profile</a></li>
            <li><a href="javascript:void(0);" onclick="showSection('products')">View All Customers</a></li>
            <li><a href="javascript:void(0);" onclick="showSection('customers')">View All Subadmins</a></li>
			<li><a href="/logout">Log out</a></li>

        </ul>
    </div>

    <div class="main-content">
        <div id="dashboard" class="section">
            <h1>Welcome to the Super Admin Dashboard</h1>
        </div>

        <div id="viewprofile" class="section">
            <h1>My Profile</h1>
            <table class="profile-table">
				<tr>
				        <th>ID</th>
				        <td>${superAdmin.id}</td>
				         </tr>
                <tr>
                    <th>First Name</th>
                    <td>${superAdmin.firstName}</td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td>${superAdmin.lastName}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${superAdmin.emailId}</td>
                </tr>
                <tr>
                    <th>Mobile No</th>
                    <td>${superAdmin.mobileNo}</td>
                </tr>
                <tr>
                    <th>Username</th>
                    <td>${superAdmin.username}</td>
                </tr>
            </table>
        </div>

        <div id="updateProfile" class="section">
            <h1>Update Profile</h1>
			            <form action="${pageContext.request.contextPath}/updateProfile" method="post" class="update-form" onsubmit="submitForm(event);">
			                <input type="hidden" name="id" value="${superAdmin.id}"/> <!-- Hidden field for ID -->
			                
			                <div>
			                    <label for="firstName">First Name:</label>
			                    <input type="text" id="firstName" name="firstName" value="${superAdmin.firstName}" required>
			                </div>
			                
			                <div>
			                    <label for="lastName">Last Name:</label>
			                    <input type="text" id="lastName" name="lastName" value="${superAdmin.lastName}" required>
			                </div>

			                <div>
			                    <label for="emailId">Email:</label>
			                    <input type="email" id="emailId" name="emailId" value="${superAdmin.emailId}" required>
			                </div>

			                <div>
			                    <label for="mobileNo">Mobile No:</label>
			                    <input type="text" id="mobileNo" name="mobileNo" value="${superAdmin.mobileNo}" required>
			                </div>

			                <div>
			                    <label for="username">Username:</label>
			                    <input type="text" id="username" name="username" value="${superAdmin.username}" required>
			                </div>

			                <button type="submit">Update Profile</button>
			            </form>

			            <div id="successMessage" class="success-message">
			                Details updated successfully!
			            </div>
			        </div>

			        <!-- Other sections like products, customers, settings, etc. -->
			    </div>
			</body>
			</html>
