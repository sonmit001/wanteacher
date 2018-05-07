package kr.or.css.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.css.dto.ContentReview_DTO;
import kr.or.css.dto.Review_DTO;

public class Review_DAO {
	static DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	static {
		InitialContext ctx;
		try {
			ctx = new InitialContext();
			Context envCtx = (Context) ctx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("/jdbc/oracle");
			System.out.println("DataSource 객체 생성 성공 !");
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}
	
	public List<Review_DTO> selectAllReview(int contentnum){
		return null;
	}
	
	public List<ContentReview_DTO> selectAllReview(int contentnum, int cpage, int pagesize) {
		List<ContentReview_DTO> list = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select nickname, reviewcontent from (select ROWNUM rn, nickname, reviewcontent from (select m.nickname, r.reviewcontent from review r join members m on r.id = m.id where contentnum=? order by r.reviewnum)) where rn between ? and ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			pstmt.setInt(2, cpage);
			pstmt.setInt(3, pagesize);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<ContentReview_DTO>();
			while(rs.next()) {
				ContentReview_DTO review = new ContentReview_DTO(rs.getString("nickname"), rs.getString("reviewcontent"));
				list.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		return list;
	}
	
	public int deleteReview(int contentnum) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from review where contentnum = ?";
			
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
	
	public int deleteReview(String id) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from review where id = ?";
			
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
	
	public int insertReview(int contentnum, String id, String reviewcontent) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into review values(?, ?, ?, review_row.nextval)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			pstmt.setString(2, id);
			pstmt.setString(3, reviewcontent);
			
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return row;
	}
	
	public int updateReview(Review_DTO review) {
		return 0;
	}
	
	public Review_DTO selectReview(int contentnum, String id) {
		Review_DTO review = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select contentnum, id, reviewcontent from review where contentnum = ? and id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			pstmt.setString(2, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				review = new Review_DTO(rs.getInt("contentnum"), rs.getString("id"), rs.getString("reviewcontent"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return review;
	}
}
