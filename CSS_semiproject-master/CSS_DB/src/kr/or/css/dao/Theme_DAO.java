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

import kr.or.css.dto.Region_DTO;
import kr.or.css.dto.Theme_DTO;

public class Theme_DAO {
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
	
	public List<Theme_DTO> selectAllTheme(){
		
List<Theme_DTO> themelist = null;	
		
		try {
			conn = ds.getConnection();
			String sql = " select * from theme where THEMENUM!=0";		
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			

			// 객체 형태로 DB가지고 데이터
			themelist = new ArrayList<Theme_DTO>();
			while (rs.next()) {
				int themenum = rs.getInt("THEMENUM");
				String themename = rs.getString("THEMENAME");


				Theme_DTO regiondto = new Theme_DTO(themenum,themename);
				themelist.add(regiondto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return themelist;
	}
	
	public Theme_DTO selectTheme(int themenum) {
		Theme_DTO theme = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from theme where THEMENUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, themenum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				theme = new Theme_DTO(rs.getInt("THEMENUM"), rs.getString("THEMENAME"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return theme;
	}
}
