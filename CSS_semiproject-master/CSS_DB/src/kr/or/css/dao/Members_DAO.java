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

import kr.or.css.dto.Members_DTO;
import kr.or.css.dto.Partner_DTO;

public class Members_DAO {
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

	public ArrayList<Members_DTO> selectAllUser() {
		ArrayList<Members_DTO> list =null;
		   Members_DTO dto=null;
	      
	      try {
	         conn=ds.getConnection();
	         String sql = "select id,pwd,nickname,age,gender,email,partner,ruby from members ";
	         pstmt=conn.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            dto = new Members_DTO();
	            dto.setId(rs.getString("id"));
	            dto.setPwd(rs.getString("pwd"));
	            dto.setNickname(rs.getString("nickname"));
	            dto.setAge(rs.getInt("age"));
	            dto.setGender(rs.getString("gender"));
	            dto.setEmail(rs.getString("email"));
	            dto.setPartner(rs.getString("partner"));
	            dto.setRuby(rs.getInt("ruby"));
	            list= new ArrayList<Members_DTO>();
	            list.add(dto);
	         }
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(rs!=null) try {rs.close();} catch (Exception e2) {}
	         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
	         if(conn!=null) try {conn.close();} catch (Exception e2) {}
	      }
	      
	      return list;
	}

	public ArrayList<Members_DTO> selectAllUser(int cpage, int pagesize) {
		
		ArrayList<Members_DTO> list = null;
		
		try {
			conn = ds.getConnection();
			String sql = " select * from "
					+ " ( select ROWNUM rn, id, pwd, nickname, age, gender, email, partner, ruby from members where id != 'admin') "
					+ " where rn between ? and ?";
			
			int start = cpage * pagesize - (pagesize - 1);
			int end = cpage * pagesize;

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			// 객체 형태로 DB가지고 데이터
			list = new ArrayList<Members_DTO>();
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String nickname = rs.getString("nickname");
				int age = rs.getInt("age");
				String gender = rs.getString("gender");
				String email = rs.getString("email");
				String partner = rs.getString("partner");
				int ruby = rs.getInt("ruby");
				
				Members_DTO member = new Members_DTO(id, pwd, nickname, age, gender, email, partner, ruby);
				list.add(member);
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
	
	public String selectPartner(String userid) {
		
		String partner_name = null;
		
		try {
			
			conn = ds.getConnection();
			String sql = "select PARTNER from members where id='" + userid + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				partner_name = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return partner_name;
	}
	
	public Members_DTO selectUser(String userid) {

		
		Members_DTO member = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from members where id != 'admin' and id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String nickname = rs.getString("nickname");
				int age = rs.getInt("age");
				String gender = rs.getString("gender");
				String email = rs.getString("email");
				String partner = rs.getString("partner");
				int ruby = rs.getInt("ruby");
				
				member = new Members_DTO(id, pwd, nickname, age, gender, email, partner, ruby);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return member;

	}

	public int updateUser(Members_DTO user) {
		int result =0;
		try {
	         conn=ds.getConnection();
	         String sql = "update members set pwd=?,nickname=?,age=?,gender=?,email=? where id=?";
	         pstmt=conn.prepareStatement(sql);
	         
	         pstmt.setString(1, user.getPwd());
	         pstmt.setString(2, user.getNickname() );
	         pstmt.setInt(3, user.getAge());
	         pstmt.setString(4,user.getGender() );
	         pstmt.setString(5, user.getEmail());
	         
	         pstmt.setString(6, user.getId());
	         result =pstmt.executeUpdate();
	         
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
	         if(conn!=null) try {conn.close();} catch (Exception e2) {}
	      }
	      
	      return result;
	}
	
	public int updateUser(String userid) {

		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "update members set partner = null where partner = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
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
	
	public int deleteUser(String userid) {

		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "delete from members where id != 'admin' and id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
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

	public int insertUser(Members_DTO user) {
		 int row =0;
	   
	      try {
	         conn=ds.getConnection();
	         String sql ="insert into members(id,pwd,nickname,age,gender,email,partner,ruby) values(?,?,?,?,?,?,?,?)";
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, user.getId());
	         pstmt.setString(2, user.getPwd());
	         pstmt.setString(3, user.getNickname());
	         pstmt.setInt(4, user.getAge());
	         pstmt.setString(5, user.getGender());
	         pstmt.setString(6, user.getEmail());
	         pstmt.setString(7, user.getPartner());
	         pstmt.setInt(8, user.getRuby());
	         
	         row=pstmt.executeUpdate();
	         
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
	         if(conn!=null) try {conn.close();} catch (Exception e2) {}
	      }
	      
	      return row;
	}

	public int updateRuby(int ruby, String id) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "update members set ruby = ruby + ? where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ruby);
			pstmt.setString(2, id);
			
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
	         if(conn!=null) try {conn.close();} catch (Exception e2) {}
		}
		
		return row;
		  
	}

	public int updatePartner(String userid) {
		  try {
		         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }
	      return 0;
	}
	
	public int totalUserCount() {
		int totalCount = 0;
		try {
			conn = ds.getConnection();
			String sql = "select count(*) cnt from members where id != 'admin'";
			pstmt = conn.prepareStatement(sql);
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
	//진국이형
	public String checkById(String id) {
	      String check=null;
	      
	      try {
	         conn=ds.getConnection();
	         String sql = "select id from members where id=?";
	         pstmt =conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            
	            check="false";
	         }else {
	            check="true";
	            
	         }
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(rs!=null) try {rs.close();} catch (Exception e2) {}
	         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
	         if(conn!=null) try {conn.close();} catch (Exception e2) {}
	      }
	      
	      return check;
	   }
	   public String checkByname(String nickname) {
	      String check=null;
	      
	      try {
	         conn=ds.getConnection();
	         String sql = "select nickname from members where nickname=?";
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, nickname);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            check="false";
	         }else {
	            check="true";
	         }
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(rs!=null) try {rs.close();} catch (Exception e2) {}
	         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
	         if(conn!=null) try {conn.close();} catch (Exception e2) {}
	      }
	      return check;
	   }
	   public String checkByemail(String email) {
	      String check=null;
	      
	      try {
	         conn=ds.getConnection();
	         String sql = "select email from members where email=?";
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, email);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            check="false";
	         }else {
	            check="true";
	         }
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(rs!=null) try {rs.close();} catch (Exception e2) {}
	         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
	         if(conn!=null) try {conn.close();} catch (Exception e2) {}
	      }
	      return check;
	   }
	   
	   public String Login(String id ,String pwd) {
	      
	      System.out.println("login id: " + id);
	      System.out.println("login pwd: " + pwd);
	      
	      String check = "false";
	      try {
	         
	         conn=ds.getConnection();
	         String sql ="select id,pwd from members where id=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()) {
	            //ID랑 비번이 맞을경우
	            if(pwd.equals(rs.getString("pwd"))&& id.equals(rs.getString("id"))) {
	                  check="true";
	            }
	         }
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }finally {
	         if(rs!=null) try {rs.close();} catch (Exception e2) {}
	         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
	         if(conn!=null) try {conn.close();} catch (Exception e2) {}
	      }
	      return check;
	   }
	   public boolean ismember(String id) {
			
			boolean ch=false;//맴버 존재여뷰X
			try {
				
				
				
				
					conn=ds.getConnection();
			         String sql = "select * from members where id=?";
			         pstmt=conn.prepareStatement(sql);
			         pstmt.setString(1, id);
			         rs=pstmt.executeQuery();
				
				
				
				
				System.out.println("확인중");
							while (rs.next()) {
								System.out.println("ismember : 맴버에 존재함");
								ch=true; //맴버 존재여뷰O
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
	   public int updatemember(Members_DTO user) {
			   int result =0;
			try {
		         conn=ds.getConnection();
		         String sql = "update members set id=?,pwd=?,nickname=?,age=?,gender=?,email=?,partner=?,ruby=?  where id=?";
		         pstmt=conn.prepareStatement(sql);
		         pstmt.setString(1, user.getId());
		         pstmt.setString(2, user.getPwd());
		         pstmt.setString(3, user.getNickname() );
		         pstmt.setInt(4, user.getAge());
		         pstmt.setString(5,user.getGender() );
		         pstmt.setString(6, user.getEmail());
		         pstmt.setString(7, user.getPartner());
		         pstmt.setInt(8, user.getRuby());
		         pstmt.setString(9, user.getId());
		         
		         result =pstmt.executeUpdate();
		         
		         
		      } catch (Exception e) {
		         System.out.println(e.getMessage());
		      }finally {
		         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
		         if(conn!=null) try {conn.close();} catch (Exception e2) {}
		      }
		      
		      return result;
		}

}
