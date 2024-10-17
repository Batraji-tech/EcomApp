<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.List" %>
<%@ page import="ecom.app.entities.User" %>
<html>
<head>
    <title>All Customers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F2EED7; 
            margin: 0;
            padding: 20px;
            position: relative; /* Allow absolute positioning of child elements */
        }

        h2 {
            text-align: center;
            color: #FF9874; 
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            background-color: #fff;
        }

        th {
            background-color: #295F98; 
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            display: block;
            width: 200px;
            margin: 20px auto;
            text-align: center;
            padding: 10px;
            background-color: #295F98; 
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #1a3a6e; 
        }

        .no-customers {
            text-align: center;
            color: #555;
            font-size: 1.2em;
        }
        
        /* Search Bar Styles */
        .search-container {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .search-bar {
            padding: 10px;
            width: 390px; /* Adjust as needed */
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        
        .back-button {
            position: absolute; /* Position it absolutely */
            top: 20px; /* Adjust top position */
            right: 20px; /* Adjust right position */
            padding: 10px; /* Add padding */
            background-color: #295F98; 
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        
        .back-button:hover {
            background-color: #1a3a6e; 
        }
    </style>
</head>
<body>
    <h2>Customer List</h2>

    <div class="search-container">
        <input type="text" id="search" class="search-bar" placeholder="Search by Name or Email..." />
    </div>

    <a class="back-button" href="/superadmin">Back to Dashboard</a>

    <%
        List<User> customers = (List<User>) request.getAttribute("customers");
        if (customers != null && !customers.isEmpty()) {
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile No</th>
                    <th>Date of Birth</th>
                    <th>Username</th>
                </tr>
            </thead>
            <tbody id="customer-table-body">
                <% for (User customer : customers) { %>
                    <tr class="customer-row" 
                        data-first-name="<%= customer.getFirstName().toLowerCase() %>"
                        data-last-name="<%= customer.getLastName().toLowerCase() %>"
                        data-email="<%= customer.getEmailId().toLowerCase() %>">
                        <td><%= customer.getUserId() %></td>
                        <td><%= customer.getFirstName() %></td>
                        <td><%= customer.getLastName() %></td>
                        <td><%= customer.getEmailId() %></td>
                        <td><%= customer.getMobileNo() %></td>
                        <td><%= customer.getDateOfBirth() != null ? customer.getDateOfBirth().toString() : "N/A" %></td>
                        <td><%= customer.getUsername() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p class="no-customers">No customers found.</p>
    <% } %>

    <script>
        document.getElementById('search').addEventListener('input', function() {
            const searchValue = this.value.toLowerCase();
            const rows = document.querySelectorAll('.customer-row');

            rows.forEach(row => {
                const firstName = row.dataset.firstName;
                const lastName = row.dataset.lastName;
                const email = row.dataset.email;

                // Check if any of the fields include the search value
                const matches = firstName.includes(searchValue) || lastName.includes(searchValue) || email.includes(searchValue);
                
                row.style.display = matches ? '' : 'none';
            });
        });
    </script>
</body>
</html>
