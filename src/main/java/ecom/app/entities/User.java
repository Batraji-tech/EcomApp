package ecom.app.entities;

public class User {
	
	private int userId;
	private String firstName;
	private String lastName;
	private String emailId;
	private String mobileNo;
	private String username;
	private String password;
	private String passwordSalt;
	private String passwordHash;
	
	public User(int userId, String firstName, String lastName, String emailId, String mobileNo, String username,
			String password, String passwordSalt, String passwordHash) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailId = emailId;
		this.mobileNo = mobileNo;
		this.username = username;
		this.password = password;
		this.passwordSalt = passwordSalt;
		this.passwordHash = passwordHash;
	}

	public User(String firstName, String lastName, String emailId, String mobileNo, String username, String password,
			String passwordSalt, String passwordHash) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailId = emailId;
		this.mobileNo = mobileNo;
		this.username = username;
		this.password = password;
		this.passwordSalt = passwordSalt;
		this.passwordHash = passwordHash;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordSalt() {
		return passwordSalt;
	}

	public void setPasswordSalt(String passwordSalt) {
		this.passwordSalt = passwordSalt;
	}

	public String getPasswordHash() {
		return passwordHash;
	}

	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", emailId=" + emailId
				+ ", mobileNo=" + mobileNo + ", username=" + username + ", password=" + password + ", passwordSalt="
				+ passwordSalt + ", passwordHash=" + passwordHash + "]";
	}
	
	

}
