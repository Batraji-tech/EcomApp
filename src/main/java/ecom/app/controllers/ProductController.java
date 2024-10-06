package ecom.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ecom.app.dao.ProductDao;
import ecom.app.entities.Product;

import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductDao productDao;

    @GetMapping("/display")
    public String listProducts(Model model) {
        List<Product> productList = productDao.getAllProducts();
        model.addAttribute("products", productList);
        return "product_list"; // JSP page
    }

    @GetMapping("/{id}")
    public String viewProductDetails(@PathVariable("id") int productId, Model model) {
        Product product = productDao.getProductById(productId);
        model.addAttribute("product", product);
        return "product_details"; // JSP page
    }
}
