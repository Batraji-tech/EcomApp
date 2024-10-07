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
                              RedirectAttributes attributes) {
        try {
            if (!file.isEmpty()) {
                category.setCategory_image(file);
            }
            categoryDao.insertCategory(category);
            attributes.addFlashAttribute("message", "Category added successfully!");
        } catch (IOException | SQLException e) {
            attributes.addFlashAttribute("error", "Error adding Category: " + e.getMessage());
        }
        return "superadmin_dashboard"; // Adjust this to your actual view
    }
    
    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        return "superadmin_dashboard"; 
    }
    
    
}
