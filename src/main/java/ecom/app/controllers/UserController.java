package ecom.app.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ecom.app.dao.SuperAdminDaoImpl;
import ecom.app.entities.User;
import ecom.app.utilities.Password;
import ecom.app.entities.Role;

@Controller
@RequestMapping("/user")
public class UserController {

	private User user;

	@Autowired
	SuperAdminDaoImpl userDaoImpl;

	@GetMapping("/login")
	public String Login() {
		return "user_login";
	}
	
	@GetMapping("/openRegistrationPage")
	public String openRegistrationPage() {
		return "user_registration";
	}
	
	
	
	
//	@GetMapping("/openRegistrationPage")
//	public ModelAndView openRegistrationPage(ModelAndView modelAndView) {
//
//
////		List<Role> listOfRoles = userDaoImpl.fetchAllRoles();
////
////		modelAndView.addObject("listOfRoles", listOfRoles);
//		modelAndView.setViewName("user_registration");
//
//		return modelAndView;
//	}
//	
	
	
	
	
	
	
}
