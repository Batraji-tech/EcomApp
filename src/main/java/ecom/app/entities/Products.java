package ecom.app.entities;

import org.springframework.web.multipart.MultipartFile;

public class Products {

	private int productId;
	private String name;
	private String description;
	private double price;
	private int quantityInStock;
    private int categoryId;
    private MultipartFile productImage;
    
	public Products(int productId, String name, String description, double price, int quantityInStock, int categoryId,
			MultipartFile productImage) {
		super();
		this.productId = productId;
		this.name = name;
		this.description = description;
		this.price = price;
		this.quantityInStock = quantityInStock;
		this.categoryId = categoryId;
		this.productImage = productImage;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantityInStock() {
		return quantityInStock;
	}
	public void setQuantityInStock(int quantityInStock) {
		this.quantityInStock = quantityInStock;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public MultipartFile getProductImage() {
		return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	@Override
	public String toString() {
		return "Products [productId=" + productId + ", name=" + name + ", description=" + description + ", price="
				+ price + ", quantityInStock=" + quantityInStock + ", categoryId=" + categoryId + ", productImage="
				+ productImage + "]";
	}
    
    
}
