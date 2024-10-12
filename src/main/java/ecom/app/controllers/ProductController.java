package ecom.app.controllers;

import ecom.app.entities.Products;
import java.util.Comparator;

import ecom.app.entities.User;
import ecom.app.utility.ByteArrayMultipartFile;
import ecom.app.entities.User;
import ecom.app.utility.ByteArrayMultipartFile;
import ecom.app.utility.Password;
import jakarta.servlet.http.HttpSession;
import ecom.app.dao.ProductDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

@Controller
@RequestMapping("/products")
public class ProductController {

	@Autowired
	private ProductDaoImpl productDaoImpl;
	public List<Products> products;
	private Products product;

	@PostMapping("/add")
	public String addProduct(@ModelAttribute Products product, @RequestParam("product_image") MultipartFile file,
			RedirectAttributes attributes) {
		try {
			if (!file.isEmpty()) {
				product.setProduct_image(
						new ByteArrayMultipartFile(file.getBytes(), file.getOriginalFilename(), file.getContentType()));
			}
			productDaoImpl.insertProduct(product);
			attributes.addFlashAttribute("message", "Product added successfully!");
		} catch (IOException | SQLException e) {
			attributes.addFlashAttribute("error", "Error adding product: " + e.getMessage());
		}
		return "redirect:/subadmin"; // Adjust this to your actual view
	}

	@GetMapping("/view_product")
	public String viewProducts(Model model) {
		List<Products> listOfProducts = fetchAllProducts();

		System.out.println("Fetched Products: " + listOfProducts);
		model.addAttribute("products", listOfProducts);
		return "view_product"; // Ensure this matches your JSP filename
	}

	@GetMapping("/view_productbycategoryname")
	public String viewProductsByCategory(Model model, @RequestParam(required = false) String category_id) {
		List<Products> listOfProducts = null;

		if (category_id == null)
			listOfProducts = fetchAllProducts();
		else
			listOfProducts = fetchProductsByCategory(Integer.parseInt(category_id));

		System.out.println("Fetched Products: " + listOfProducts);
		model.addAttribute("products", listOfProducts);
		return "view_productbycategoryname"; // Ensure this matches your JSP filename
	}

	private List<Products> fetchAllProducts() {
		List<Products> listOfProducts = null;
		try {
			listOfProducts = productDaoImpl.fetchAllProducts();
			System.out.println(listOfProducts); // Log for debugging
		} catch (IOException | SQLException e) {
			e.printStackTrace();
		}
		return listOfProducts;
	}

	private List<Products> fetchProductsByCategory(int category_id) {

		List<Products> listOfProducts = null;
		try {
			listOfProducts = productDaoImpl.fetchProductsByCategory(category_id);
			System.out.println(listOfProducts); // Log for debugging
		} catch (IOException | SQLException e) {
			e.printStackTrace();
		}
		return listOfProducts;
	}

	@GetMapping("/remove_product/{id}")
	public String removeProduct(@PathVariable("id") int id, RedirectAttributes attributes) {
		try {
			System.out.println("Attempting to delete product with ID: " + id);

			productDaoImpl.deleteProduct(id);
			attributes.addFlashAttribute("message", "Product removed successfully!");
		} catch (Exception e) {
			attributes.addFlashAttribute("error", "Error removing product: " + e.getMessage());
		}
		return "redirect:/products/remove_product"; // Redirect back to the list after removal
	}

	@GetMapping("/remove_product")
	public String removeProducts(Model model) {
		List<Products> listOfProducts = fetchAllProducts();

		model.addAttribute("products", listOfProducts);
		return "remove_product"; // Ensure this matches your JSP filename
	}

	@GetMapping("/view_product_update_table")
	public String viewProductsUpdate(Model model, HttpSession session) {
		List<Products> listOfProducts = fetchAllProducts();

		model.addAttribute("products", listOfProducts);
		session.setAttribute("products", listOfProducts);
		return "update_table"; // Ensure this matches your JSP filename
	}

	@GetMapping("/edit_product/{id}")
	public String editProduct(@PathVariable("id") int id, Model model) throws IOException {
		try {
			Products product = productDaoImpl.fetchProductById(id); // Fetch the product by ID
			model.addAttribute("product", product);
			return "update_product"; // Ensure this matches your JSP filename
		} catch (SQLException e) {
			e.printStackTrace();
			return "redirect:/update_table"; // Redirect to view product on error
		}
	}

	@PostMapping("/product_updation")
	public String updateProduct(@ModelAttribute Products updatedProduct, RedirectAttributes attributes,
			HttpSession session) throws SerialException, IOException, SQLException {

		// Retrieve the existing product from the database
		Products currentProduct = productDaoImpl.fetchProductById(updatedProduct.getProduct_id());

		if (currentProduct == null) {
			attributes.addFlashAttribute("error", "Product not found.");
			return "redirect:/products/update_table";
		}

		// Use the current product's image if none is provided in the updated product
		if (updatedProduct.getProduct_image() == null || updatedProduct.getProduct_image().isEmpty()) {
			updatedProduct.setProduct_image(currentProduct.getProduct_image());
		}

		try {
			productDaoImpl.updateProduct(updatedProduct);
			attributes.addFlashAttribute("message", "Product updated successfully");
		} catch (Exception e) {
			attributes.addFlashAttribute("message", "Updation failed. Please try again later");
		}
		System.out.println("Fetched Products: " + currentProduct);

		return "redirect:/products/view_product_update_table";
	}

	@GetMapping("/add1")
	public String products() {
		return "products";
	}

	@GetMapping("/display1")
	public String listProducts(Model model) {
		List<Products> productList = productDaoImpl.getAllProducts();
		model.addAttribute("products", productList);
		return "display_products"; // JSP page
	}

	@GetMapping
	public String getProducts(@RequestParam(value = "sort", required = false) String sort, Model model) {
		List<Products> products = productDaoImpl.getAllProducts();

		// Sorting logic
		if ("priceAsc".equals(sort)) {
			products.sort(Comparator.comparing(Products::getFinal_price));
		} else if ("priceDesc".equals(sort)) {
			products.sort(Comparator.comparing(Products::getFinal_price).reversed());
		}
		model.addAttribute("products", products);
		return "display_products"; // Return the JSP page
	}

	@GetMapping("/{id}")
	public String viewProductDetails(@PathVariable("id") int productId, Model model) throws IOException, SQLException {
		Products product = productDaoImpl.fetchProductById(productId);
		model.addAttribute("product", product);
		return "product_details"; // JSP page
	}

	/*
	 * @GetMapping("/{productName}") public String
	 * viewProductDetails(@PathVariable("productName") String productName, Model
	 * model) { Products product = productDaoImpl.getProductByName(productName); //
	 * Fetch product by ID if (product != null) { model.addAttribute("product",
	 * product); return "product_details"; // This is the JSP page for displaying
	 * product details } else { return "redirect:/product"; // Redirect if the
	 * product is not found } }
	 */

}