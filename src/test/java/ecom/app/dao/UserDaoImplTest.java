package ecom.app.dao;

import ecom.app.entities.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
@AutoConfigureTestDatabase
@Transactional 
public class UserDaoImplTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired 
    private UserDaoImpl userDaoImpl;

    @BeforeEach
    public void setup() {
        setupTestUser();
    }

    private void setupTestUser() {
        String sql = "INSERT INTO user (first_name, last_name, email_id, mobile_no, date_of_birth, username, passwordSalt, passwordHash, role_id, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, "Test1", "User1", "test@example.com", "6787654567", "2000-01-21", "testuser", "salt", "hashedPassword", 1, "ACTIVE");
    }

    @Test
    public void testFetchUser_Success() {
        // When
        User user = userDaoImpl.fetchUser("testuser");

        // Then
        assertEquals("testuser", user.getUsername());
        assertEquals("ACTIVE", user.getStatus());
    }
}
