package ecom.app.dao;


import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.annotation.Rollback;
import org.springframework.web.multipart.MultipartFile;

import ecom.app.entities.User;
import ecom.app.entities.Role;

@SpringBootTest
public class UserDaoImplTest {

    @Autowired
    private UserDaoImpl userDaoImpl;

    private User dummyUser;

    @BeforeEach
    public void setUp() {
        dummyUser = new User();
        dummyUser.setFirstName("John");
        dummyUser.setLastName("Doe");
        dummyUser.setEmailId("short.email@example.com"); // Ensure this is <= 30 characters
        dummyUser.setMobileNo("7568476456");
        dummyUser.setUsername("john.jje.");
        dummyUser.setPasswordSalt("randomSalt");
        dummyUser.setPasswordHash("hashedPassword");
        dummyUser.setRole(new Role(1, "User"));
        dummyUser.setStatus("ACTIVE");
        dummyUser.setDateOfBirth(Date.valueOf("2000-01-01"));

        // Create a mock MultipartFile
        MultipartFile profileImage = new MockMultipartFile("profileImage", "test.png", "image/png", "dummy data".getBytes());
        dummyUser.setProfileImage(profileImage); // Ensure profileImage is set
    }


    
    
    @Test
    public void testFetchAllRoles() {
        List<Role> roles = userDaoImpl.fetchAllRoles();
        Assertions.assertFalse(roles.isEmpty(), "Roles list should not be empty.");
    }
    
    @Test
    @Rollback
    public void testInsertUser() throws IOException, SerialException, SQLException {
        // Use a unique email for testing
        dummyUser.setEmailId("unique.email@example.com");
        
        int result = userDaoImpl.insertUser(dummyUser);
        Assertions.assertTrue(result > 0, "User should be inserted successfully.");
        
        // Fetch the user to ensure the ID is set
        User insertedUser = userDaoImpl.fetchUser(dummyUser.getUsername());
        Assertions.assertNotNull(insertedUser.getUserId(), "User ID should be set after insertion.");
    }
//
//    @Test
//    @Rollback
//    public void testFindAllCustomers() {
//        dummyUser.setRole(new Role(3, "Customer")); // Set role as Customer
//        userDaoImpl.insertUser(dummyUser);
//        List<User> customers = userDaoImpl.findAllCustomers();
//        Assertions.assertFalse(customers.isEmpty(), "Customer list should not be empty.");
//    }

    @Test
    @Rollback
    public void testUpdateUserStatus() throws IOException, SerialException, SQLException {
        int result = userDaoImpl.insertUser(dummyUser);
        Assertions.assertTrue(result > 0);
        User insertedUser = userDaoImpl.fetchUser(dummyUser.getUsername()); // Get the inserted user
        userDaoImpl.updateUserStatus(insertedUser.getUserId(), "INACTIVE");
        User updatedUser = userDaoImpl.getUserById(insertedUser.getUserId());
        Assertions.assertEquals("INACTIVE", updatedUser.getStatus(), "User status should be updated.");
    }

}