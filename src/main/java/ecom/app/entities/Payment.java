package ecom.app.entities;
 
public class Payment {
  
    private String transactionId;
    private String paymentMethod;
    private String bankName;
    private String cardNumber;
    private String expiryDate;
    private String cardHolderName;
    private String upiId;
    private String walletName;
    private double amount;
    private String status;
 
    public Payment() {}
 
    public Payment(String transactionId, String paymentMethod, String bankName, String cardNumber,
                   String expiryDate, String cardHolderName, String upiId, String walletName,
                   double amount, String status) {
        this.transactionId = transactionId;
        this.paymentMethod = paymentMethod;
        this.bankName = bankName;
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.cardHolderName = cardHolderName;
        this.upiId = upiId;
        this.walletName = walletName;
        this.amount = amount;
        this.status = status;
    }
 
    public String getTransactionId() {
        return transactionId;
    }
 
    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }
 
    public String getPaymentMethod() {
        return paymentMethod;
    }
 
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
 
    public String getBankName() {
        return bankName;
    }
 
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
 
    public String getCardNumber() {
        return cardNumber;
    }
 
    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }
 
    public String getExpiryDate() {
        return expiryDate;
    }
 
    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }
 
    public String getCardHolderName() {
        return cardHolderName;
    }
 
    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }
 
    public String getUpiId() {
        return upiId;
    }
 
    public void setUpiId(String upiId) {
        this.upiId = upiId;
    }
 
    public double getAmount() {
        return amount;
    }
 
    public void setAmount(double amount) {
        this.amount = amount;
    }
 
    public String getStatus() {
        return status;
    }
 
    public void setStatus(String status) {
        this.status = status;
    }
 
    public String getWalletName() {
        return walletName;
    }
 
    public void setWalletName(String walletName) {
        this.walletName = walletName;
    }
}