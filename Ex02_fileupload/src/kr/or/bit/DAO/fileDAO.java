package kr.or.bit.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class fileDAO {
	private Connection conn;
	
	public fileDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
			String dtID = "system";
			String dbpwd = "1004";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dtID, dbpwd);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(String filename , String filerealName) {
		String sql = "insert into files values(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, filename);
			pstmt.setString(2, filerealName);
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		return -1;
		
	}
	
}
