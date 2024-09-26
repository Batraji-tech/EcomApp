package ecom.app.entities;

public class CartItems {

	private int cartItemId;
	private int cartId;
	private int productId;
	private int quantity;
	
	public CartItems(int cartItemId, int cartId, int productId, int quantity) {
		super();
		this.cartItemId = cartItemId;
		this.cartId = cartId;
		this.productId = productId;
		this.quantity = quantity;
	}
	
	

	public int getCartItemId() {
		return cartItemId;
	}



	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}



	public int getCartId() {
		return cartId;
	}



	public void setCardtId(int cartId) {
		this.cartId = cartId;
	}



	public int getProductId() {
		return productId;
	}



	public void setProductId(int productId) {
		this.productId = productId;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	@Override
	public String toString() {
		return "CartItems [cartItemId=" + cartItemId + ", cartId=" + cartId + ", productId=" + productId
				+ ", quantity=" + quantity + "]";
	}
	
	
	
}
