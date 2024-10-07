package ecom.app.entities;
 
import java.util.Arrays;
 
public class CartItems {
	
	private int productId;
	private String productName;
    private String description;
    private byte[] productImage;
    private double price;
    private int quantity;
	
    public CartItems() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
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

	public byte[] getProductImage() {
		return productImage;
	}

	public void setProductImage(byte[] productImage) {
		this.productImage = productImage;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartItems [productId=" + productId + ", productName=" + productName + ", description=" + description
				+ ", productImage=" + Arrays.toString(productImage) + ", price=" + price + ", quantity=" + quantity
				+ "]";
	}
	
   
	
	
}