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
import ecom.app.entities.Role;
import ecom.app.entities.SuperAdmin;
import ecom.app.entities.User;
import ecom.app.utility.Password;

@Controller
@RequestMapping("/superAdmin")
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
    
    
    @GetMapping("/login")
    public String Login()
    {
    	return "login_superadmin";
    }

    
    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        List<User> userList = userDaoImpl.findAllUsers();
        List<Role> rolesList = userDaoImpl.fetchAllRoles();
        model.addAttribute("userList", userList);
        model.addAttribute("rolesList", rolesList);
        return "superadmin_dashboard";
    }
    


//    
//    @GetMapping("/viewSubadminRequests")
//    public String viewPendingSubadminRequests(Model model) {
//        System.out.println("Entering viewPendingSubadminRequests method"); // Debug log
//        List<User> pendingUsers = userDaoImpl.getPendingSubadminRequests();
//        model.addAttribute("userList", pendingUsers);
//       System.out.println("Pending user check:" + pendingUsers);
//        return "view_subadmin_requests";
//    }

    @GetMapping("/viewSubadminRequests")
    public String viewPendingSubadminRequests(Model model) {
        List<User> pendingUsers = userDaoImpl.getPendingSubadminRequests(); // Use your method to get pending users
        List<Role> rolesList = userDaoImpl.fetchAllRoles(); // Fetch roles if needed
        model.addAttribute("userList", pendingUsers);
        model.addAttribute("rolesList", rolesList);
        System.out.println("pending users :" + pendingUsers);
        return "view_subadmin_requests"; // Return the correct view name
    }

    @PostMapping("/approveUser")
    public String approveUser(@RequestParam int userId) {
        userDaoImpl.updateUserStatus(userId, "ACTIVE"); // Change status to ACTIVE
        return "redirect:/superAdmin/viewSubadminRequests"; // Redirect back to the requests view
    }


@PostMapping("/deleteUser")
public String deleteUser(@RequestParam int userId) {
    userDaoImpl.updateUserStatus(userId, "INACTIVE");
    return "redirect:/superAdmin/viewSubadminRequests";
}


    
    
    
    @GetMapping("/viewProfile")
    public ModelAndView viewProfile(ModelAndView mView) {
        mView.setViewName("superadmin_profile");
        mView.addObject("superAdmin", superAdmin);
        return mView;
    }
    
    //

    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute SuperAdmin updateSuperAdmin, RedirectAttributes redirectAttributes) {
        List<String> errors = new ArrayList<>();
       // superAdmin = superAdminDaoImpl.findByUsername(username);
        
        

        // Validate first name
        if ( updateSuperAdmin.getFirstName() == null || ! updateSuperAdmin.getFirstName().matches("[a-zA-Z]{3,20}")) {
            errors.add("First name must be between 3-20 characters and contain only alphabets.");
        }

        // Validate last name
        if ( updateSuperAdmin.getLastName() == null || !updateSuperAdmin.getLastName().matches("[a-zA-Z]{3,20}")) {
            errors.add("Last name must be between 3-20 characters and contain only alphabets.");
        }

        // Validate email
        if ( updateSuperAdmin.getEmailId() == null || ! updateSuperAdmin.getEmailId().matches("^[a-zA-Z0-9._%+-]+@gmail\\.com$")) {
            errors.add("Email must be in the format of example@gmail.com.");
        }

        // Validate phone number
        if ( updateSuperAdmin.getMobileNo() == null || ! updateSuperAdmin.getMobileNo().matches("\\d{10}")) {
            errors.add("Phone number must be 10 digits.");
        }

        // Validate username
        if ( updateSuperAdmin.getUsername() == null || ! updateSuperAdmin.getUsername().matches("^[a-zA-Z0-9]{7,15}$")) {
            errors.add("Username must be between 7-15 characters and contain only alphabets and numbers.");
        }
       

        if (!errors.isEmpty()) {
        	
        	 
            redirectAttributes.addFlashAttribute("errors", errors);
            return "redirect:/superAdmin/viewProfile";
        }
        
      //Save updated super admin information (you may need to implement this)
        superAdmin =  superAdminDaoImpl.updateSuperAdminProfile(updateSuperAdmin);
        

         redirectAttributes.addFlashAttribute("message", "Profile updated successfully!");
         return "redirect:/superAdmin/viewProfile";
        
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
    	        return "redirect:/superAdmin/resetPassword";
    	    }
    	if (!isValidUsername(username)) {
            redirectAttributes.addFlashAttribute("error", "Invalid username. Username must match an existing one.");
            return "redirect:/superAdmin/resetPassword";
        }

        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("error", "Passwords do not match.");
            return "redirect:/superAdmin/resetPassword";
        }

        if (!isValidPassword(newPassword)) {
            redirectAttributes.addFlashAttribute("error", "Invalid password. It should be 8-15 characters long without spaces.");
            return "redirect:/superAdmin/resetPassword";
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
	    return "forgot_password"; // JSP page for entering email
	}

	@PostMapping("/verify_email")
	public String verifyEmail(@RequestParam("email") String email, Model model) {
	    SuperAdmin superAdmin = superAdminDaoImpl.findByEmail(email);
	    if (superAdmin != null) {
	        model.addAttribute("email", email); // Pass email to next page
	        return "reset1_password"; // Redirect to the reset password page
	    } else {
	        model.addAttribute("error", "Email not found. Please try again.");
	        return "forgot_password"; // Stay on the same page with error message
	    }
	}
	
	@PostMapping("/resetpassword")
	public String resetpassword(
	        @RequestParam("newPassword") String newPassword,
	        @RequestParam("confirmPassword") String confirmPassword,
	        @RequestParam("email") String email,
	        Model model) {

	    if (!newPassword.equals(confirmPassword)) {
	        model.addAttribute("error1", "Passwords do not match.");
	        model.addAttribute("email", email); // Keep email in case of error
	        return "reset1_password"; // Return to reset password page with error
	    }

	    if (!isValidPassword(newPassword)) {
	        model.addAttribute("error1", "Invalid password. It should be 8-15 characters long without spaces.");
	        model.addAttribute("email", email); // Keep email in case of error
	        return "reset1_password"; // Return to reset password page with error
	    }

	    // Proceed with password reset if no errors
	    String passwordSalt = Password.generatePwdSalt(10);
	    String passwordHash1 = newPassword + passwordSalt;
	    String passwordHash = Password.generatePwdHash(passwordHash1);

	    int result = superAdminDaoImpl.resetSuperAdminPassword(passwordHash, passwordSalt);
	    if (result > 0) {
	        model.addAttribute("message", "New password set successfully.");
	        return "login_superadmin"; // Redirect to login page after success
	    } else {
	        model.addAttribute("error1", "Error updating password. Please try again.");
	        model.addAttribute("email", email); // Keep email in case of error
	        return "reset1_password"; // Return to reset password page with error
	    }
	}

	    

    
}
