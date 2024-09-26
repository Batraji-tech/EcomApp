package ecom.app.entities;

import java.sql.Date;

public class Feedback {

	private int feedbackId;
	private int customerId;
	private int subAdminId;
	private int productId;
	private int rating;
	private String review;
	private Date submissionDate;
	
	public Feedback(int feedbackId, int customerId, int subAdminId, int productId, int rating, String review,
			Date submissionDate) {
		super();
		this.feedbackId = feedbackId;
		this.customerId = customerId;
		this.subAdminId = subAdminId;
		this.productId = productId;
		this.rating = rating;
		this.review = review;
		this.submissionDate = submissionDate;
	}

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getSubAdminId() {
		return subAdminId;
	}

	public void setSubAdminId(int subAdminId) {
		this.subAdminId = subAdminId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getSubmissionDate() {
		return submissionDate;
	}

	public void setSubmissionDate(Date submissionDate) {
		this.submissionDate = submissionDate;
	}

	@Override
	public String toString() {
		return "Feedback [feedbackId=" + feedbackId + ", customerId=" + customerId + ", subAdminId=" + subAdminId
				+ ", productId=" + productId + ", rating=" + rating + ", review=" + review + ", submissionDate="
				+ submissionDate + "]";
	}
	
	
}
