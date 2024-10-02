
package ecom.app.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialException;

import ecom.app.entities.Role;
import ecom.app.entities.User;

public interface UserDao {
	
	int insertUser(User user) throws IOException, SerialException, SQLException;
	
	List<Role> fetchAllRoles();


	User fetchUser(String username);
		
	
	List<User> findAllCustomers();
    List<User> findAllSubAdmins();
	
}
