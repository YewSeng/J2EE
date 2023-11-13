package com.Caltech.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import org.mindrot.jbcrypt.BCrypt;
import com.Caltech.dbUtil.DbUtil;
import com.Caltech.pojo.SuperAdmin;

public class SuperAdminDao {
	public int insertAdmin(String superAdminUsername, String superAdminPassword) {
        String sql = "INSERT INTO SUPERADMIN(superAdminUsername, superAdminPassword) VALUES (?, ?)";
        int result = 0;
        try (Connection con = DbUtil.getDbConnection();
             PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, superAdminUsername);
            String hashedPassword = BCrypt.hashpw(superAdminPassword, BCrypt.gensalt(12));
            ps.setString(2, hashedPassword);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
	
	public boolean verifySuperAdmin(String superAdminUsername, String superAdminPassword) {
	    String sql = "SELECT superAdminPassword FROM SUPERADMIN WHERE superAdminUsername = ?";
	    boolean validSuperAdmin = false;
	    
	    try (Connection con = DbUtil.getDbConnection();
	    		PreparedStatement ps = con.prepareStatement(sql);) {
	        ps.setString(1, superAdminUsername);

	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                // Retrieve the hashed password from the database
	                String hashedPasswordFromDb = rs.getString("superAdminPassword");

	                // Compare the provided password with the hashed password from the database
	                validSuperAdmin = BCrypt.checkpw(superAdminPassword, hashedPasswordFromDb);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return validSuperAdmin;
	}
	
}
