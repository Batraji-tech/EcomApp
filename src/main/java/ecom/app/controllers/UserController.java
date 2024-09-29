package ecom.app.controllers;

import java.io.IOException;
import java.sql.SQLException;
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

		modelAndView.addObject("listOfRoles", listOfRoles);
		modelAndView.setViewName("user_registration");

		System.out.println("User is regitered");
		return modelAndView;
	}
	
	
	
	@PostMapping("/login")
	public String login(@RequestParam String username, 
			@RequestParam String password,  
			Model model, RedirectAttributes attributes) {


		try {
			user = userDaoImpl.fetchUser(username);

			String pwdSalt = user.getPasswordSalt();
			String oldPwdHash = user.getPasswordHash();

			String newPassword = password + pwdSalt;
			String newPasswordHash = Password.generatePwdHash(newPassword);

			if (newPasswordHash.equals(oldPwdHash)) {

				model.addAttribute("user", user);

				int roleId = user.getRole().getRoleId();
				if (roleId == 1) {
					return "super_admin_dash";
				} else if (roleId == 2 ) {
					return "subadmin";
				} else if (roleId == 3) {
					return "customer";
				}
				
			} else {
				attributes.addFlashAttribute("message", "Incorrect Password");
			}
		} catch (EmptyResultDataAccessException e) {
			attributes.addFlashAttribute("message", "Incorrect Username");
		}

		return "redirect:/user/login";
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute User user, RedirectAttributes attributes)
			throws IOException, SerialException, SQLException {



		System.out.println("\n user : " + user);

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
	
	
	//profile mapped
	@GetMapping("/profile")
	public ModelAndView viewProfile(ModelAndView mView, @RequestParam String username) {
	    User user = userDaoImpl.fetchUser(username);
	   
	    mView.setViewName("profile");
	    mView.addObject("user", user);
	    return mView;
	}

	
	
	
	
	
	
}
