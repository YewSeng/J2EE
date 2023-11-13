package com.Caltech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import com.Caltech.dbUtil.DbUtil;
import com.Caltech.pojo.Contact;

public class ContactDao {

	public int insertEnquiries(Contact contact) {
        String sql = "INSERT INTO Contact(name, email, enquiries) VALUES (?, ?, ?)";
        int result = 0;
        try (Connection con = DbUtil.getDbConnection();
             PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getEnquiries());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
