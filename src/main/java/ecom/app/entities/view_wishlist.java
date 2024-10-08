package ecom.app.entities;


import java.util.Arrays;

public class view_wishlist {
    private String productName;
    private String description;
    private int price;
    private byte[] productImage;
	public view_wishlist() {
		super();
		
	}
	public view_wishlist(String productName, String description, int price, byte[] productImage) {
		super();
		this.productName = productName;
		this.description = description;
		this.price = price;
		this.productImage = productImage;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public byte[] getProductImage() {
		return productImage;
	}
	public void setProductImage(byte[] productImage) {
		this.productImage = productImage;
	}
	@Override
	public String toString() {
		return "Wishlist [productName=" + productName + ", description=" + description + ", price=" + price
				+ ", productImage=" + Arrays.toString(productImage) + "]";
	}
	
    
    
    
    
}
