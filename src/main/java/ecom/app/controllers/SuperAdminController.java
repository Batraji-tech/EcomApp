package ecom.app.controllers;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecom.app.dao.SuperAdminDaoImpl;
import ecom.app.dao.UserDaoImpl;
import ecom.app.entities.SuperAdmin;
import ecom.app.entities.User;
import ecom.app.utility.Password;

@Controller
@RequestMapping("/superadmin")
public class SuperAdminController {

    @Autowired
    SuperAdminDaoImpl superAdminDaoImpl;
    SuperAdmin superAdmin;
    
    @Autowired
	UserDaoImpl userDaoImpl;

    @PostMapping("/login")
    public String login(
            @RequestParam String username, 
            @RequestParam String password, Model model) {
        System.out.println("\n login request data: " + username + ", " + password);

        // Fetch user details from the database
        superAdmin = superAdminDaoImpl.findByUsername(username);
        System.out.println(superAdmin);

        if (superAdmin != null) {
            String pwdSalt = superAdmin.getPasswordSalt();
            String oldPwdHash = superAdmin.getPasswordHash();
            
            // Check credentials
            String newPassword = password + pwdSalt;
            String newPasswordHash = Password.generatePwdHash(newPassword);
            System.out.println("pwd Salt : " + pwdSalt);
            System.out.println("Old password : " + oldPwdHash);
            System.out.println("New password: " + newPasswordHash);

            if (newPasswordHash.equals(oldPwdHash)) {
                model.addAttribute("superAdmin", superAdmin);
                return "superadmin_dashboard"; // Redirect to the super admin dashboard on success
            } else {
                model.addAttribute("error", "Incorrect password. Please try again."); // Password mismatch
            }
        } else {
            model.addAttribute("error", "Username does not exist. Please check your username."); // Username not found
        }

        return "login_superadmin"; // Redirect back to login page with error message
    }


    @GetMapping("/viewProfile")
    public ModelAndView viewProfile(ModelAndView mView) {
        mView.setViewName("superadmin_profile");
        mView.addObject("superAdmin", superAdmin);
        return mView;
    }
    
    //

    @PostMapping("/updateProfile")
    public ModelAndView updateProfile(@ModelAttribute("superAdmin") SuperAdmin superAdmin, RedirectAttributes redirectAttributes) {
        List<String> errors = new ArrayList<>();
       // superAdmin = superAdminDaoImpl.findByUsername(username);

        // Validate first name
        if (superAdmin.getFirstName() == null || !superAdmin.getFirstName().matches("[a-zA-Z]{3,20}")) {
            errors.add("First name must be between 3-20 characters and contain only alphabets.");
        }

        // Validate last name
        if (superAdmin.getLastName() == null || !superAdmin.getLastName().matches("[a-zA-Z]{3,20}")) {
            errors.add("Last name must be between 3-20 characters and contain only alphabets.");
        }

        // Validate email
        if (superAdmin.getEmailId() == null || !superAdmin.getEmailId().matches("^[a-zA-Z0-9._%+-]+@gmail\\.com$")) {
            errors.add("Email must be in the format of example@gmail.com.");
        }

        // Validate phone number
        if (superAdmin.getMobileNo() == null || !superAdmin.getMobileNo().matches("\\d{10}")) {
            errors.add("Phone number must be 10 digits.");
        }

        // Validate username
        if (superAdmin.getUsername() == null || !superAdmin.getUsername().matches("^[a-zA-Z0-9]{7,15}$")) {
            errors.add("Username must be between 7-15 characters and contain only alphabets and numbers.");
        }

        if (!errors.isEmpty()) {
        	
        	 
            redirectAttributes.addFlashAttribute("errors", errors);
            return new ModelAndView("redirect:/superadmin/viewProfile");
        }
       
         //Save updated super admin information (you may need to implement this)
         superAdminDaoImpl.updateSuperAdminProfile(superAdmin);

         redirectAttributes.addFlashAttribute("message", "Profile updated successfully!");
         return new ModelAndView("redirect:/superadmin/viewProfile");
    }



    @PostMapping("/logout")
	public String logout() {
		
		return "login_superadmin" ;
	}

    
    @GetMapping("/resetPassword")
    public String showResetPasswordForm(Model model) {
        return "reset_superadmin_password"; 
    }

    @PostMapping("/resetPassword")
    public String resetPassword(@RequestParam("username") String username,
                                @RequestParam("newPassword") String newPassword,
                                @RequestParam("confirmPassword") String confirmPassword,
                                RedirectAttributes redirectAttributes) {
    	
    	  superAdmin = superAdminDaoImpl.findByUsername(username);
    	    if (superAdmin == null) {
    	        redirectAttributes.addFlashAttribute("error", "Username does not exist.");
    	        return "redirect:/superadmin/resetPassword";
    	    }
    	if (!isValidUsername(username)) {
            redirectAttributes.addFlashAttribute("error", "Invalid username. Username must match an existing one.");
            return "redirect:/superadmin/resetPassword";
        }

        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("error", "Passwords do not match.");
            return "redirect:/superadmin/resetPassword";
        }

        if (!isValidPassword(newPassword)) {
            redirectAttributes.addFlashAttribute("error", "Invalid password. It should be 8-15 characters long without spaces.");
            return "redirect:/superadmin/resetPassword";
        }

        String passwordSalt = Password.generatePwdSalt(10);
        String passwordHash1 = newPassword + passwordSalt;

        String passwordHash = Password.generatePwdHash(passwordHash1);
       
        int result = superAdminDaoImpl.resetSuperAdminPassword(username,passwordHash,passwordSalt);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("message", "New password set successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Username does not exist.");
        }
        
        return "superadmin_dashboard";
    }

    private boolean isValidUsername(String username) {
    	superAdmin = superAdminDaoImpl.findByUsername(username);
        return username != null && !username.trim().isEmpty() && superAdmin.getUsername().equals(username);
    }

    private boolean isValidPassword(String password) {
        return password != null && password.length() >= 8 && password.length() <= 15 && !password.contains(" ");
    }
    
    @GetMapping("/viewAllCustomers")
    public String viewAllCustomers(Model model) {
        List<User> customers =userDaoImpl.findAllCustomers();
        System.out.println(customers);
        model.addAttribute("customers", customers);
        return "view_all_customers";
    }

    // View All Sub Admins
    @GetMapping("/viewAllSubAdmins")
    public String viewAllSubAdmins(Model model) {
        List<User> subAdmins = userDaoImpl.findAllSubAdmins();
        model.addAttribute("subadmins", subAdmins);
        return "view_all_subadmins";
    }
    
   
	
	
	//profile mapped
	@GetMapping("/profile")
	public ModelAndView viewProfile(ModelAndView mView, @RequestParam String username) {
	    User user = userDaoImpl.fetchUser(username);
	   
	    mView.setViewName("profile");
	    mView.addObject("user", user);
	    return mView;
	}


	    // Handle the entire forgot password flow
	 @GetMapping("/forgotpassword")
	    public String showForgotPasswordPage() {
	        return "forgot_password"; // JSP page for forgot password
	    }

	    // Step 2: Verify email
	    @PostMapping("/verify_email")
	    public String verifyEmail(@RequestParam("email") String email, Model model) {
	        SuperAdmin superAdmin = superAdminDaoImpl.findByEmail(email);
	        if (superAdmin != null) {
	            model.addAttribute("emailVerified", true);
	            model.addAttribute("email", email); // Keep email for password reset
	            return "forgot_password"; // Redirect back to forgot password page with email verified
	        } else {
	            model.addAttribute("error", "Email not found. Please try again.");
	            return "forgot_password"; // Stay on the same page to retry
	        }
	    }
	    @PostMapping("/resetpassword")
	    public String resetpassword(
	            @RequestParam("newPassword") String newPassword,
	            @RequestParam("confirmPassword") String confirmPassword,
	        
	            Model model) {

	        if (!newPassword.equals(confirmPassword)) {
	            model.addAttribute("error", "Passwords do not match.");
	            return "forgot_password"; // Return to the reset password page
	        }

	        if (!isValidPassword(newPassword)) {
	            model.addAttribute("error", "Invalid password. It should be 8-15 characters long without spaces.");
	            return "forgot_password"; // Return to the reset password page
	        }

	        // Proceed with password reset if no errors
	        String passwordSalt = Password.generatePwdSalt(10);
	        String passwordHash1 = newPassword + passwordSalt;
	        String passwordHash = Password.generatePwdHash(passwordHash1);

	        int result = superAdminDaoImpl.resetSuperAdminPassword(passwordHash, passwordSalt);
	        if (result > 0) {
	            model.addAttribute("message", "New password set successfully.");
	        } else {
	            model.addAttribute("error", "Error updating password. Please try again.");
	        }

	        return "login_superadmin"; // Redirect to login page
	    }

	    

    
}
