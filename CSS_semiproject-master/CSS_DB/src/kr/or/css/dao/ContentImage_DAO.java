package kr.or.css.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.css.dto.ContentImage_DTO;

public class ContentImage_DAO {
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
	
	public ArrayList<String> selectAllContentImage(int contentnum){
			//이미지 system에 저장되는 실제 이름들을 가져온다.
			ArrayList<String> namelist = null ;
		
		try {
			conn = ds.getConnection();
			String sql = "select image from image where contentnum in(?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,contentnum);
			
			rs = pstmt.executeQuery();
				namelist = new ArrayList<>();
			while(rs.next()) {
				String name = rs.getString("image");
				namelist.add(name);
			}
			
		}catch (Exception e) {
			e.getStackTrace();
		}finally {
			try {
				if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
				if(conn != null)try {conn.close();} catch (SQLException e) {}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return namelist;
	}
	
	public int insertContentImage(ContentImage_DTO contentimage) {
		int row=0;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into image(image, contentnum, topimage ) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, contentimage.getImage());
			pstmt.setInt(2, contentimage.getContentnum());
			pstmt.setInt(3, contentimage.getTopimage());

			row = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
				if(conn != null)try {conn.close();} catch (SQLException e) {}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return row;
		
	}
	
	public int deleteContentImage(int contentnum, String deleteimgname) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from image where contentnum = ? and image = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			pstmt.setString(2, deleteimgname);
			
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return row;
	}
	
	public int deleteContentImage(int contentnum) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from image where contentnum = ?";
			
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
}
