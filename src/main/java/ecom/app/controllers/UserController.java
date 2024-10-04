package ecom.app.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
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

import ecom.app.dao.UserDaoImpl;
import ecom.app.entities.User;
import ecom.app.utility.Password;
import jakarta.servlet.http.HttpSession;
import ecom.app.entities.Role;

@Controller
@RequestMapping("/user")
public class UserController {

	private User user;

	@Autowired
	UserDaoImpl userDaoImpl;

	@GetMapping("/login")
	public String Login() {
		return "user_login";
	}
	
	
	@GetMapping("/openRegistrationPage")
	public ModelAndView openRegistrationPage(ModelAndView modelAndView) {


		List<Role> listOfRoles = userDaoImpl.fetchAllRoles();
		
		System.out.println(listOfRoles );

		modelAndView.addObject("listOfRoles", listOfRoles);
		modelAndView.setViewName("user_registration");

		System.out.println("User is regitered");
		return modelAndView;
	}
	
	
	
	@PostMapping("/login")
	public String login(@RequestParam String username, 
	                    @RequestParam String password, 
	                    @RequestParam String role,
	                    Model model, 
	                    RedirectAttributes attributes) {

	    try {
	        user = userDaoImpl.fetchUser(username);
	        String pwdSalt = user.getPasswordSalt();
	        String oldPwdHash = user.getPasswordHash();
	        String newPassword = password + pwdSalt;
	        String newPasswordHash = Password.generatePwdHash(newPassword);

	        if (newPasswordHash.equals(oldPwdHash)) {
	            model.addAttribute("user", user);
	            int roleId = user.getRole().getRoleId();
	            attributes.addFlashAttribute("user", user); // Pass the user object

	            
	            if (role.equalsIgnoreCase("Retailer")) {
	                if (roleId == 2) {
	                    return "subadmin"; 
	                } else {
	                    attributes.addFlashAttribute("message", "No Retailer found with this username");
	                }
	            } else if (role.equalsIgnoreCase("Customer")) {
	                if (roleId == 3) {
	                    return "redirect:/homepageuser"; // Redirect to customer page
	                } else {
	                    attributes.addFlashAttribute("message", "No Customer found with this username");
	                }
	            }
	        } else {
	            attributes.addFlashAttribute("message", "Incorrect Password");
	        }
	    } catch (EmptyResultDataAccessException e) {
	        attributes.addFlashAttribute("message", "Incorrect Username");
	    }

	    return "redirect:/user/login"; // Redirect back to login on failure
	}


	
	
	@PostMapping("/register")
	public String register(@ModelAttribute User user, RedirectAttributes attributes , HttpSession session )
			throws IOException, SerialException, SQLException {

		String roleName =userDaoImpl.getRoleName(2);
		
		System.out.println("\n user : " + user);
		System.out.println("\n role : " + roleName);

		// Password Encryption starts
		String passwordSalt = Password.generatePwdSalt(10);
		user.setPasswordSalt(passwordSalt);

		// temporary data => password+salt
		String newPassword = user.getPassword() + passwordSalt; // 1234rdvyjtftyf

		String passwordHash = Password.generatePwdHash(newPassword);
		user.setPasswordHash(passwordHash);
		// Password Encryption completes

		int result =  userDaoImpl.insertUser(user);

		if (result > 0) {
			attributes.addFlashAttribute("message", "Registration Successful");
			return "redirect:/user/login";
		} else {
			attributes.addFlashAttribute("message", "Registration Failed");

			return "redirect:/user/openRegistrationPage";
		}
	}
	
	
	
	@GetMapping("/profile")
	public ModelAndView viewProfile(ModelAndView mView, @RequestParam String username) throws IOException, SQLException {
	    User user = userDaoImpl.fetchUser(username);

	    byte[] imageBytes = user.getProfileImage().getBytes();
	    String base64Image = Base64.getEncoder().encodeToString(imageBytes);

	    mView.setViewName("profile");
	    mView.addObject("user", user);
	    mView.addObject("profileImage", base64Image); // Now it's Base64 encoded
	    
	    return mView;
	}

	
}