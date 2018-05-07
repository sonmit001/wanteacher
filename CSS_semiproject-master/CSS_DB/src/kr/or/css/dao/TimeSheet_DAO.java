package kr.or.css.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.css.dto.Content_DTO;
import kr.or.css.dto.TimeSheetAndContent_DTO;
import kr.or.css.dto.TimeSheet_DTO;

public class TimeSheet_DAO {
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
		} catch (NamingException e) {
			System.out.println("lookup Fail : " + e.getMessage());
		}
		
	}
	
	public ArrayList<TimeSheetAndContent_DTO> selectAllTimeSheet(String userid, String day){
		
		ArrayList<TimeSheetAndContent_DTO> dtolist = new ArrayList<TimeSheetAndContent_DTO>();
		TimeSheetAndContent_DTO dto = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from TIMESHEET where id= ? AND DAY= ? order by HOUR ASC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, day);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new TimeSheetAndContent_DTO();
				dto.setHour(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setDay(rs.getString(3));
				dto.setContentnum(rs.getInt(4));
				dtolist.add(dto);
			}
			
			for(int i = 0; i < dtolist.size(); i++) {
				int contentnumber = dtolist.get(i).getContentnum();
				
				Content_DAO contentdao = new Content_DAO();
				Content_DTO contentdto = new Content_DTO();
				contentdto = contentdao.selectContent(contentnumber);
								
				dtolist.get(i).setExpectedhour(contentdto.getExpectedhour());
				dtolist.get(i).setContent(contentdto.getContent());
				dtolist.get(i).setGood(contentdto.getgood());
				dtolist.get(i).setTitle(contentdto.getTitle());
				dtolist.get(i).setThemenum(contentdto.getThemenum());
				dtolist.get(i).setRegionnum(contentdto.getRegionnum());
				
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
		
		return dtolist;
		
	} // end - selectAllTimeSheet
	
	
	
	
	public TimeSheet_DTO selectTimeSheet(Date day, String userid, int hour) {
		return null;
	}
	public int deleteTimeSheet(Date day, String userid, int hour) {
		return 0;                   
	}    
	
	public int deleteAllTimeSheet(String userid, String day) {

		int result=0;
		try {
			conn = ds.getConnection();
			String sql = "delete from TIMESHEET where id=? and day=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, day);
			result = pstmt.executeUpdate();
			
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
		
		return result;              
	
	}  
	
	public int insertTimeSheet(int hour, String id, String day, int contentnum) {
		
		int result=0;
		try {
			conn = ds.getConnection();
			String sql = "insert into TIMESHEET values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hour);
			pstmt.setString(2, id);
			pstmt.setString(3, day);
			pstmt.setInt(4, contentnum);
			result = pstmt.executeUpdate();
			
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
		
		return result;                   
	}
	
	public int updateTimeSheet(Date day, String userid, int hour) {
		return 0;
	}
	public int deleteTimeSheet(int contentnum) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from timesheet where contentnum = ?";
			
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
	
	public int deleteTimeSheet(String id) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from timesheet where id = ?";
			
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
