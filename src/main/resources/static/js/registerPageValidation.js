function validateRegisterForm() {
    const firstName = document.getElementById("firstname").value;
    const lastName = document.getElementById("lastname").value;
    const mobileNo = document.getElementById("mobileNo").value;
    const emailId = document.getElementById("email").value;
    const dateOfBirth = document.getElementById("dob").value;
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const profileImage = document.querySelector('input[name="profileImage"]').files[0];
    const roleSelected = document.querySelector('input[name="roleId"]:checked');

    let isValid = true;
    let errors = [];

    // First Name validation
    const nameRegex = /^[A-Za-z]+$/; // Only letters allowed
    if (firstName.trim().length < 3 || !nameRegex.test(firstName)) {
        errors.push("First name must contain only letters and at least three letters.");
        isValid = false;
    }

    // Last Name validation
    if (lastName.trim().length < 3 || !nameRegex.test(lastName)) {
        errors.push("Last name must contain only letters and at least three letters.");
        isValid = false;
    }

    // Mobile Number validation
    const mobileRegex = /^\d{10}$/;
    if (!mobileRegex.test(mobileNo)) {
        errors.push("Mobile number must be exactly 10 digits.");
        isValid = false;
    }

    // Email validation
    const emailRegex = /^(?=.*[a-zA-Z])([a-zA-Z0-9._%+-]+)@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailRegex.test(emailId)) {
        errors.push("Please enter a valid email address. It must contain at least one letter in the local part.");
        isValid = false;
    }

    // Date of Birth validation (must be at least 10 years old)
    if (!dateOfBirth) {
        errors.push("Date of birth is required.");
        isValid = false;
    } else {
        const today = new Date();
        const dob = new Date(dateOfBirth);

        // Check for valid date
        if (isNaN(dob.getTime())) {
            errors.push("Please enter a valid date of birth.");
            isValid = false;
        } else if (dob > today) {
            errors.push("Date of birth cannot be in the future.");
            isValid = false;
        } else {
            const age = today.getFullYear() - dob.getFullYear();
            const monthDiff = today.getMonth() - dob.getMonth();
            const dayDiff = today.getDate() - dob.getDate();

            // Check for minimum age of 10 years
            if (age < 10 || (age === 10 && (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)))) {
                errors.push("You must be at least 10 years old to register.");
                isValid = false;
            }

            // Check if the year is not more than 100 years ago
            const hundredYearsAgo = new Date();
            hundredYearsAgo.setFullYear(today.getFullYear() - 100);
            if (dob < hundredYearsAgo) {
                errors.push("Date of birth cannot be more than 100 years ago.");
                isValid = false;
            }
        }
    }

    // Username validation
    const usernameRegex = /^[a-zA-Z0-9]+$/; 
    if (username.trim() === "" || username.length < 5 || !usernameRegex.test(username)) {
        errors.push("Username must be at least 5 characters long and can contain letters and numbers.");
        isValid = false;
    } else if (/^[0-9]+$/.test(username)) {
        errors.push("Username cannot be only numbers.");
        isValid = false;
    } else if (!/[a-zA-Z]/.test(username)) {
        errors.push("Username must contain at least one letter.");
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
    if (!profileImage) {
        errors.push("Profile image is required.");
        isValid = false;
    } else {
        const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
        if (!allowedExtensions.exec(profileImage.name)) {
            errors.push("Profile image must be in .jpg, .jpeg, or .png format.");
            isValid = false;
        }
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
