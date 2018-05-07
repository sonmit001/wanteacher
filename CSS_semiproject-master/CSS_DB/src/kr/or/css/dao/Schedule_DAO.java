package kr.or.css.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.css.dto.Schedule_DTO;

public class Schedule_DAO {
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
	
	public ArrayList<Schedule_DTO> selectAllSchedule(String userid, String month){
		
		ArrayList<Schedule_DTO> schedulelist = new ArrayList<Schedule_DTO>();
		
		try {
			conn = ds.getConnection();
			int maxdate = 0;
			
			// 검색을 위한 끝 날짜 설정 로직
			int[] date_31 = {1, 3, 5, 7, 8 ,10, 12};
			for(int i = 0; i < date_31.length; i++) {
				if(Integer.parseInt(month) == date_31[i]) {
					maxdate = 31;
				}
			}
			
			int[] date_30 = {4, 6, 9, 11}; 
			for(int i = 0; i < date_30.length; i++) {
				if(Integer.parseInt(month) == date_30[i]) {
					maxdate = 30;
				}
			}
			
			if(Integer.parseInt(month) == 2) {
				maxdate = 28;
			}
			
			// 일의 자리수 month에 0 붙이는 처리
			if(Integer.parseInt(month) < 10) {
				String temp = "0";
				temp += month;
				month = temp;
			}
			String sql = "select * from SCHEDULES where day>=to_date('2018-"+ month +"-01') and day<=to_date('2018-" + month + "-" + maxdate + "') and id='" + userid + "'";
			System.out.println("sql 테스트 : " + sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			Schedule_DTO scheduledto;
			while(rs.next()) {
				scheduledto = new Schedule_DTO(); 
				scheduledto.setId(rs.getString(1)); 
				scheduledto.setDay(rs.getString(2));
				schedulelist.add(scheduledto);
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return schedulelist;
	}

	public int selectSchedule(String day , String userid) {
		
		int result = 0;
		try {
			conn = ds.getConnection();
			String sql = "select * from SCHEDULES where id=? and day=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, day);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result++;
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
		
		return result;
	}
		
	public int deleteSchedule2(String day , String userid) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from SCHEDULES where id = ? and day = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, day);
			row = pstmt.executeUpdate();
			
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
		
		return row;
	}
	
	public int deleteSchedule(String userid) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from SCHEDULES where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			row = pstmt.executeUpdate();
			
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
		
		return row;
	}
	
	public int insertSchedule(String day , String userid) {
		
		int result=0;
		try {
			conn = ds.getConnection();
			String sql = "insert into SCHEDULES values(?, ?)";
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

}
