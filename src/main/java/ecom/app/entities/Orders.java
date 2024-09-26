package ecom.app.entities;

import java.sql.Date;

public class Orders {

    private int orderId;
    private int customerId;
    private Date orderDate;
    private String orderStatus;
    private double totalPrice;
    
	public Orders(int orderId, int customerId, Date orderDate, String orderStatus, double totalPrice) {
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.totalPrice = totalPrice;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", customerId=" + customerId + ", orderDate=" + orderDate
				+ ", orderStatus=" + orderStatus + ", totalPrice=" + totalPrice + "]";
	}
    
    
    

}
