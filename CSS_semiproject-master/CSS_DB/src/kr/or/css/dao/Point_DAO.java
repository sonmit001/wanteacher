package kr.or.css.dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.css.dto.Point_DTO;

public class Point_DAO {

	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	static {
		InitialContext ctx;
		try {
			ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}

	public ArrayList<Integer> selectAllPoint(String userid) {

		ArrayList<Integer> pointlist = new ArrayList<Integer>();

		try {
			conn = ds.getConnection();
			String sql = "select CONTENTNUM from POINT where id= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pointlist.add(rs.getInt("contentnum"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return pointlist;

	}

	public int deletePoint(String userid, String contentnum) {
		
		int result = 0;
		try {
			conn = ds.getConnection();
			String sql = "delete from point where id=? and contentnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, contentnum);
			result = pstmt.executeUpdate();
			
			if(result == 0) {
				System.out.println("삭제가 실행되지 않았음");
			}else {
				System.out.println("삭제가 정상 실행 되었음");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public int deletePoint(int contentnum) {
		
		int result = 0;
		try {
			conn = ds.getConnection();
			String sql = "delete from point where contentnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			result = pstmt.executeUpdate();
			
			if(result == 0) {
				System.out.println("삭제가 실행되지 않았음");
			}else {
				System.out.println("삭제가 정상 실행 되었음");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public int deletePoint(String id) {
		
		int result = 0;
		try {
			conn = ds.getConnection();
			String sql = "delete from point where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			
			if(result == 0) {
				System.out.println("삭제가 실행되지 않았음");
			}else {
				System.out.println("삭제가 정상 실행 되었음");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	public int insertPoint(Point_DTO point) {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into point values(?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, point.getId());
			pstmt.setInt(2, point.getContentnum());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		
		
		return result;
	}
	
	public Point_DTO selectPoint(int contentnum, String userid) {
		Point_DTO point = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from point where contentnum=? and id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			pstmt.setString(2, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				point = new Point_DTO(rs.getString("id"), rs.getInt("contentnum"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return point;
	}
}
