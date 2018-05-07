package kr.or.css.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.css.dto.Good_DTO;

public class Good_DAO{

	// DB연결 ...
	// method 공통 사용 ....
	// 초기자 { } static 초기자 : static{ }
	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	static {
		InitialContext ctx;
		try {
			/*
			 * Context context = new InitialContext(); DataSource datasource =
			 * (DataSource)context.lookup("java:comp/env/jdbc/oracle"); conn =
			 * datasource.getConnection();
			 */
			ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("/jdbc/oracle");
			System.out.println("DataSource 객체 생성 성공 !");
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}
	
	public int totalGoodCount(int contentnum) {
		int totalCount = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "select count(*) cnt from good where contentnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return totalCount;
	}
	
	public Good_DTO selectGood(int contentnum, String id) {
		Good_DTO good = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from good where id = ? and contentnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, contentnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				good = new Good_DTO(rs.getInt("contentnum"), rs.getString("id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return good;
	}
	
	public int insertGood(int contentnum, String id) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into good values(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			pstmt.setString(2, id);
			
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return row;
	}
	
	public int deleteGood(int contentnum, String id) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from good where contentnum = ? and id =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			pstmt.setString(2, id);
			
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return row;
	}
	
	public int deleteGood(int contentnum) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from good where contentnum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return row;
	}
	
	public int deleteGood(String id) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from good where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return row;
	}
}
