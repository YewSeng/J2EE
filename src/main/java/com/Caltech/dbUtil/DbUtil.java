package com.Caltech.dbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {

	public static Connection getDbConnection() {
		Connection con = null;
		try {
			//register vendor driver
			Class.forName(DbUtilHelperConstant.DRIVER_CLASS);
			//establish the communication with the db
			con = DriverManager.getConnection(DbUtilHelperConstant.URL, DbUtilHelperConstant.USERNAME, DbUtilHelperConstant.PASSWORD);			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
