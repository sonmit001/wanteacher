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

public class Region_DAO {
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
	
	public List<Region_DTO> selectAllRegion(){
		List<Region_DTO> regionlist = null;	
		
		try {
			conn = ds.getConnection();
			String sql = " select * from region where REGIONNUM!=0";		
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			

			// 객체 형태로 DB가지고 데이터
			regionlist = new ArrayList<Region_DTO>();
			while (rs.next()) {
				int regionnum = rs.getInt("REGIONNUM");
				String regionname = rs.getString("REGIONNAME");


				Region_DTO regiondto = new Region_DTO(regionnum,regionname);
				regionlist.add(regiondto);
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
		return regionlist;
	}
	
	public Region_DTO selectRegion(int regionnum) {
		Region_DTO region = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from region where REGIONNUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, regionnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				region = new Region_DTO(rs.getInt("REGIONNUM"), rs.getString("REGIONNAME"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return region;
	}
}
