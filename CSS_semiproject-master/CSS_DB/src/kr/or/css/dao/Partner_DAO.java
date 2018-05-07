package kr.or.css.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.css.dto.Content_DTO;
import kr.or.css.dto.Partner_DTO;
import kr.or.css.dto.Point_DTO;

public class Partner_DAO {
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
			System.out.println("DataSource 객체 생성 성공 !");
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
	}
	
	public List<Partner_DTO> selectAllPartner(String userid){//아이디에 해당하는 파트너 신청 목록
		
		List<Partner_DTO> partnerlist = null;	
		try {
			
			System.out.println("selectAllPartner : "+userid);
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from PARTNER where ID='" + userid + "'";
			rs = stmt.executeQuery(sql);
			System.out.println(rs);
			partnerlist = new ArrayList<Partner_DTO>();
						while (rs.next()) {
							String id = rs.getString("ID");
							String candidate = rs.getString("CANDIDATE");
							System.out.println("id : "+id);
							System.out.println("CANDIDATE : "+candidate);

							Partner_DTO partner = new Partner_DTO(id,candidate);
							partnerlist.add(partner);
						}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return partnerlist;
	
	}
	public int deletePartner(Partner_DTO partner) {


		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "delete from partner where candidate = ? and id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, partner.getCandidate());
			pstmt.setString(2, partner.getId());
			
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return row;
	}
	
	public int deletePartner(String id) {


		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "delete from partner where id = ? or CANDIDATE = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	public int insertPartner(Partner_DTO partner) {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into partner values(?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, partner.getCandidate());
			pstmt.setString(2, partner.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		
		
		return result;
		
		
		
		
	}
	public boolean ispartnersend(Partner_DTO partner) {
		
		boolean ch=true;//파트너 초대 보낸게 없음
		try {
			
			
			
			
			
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from PARTNER where CANDIDATE='" + partner.getId() + "' and ID='"+partner.getCandidate()+"'";
			System.out.println("ispartnersend두번째");
			rs = stmt.executeQuery(sql);
			System.out.println(rs);
			
			
			
			
			System.out.println("확인중");
						while (rs.next()) {
							System.out.println("ispartnersend : 이미 있음");
							ch=false; //있음
						}

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		
		return ch;
	}
}
