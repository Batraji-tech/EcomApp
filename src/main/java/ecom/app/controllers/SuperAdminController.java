package ecom.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ecom.app.dao.SuperAdminDaoImpl;
import ecom.app.entities.SuperAdmin;
import ecom.app.entities.User;
import ecom.app.utilities.Password;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import ecom.app.dao.SuperAdminDaoImpl;

@Controller
@RequestMapping("/")
public class SuperAdminController {

	@Autowired
	SuperAdminDaoImpl superAdminImpl;
	
	 @GetMapping("/viewprofile")
	    public String viewProfile(Model model, HttpSession session) {
	        // Get the logged-in Super Admin from the session
	        SuperAdmin superAdmin = (SuperAdmin) session.getAttribute("loggedInSuperAdmin");

	        // Add the SuperAdmin details to the model
	        model.addAttribute("superAdmin", superAdmin);

	        // Return the dashboard JSP with the View Profile section
	        return "superadmin_dashboard";
	    }
	 
	 @GetMapping("/logout")
	    public String logout() {
	       
	        return "login_superadmin";
	    }
		
	 @PostMapping("/updateProfile")
	 public String updateProfile(@RequestParam int id, 
	                              @RequestParam String firstName, 
	                              @RequestParam String lastName, 
	                              @RequestParam String emailId, 
	                              @RequestParam String mobileNo, 
	                              @RequestParam String username, 
	                              Model model) {
	     // Call your DAO method to update the SuperAdmin
	     SuperAdmin superAdmin = new SuperAdmin();
	     superAdmin.setId(id);
	     superAdmin.setFirstName(firstName);
	     superAdmin.setLastName(lastName);
	     superAdmin.setEmailId(emailId);
	     superAdmin.setMobileNo(mobileNo);
	     superAdmin.setUsername(username);
	     
	     superAdminImpl.updateSuperAdmin(superAdmin); // This method needs to be implemented

	     // Optional: Fetch updated data and add to model
	     model.addAttribute("superAdmin", superAdmin);
	     
	     // Redirect to the dashboard or display a success message
	     return "superadmin_dashboard"; // Adjust this as per your routing
	 }

	
	@PostMapping("/login")
	public String login(
	        @RequestParam String username, 
	        @RequestParam String password, Model model) {
	    
	    System.out.println("\n login request data: " + username + ", " + password);
	    
	    
		// Fetch user details from the database
	    SuperAdmin superAdmin = superAdminImpl.findByUsername(username);
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
	            return "superadmin_dashboard";
	        }
	    }
	    
	    
	    model.addAttribute("error", "Invalid username or password");
	    return "login_superadmin";
	  }
	
	
	
	
}