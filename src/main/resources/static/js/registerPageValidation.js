function validateRegisterForm() {
    const firstName = document.getElementById("firstname").value;
    const lastName = document.getElementById("lastname").value;
    const mobileNo = document.getElementById("mobileNo").value;
    const emailId = document.getElementById("email").value;
    const dateOfBirth = document.getElementById("dob").value;
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const profileImage = document.querySelector('input[name="profileImage"]').files[0];
    const roleSelected = document.querySelector('input[name="role.roleId"]:checked');

    let isValid = true;

    // Error placeholders
    let errors = [];

    // First Name validation
    const nameRegex = /^[A-Za-z\s]+$/; // Allow only letters and spaces
    if (firstName.trim() === "" || firstName.length < 3 || !nameRegex.test(firstName)) {
        errors.push("First name is required and should contain at least 3 letters.");
        isValid = false;
    }

    // Last Name validation
    if (lastName.trim() === "" || lastName.length < 3 || !nameRegex.test(lastName)) {
        errors.push("Last name is required and should contain at least 3 letters.");
        isValid = false;
    }

    // Mobile Number validation
    const mobileRegex = /^\d{10}$/;
    if (!mobileRegex.test(mobileNo)) {
        errors.push("Please Enter the valid mobile no.");
        isValid = false;
    }

    // Email validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(emailId)) {
        errors.push("Please enter a valid email address.");
        isValid = false;
    }

    // Date of Birth validation (must be 18+)
    if (dateOfBirth) {
        const today = new Date();
        const dob = new Date(dateOfBirth);
        const age = today.getFullYear() - dob.getFullYear();
        const monthDiff = today.getMonth() - dob.getMonth();
        const dayDiff = today.getDate() - dob.getDate();

        if (age < 10 || (age === 10 && (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)))) {
            errors.push("You must be at least 10 years old to register here.");
            isValid = false;
        }
    } else {
        errors.push("Date of birth is required.");
        isValid = false;
    }

    // Username validation
    const usernameRegex = /^[a-zA-Z0-9]+$/; // Allow letters and numbers only
    if (username.trim() === "" || username.length < 5 || !usernameRegex.test(username) || /^[0-9]+$/.test(username)) {
        errors.push("Username is required, must be at least 5 characters long, and cannot be only numbers.");
        isValid = false;
    }

    // Password validation
    const passwordMinLength = 8;
    const capitalLetterRegex = /[A-Z]/;
    const lowercaseLetterRegex = /[a-z]/;
    const specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;

    if (password.length < passwordMinLength) {
        errors.push("Password must be at least 8 characters long.");
        isValid = false;
    }
    if (!capitalLetterRegex.test(password)) {
        errors.push("Password must contain at least one uppercase letter.");
        isValid = false;
    }
    if (!lowercaseLetterRegex.test(password)) {
        errors.push("Password must contain at least one lowercase letter.");
        isValid = false;
    }
    if (!specialCharRegex.test(password)) {
        errors.push("Password must contain at least one special character.");
        isValid = false;
    }

    // Profile Image validation
    if (profileImage) {
        const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
        if (!allowedExtensions.exec(profileImage.name)) {
            errors.push("Profile image must be in .jpg, .jpeg, or .png format.");
            isValid = false;
        }
    } else {
        errors.push("Profile image is required.");
        isValid = false;
    }

    // Role selection validation
    if (!roleSelected) {
        errors.push("Please select a role.");
        isValid = false;
    }

    // Display errors
    if (errors.length > 0) {
        alert(errors.join("\n"));
    }

    // Prevent default action on Enter key
    document.addEventListener('keydown', function(event) {
        if (event.key === "Enter" && !isValid) {
            event.preventDefault();
        }
    });

    return isValid;
}