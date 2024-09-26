package ecom.app.entities;

public class SuperAdmin {

	private int superAdminId;

	
	public SuperAdmin(int superAdminId) {
		super();
		this.superAdminId = superAdminId;
	}

	public int getSuperAdminId() {
		return superAdminId;
	}

	public void setSuperAdminId(int superAdminId) {
		this.superAdminId = superAdminId;
	}

	@Override
	public String toString() {
		return "SuperAdmin [superAdminId=" + superAdminId + "]";
	}
	
	
}
