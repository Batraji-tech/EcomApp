package ecom.app.entities;

public class Carts {

	private int cartId;
	private int customerId;
	
	public Carts(int cartId, int customerId) {
		super();
		this.cartId = cartId;
		this.customerId = customerId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	@Override
	public String toString() {
		return "Carts [cartId=" + cartId + ", customerId=" + customerId + "]";
	}
    
	
}
