package ecom.app.dao;

import ecom.app.entities.SuperAdmin;

public interface SuperAdminDao {
    SuperAdmin findByUsername(String username);
    public void updateSuperAdmin(SuperAdmin superAdmin);
    // Add other methods as needed, e.g., save, update, delete
}
