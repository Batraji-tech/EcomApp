package ecom.app.controllers;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecom.app.dao.CategoryDao;
import ecom.app.entities.Category;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryDao categoryDao;

    @GetMapping("/add")
    public String showAddCategoryForm() {
        return "addCategory"; // This should return your JSP file name
    }

    @PostMapping("/add")
    public String addCategory(@ModelAttribute Category category, 
                              @RequestParam("category_image") MultipartFile file,
                              RedirectAttributes attributes, 
                              HttpSession session) { // Inject HttpSession
        try {
            if (!file.isEmpty()) {
                category.setCategory_image(file);
            }
            // Insert category and get the generated ID
            int generatedCategoryId = categoryDao.insertCategory(category);
            
            // Store the category ID in the session
            session.setAttribute("categoryId", generatedCategoryId);
            
            attributes.addFlashAttribute("message", "Category added successfully!");
        } catch (IOException | SQLException e) {
            attributes.addFlashAttribute("error", "Error adding Category: " + e.getMessage());
        }
        return "redirect:/category/dashboard"; // Redirect to the dashboard after adding
    }
    
    @GetMapping("/dashboard")
    public String showDashboard(Model model, HttpSession session) {
        // You can access the categoryId from the session here if needed
        Integer categoryId = (Integer) session.getAttribute("categoryId");
        session.setAttribute("categoryId", categoryId); // Add it to the model if needed
        
        return "superadmin_dashboard"; 
    }
}
