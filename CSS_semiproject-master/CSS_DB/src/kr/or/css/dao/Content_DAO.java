package kr.or.css.dao;

import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.css.action.ContentList;
import kr.or.css.dto.ContentAll_DTO;
import kr.or.css.dto.ContentList_DTO;
import kr.or.css.dto.Content_DTO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Good_DTO;
import kr.or.css.dto.Point_DTO;

public class Content_DAO {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	
	public Content_DAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}
	public List<Content_DTO> selectAllContent(){
		
		List<Content_DTO> contentlist = null;	
		
		try {
			conn = ds.getConnection();
			String sql = " select * from content";		
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			

			// 객체 형태로 DB가지고 데이터
			contentlist = new ArrayList<Content_DTO>();
			while (rs.next()) {
				int contentnum = rs.getInt("CONTENTNUM");
				int expectedhour = rs.getInt("EXPECTEDHOUR");
				String content = rs.getString("CONTENT");
				int good = rs.getInt("GOOD");
				String title = rs.getString("TITLE");
				int themenum = rs.getInt("THEMENUM");
				int regionnum = rs.getInt("REGIONNUM");


				Content_DTO contentdto = new Content_DTO(contentnum, expectedhour, content, good, title,
						themenum, regionnum);
				contentlist.add(contentdto);
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
		return contentlist;
	}
	
	public Content_DTO selectContent(int contentnum) {
		Content_DTO contentdto = new Content_DTO();
		try {
			System.out.println("seleccontent 들어옴 시작");
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from CONTENT where CONTENTNUM='" + contentnum + "'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				contentdto.setContentnum(rs.getInt(1));
				contentdto.setExpectedhour(rs.getInt(2));
				contentdto.setContent(rs.getString(3));
				contentdto.setgood(rs.getInt(4));
				contentdto.setTitle(rs.getString(5));
				contentdto.setThemenum(rs.getInt(6));
				contentdto.setRegionnum(rs.getInt(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
			      if(rs!=null) try {rs.close();} catch (Exception e2) {}
			      if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
			      if(conn!=null) try {conn.close();} catch (Exception e2) {}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return contentdto;
		
	}
	
	public Content_Image_DTO selectContentAndTopimage(int contentnum) {
		
		Content_Image_DTO contentimagedto = new Content_Image_DTO();
		try {
			String sql = "select * from CONTENT where CONTENTNUM='" + contentnum + "'";
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				contentimagedto.setContentnum(rs.getInt(1));
				contentimagedto.setExpectedhour(rs.getInt(2));
				contentimagedto.setContent(rs.getString(3));
				contentimagedto.setGood(rs.getInt(4));
				contentimagedto.setTitle(rs.getString(5));
				contentimagedto.setThemenum(rs.getInt(6));
				contentimagedto.setRegionnum(rs.getInt(7));
			}
				
			String image_sql = "select IMAGE from IMAGE where CONTENTNUM=" + contentnum + " and TOPIMAGE = 1";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				contentimagedto.setTopimage("대표이미지주소");
			}
			
			String regionname_sql = "select REGIONNAME from REGION where REGIONNUM=" + contentimagedto.getRegionnum();
			rs = stmt.executeQuery(regionname_sql);
			
			while(rs.next()) {
				contentimagedto.setRegionname(rs.getString(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return contentimagedto;
		
	}
	
	public int updateContent(Content_DTO content) {

		int row = 0;
		try {
			conn = ds.getConnection();
			String sql= "update content set expectedhour = ?, content=?, title=?, themenum=?, regionnum = ?  where contentnum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, content.getExpectedhour());
			pstmt.setString(2, content.getContent());
			pstmt.setString(3, content.getTitle());
			pstmt.setInt(4, content.getThemenum());
			pstmt.setInt(5, content.getRegionnum());
			pstmt.setInt(6, content.getContentnum());
					
			row = pstmt.executeUpdate();

			
		}catch (Exception e) {
			e.getStackTrace();
		}finally {
			try {
				  if(rs!=null) try {rs.close();} catch (Exception e2) {}
			         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
			         if(conn!=null) try {conn.close();} catch (Exception e2) {}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return row;
		
		
	}
	
	public int deleteContent(int contentnum) {
		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "delete from content where contentnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentnum);
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return row;
	}
	
	public int insertContent(Content_DTO content) {
		System.out.println("insert content 들어옴");
		int row = -1;
		try {
			conn = ds.getConnection();
			String sql= "insert into CONTENT(contentnum, expectedhour, content, good, title, themenum, regionnum) values(seq_id.nextval,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println("query 들어옴");
			
			pstmt.setInt(1, content.getExpectedhour());
			pstmt.setString(2, content.getContent());
			pstmt.setInt(3, content.getgood());
			pstmt.setString(4, content.getTitle());
			pstmt.setInt(5, content.getThemenum());//theme number 가져오기
			pstmt.setInt(6, content.getRegionnum());
					
			row = pstmt.executeUpdate();
			System.out.println("row 글 넣기 제대로 되었나 확인" + row);
			row-=1;
			
			String sql2 = "SELECT seq_id.CURRVAL FROM DUAL";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql2);
			
			while (rs.next()) {
				row = rs.getInt(1);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				  if(rs!=null) try {rs.close();} catch (Exception e2) {}
			         if(pstmt!=null) try {pstmt.close();} catch (Exception e2) {}
			         if(conn!=null) try {conn.close();} catch (Exception e2) {}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return row;
		
	}
	
public List<Content_DTO> themeContent(int tnum){
		
		List<Content_DTO> themecontent = null;	
		
		try {
			conn = ds.getConnection();
			String sql = " select * from content where THEMENUM = ? ";		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tnum);
			rs = pstmt.executeQuery();
			

			// 객체 형태로 DB가지고 데이터
			themecontent = new ArrayList<Content_DTO>();
			
			
			
			while (rs.next()) {
				int contentnum = rs.getInt("CONTENTNUM");
				int expectedhour = rs.getInt("EXPECTEDHOUR");
				String content = rs.getString("CONTENT");
				int good = rs.getInt("GOOD");
				String title = rs.getString("TITLE");
				int themenum = rs.getInt("THEMENUM");
				int regionnum = rs.getInt("REGIONNUM");


				Content_DTO contentdto = new Content_DTO(contentnum, expectedhour, content, good, title,
						themenum, regionnum);
				themecontent.add(contentdto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		return themecontent;
	}
public List<Content_DTO> searchregion(int rnum, String search){
	System.out.println("searchregion");
List<Content_DTO> searchlist = null;	

try {
	conn = ds.getConnection();
	String sql = " select * from content where title like ? and REGIONNUM = ?";		
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "%"+search+"%");
	pstmt.setInt(2, rnum);
	rs = pstmt.executeQuery();
	

	// 객체 형태로 DB가지고 데이터
	searchlist = new ArrayList<Content_DTO>();
	while (rs.next()) {
		int contentnum = rs.getInt("CONTENTNUM");
		int expectedhour = rs.getInt("EXPECTEDHOUR");
		String content = rs.getString("CONTENT");
		int good = rs.getInt("GOOD");
		String title = rs.getString("TITLE");
		int themenum = rs.getInt("THEMENUM");
		int regionnum = rs.getInt("REGIONNUM");


		Content_DTO contentdto = new Content_DTO(contentnum, expectedhour, content, good, title,
				themenum, regionnum);
		searchlist.add(contentdto);
	}

} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		pstmt.close();
		rs.close();
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
}
return searchlist;
}
public List<Content_DTO> searchtheme(int tnum, String search){
		System.out.println("searchtheme");
	List<Content_DTO> searchlist = null;	
	
	try {
		conn = ds.getConnection();
		String sql = " select * from content where title like ? and THEMENUM = ?";		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+search+"%");
		pstmt.setInt(2, tnum);
		rs = pstmt.executeQuery();
		

		// 객체 형태로 DB가지고 데이터
		searchlist = new ArrayList<Content_DTO>();
		while (rs.next()) {
			int contentnum = rs.getInt("CONTENTNUM");
			int expectedhour = rs.getInt("EXPECTEDHOUR");
			String content = rs.getString("CONTENT");
			int good = rs.getInt("GOOD");
			String title = rs.getString("TITLE");
			int themenum = rs.getInt("THEMENUM");
			int regionnum = rs.getInt("REGIONNUM");


			Content_DTO contentdto = new Content_DTO(contentnum, expectedhour, content, good, title,
					themenum, regionnum);
			searchlist.add(contentdto);
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	return searchlist;
}
public List<Content_DTO> searchthemeregioncontent(int tnum, int rnum){
	System.out.println("searchtheme");
List<Content_DTO> searchlist = null;	

try {
	conn = ds.getConnection();
	String sql = " select * from content where REGIONNUM = ? and THEMENUM = ?";		
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,rnum );
	pstmt.setInt(2, tnum);
	rs = pstmt.executeQuery();
	

	// 객체 형태로 DB가지고 데이터
	searchlist = new ArrayList<Content_DTO>();
	while (rs.next()) {
		int contentnum = rs.getInt("CONTENTNUM");
		int expectedhour = rs.getInt("EXPECTEDHOUR");
		String content = rs.getString("CONTENT");
		int good = rs.getInt("GOOD");
		String title = rs.getString("TITLE");
		int themenum = rs.getInt("THEMENUM");
		int regionnum = rs.getInt("REGIONNUM");


		Content_DTO contentdto = new Content_DTO(contentnum, expectedhour, content, good, title,
				themenum, regionnum);
		searchlist.add(contentdto);
	}

} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		pstmt.close();
		rs.close();
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
}
return searchlist;
}
public List<Content_DTO> regionContent(int rnum){
	
	List<Content_DTO> regioncontent = null;	
	
	try {
		conn = ds.getConnection();
		String sql = " select * from content where REGIONNUM = ? ";		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rnum);
		rs = pstmt.executeQuery();
		

		// 객체 형태로 DB가지고 데이터
		regioncontent = new ArrayList<Content_DTO>();
		while (rs.next()) {
			int contentnum = rs.getInt("CONTENTNUM");
			int expectedhour = rs.getInt("EXPECTEDHOUR");
			String content = rs.getString("CONTENT");
			int good = rs.getInt("GOOD");
			String title = rs.getString("TITLE");
			int themenum = rs.getInt("THEMENUM");
			int regionnum = rs.getInt("REGIONNUM");


			Content_DTO contentdto = new Content_DTO(contentnum, expectedhour, content, good, title,
					themenum, regionnum);
			regioncontent.add(contentdto);
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			rs.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	return regioncontent;
}

public List<ContentList_DTO> contentList(int cpage, int pagesize) {
	List<ContentList_DTO> list = null;
	
	try {
		conn = ds.getConnection();
		String sql = "select contentnum, title, themename, regionname from (select ROWNUM rn, CONTENTNUM, title, THEMENAME, REGIONNAME from(select c.CONTENTNUM, c.title, t.THEMENAME, r.REGIONNAME from content c join THEME t on c.THEMENUM = t.THEMENUM join REGION r on c.REGIONNUM = r.REGIONNUM where c.contentnum != 0 order by c.CONTENTNUM)) where rn between ? and ?";		
		
		int start = cpage * pagesize - (pagesize - 1);
		int end = cpage * pagesize;

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		
		rs = pstmt.executeQuery();
		
		// 객체 형태로 DB가지고 데이터
		list = new ArrayList<ContentList_DTO>();
		while (rs.next()) {
			int contentnum = rs.getInt("contentnum");
			String title = rs.getString("title");
			String themename = rs.getString("themename");
			String regionname = rs.getString("regionname");

			ContentList_DTO content = new ContentList_DTO(contentnum, title, themename, regionname);
			
			list.add(content);
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
	return list;
}
	
public ContentList_DTO searchContent(int num) {
	ContentList_DTO content = null;
	
	try {
		conn = ds.getConnection();
		String sql = "select c.CONTENTNUM, c.title, t.THEMENAME, r.REGIONNAME from content c join THEME t on c.THEMENUM = t.THEMENUM join REGION r on c.REGIONNUM = r.REGIONNUM where c.contentnum = ?";		

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		rs = pstmt.executeQuery();
		if (rs.next()) {
			int contentnum = rs.getInt("contentnum");
			String title = rs.getString("title");
			String themename = rs.getString("themename");
			String regionname = rs.getString("regionname");
			
			content = new ContentList_DTO(contentnum, title, themename, regionname);
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
	
	return content;
}

public int totalContentCount() {
	int totalCount = 0;
	try {
		conn = ds.getConnection();
		String sql = "select count(*) cnt from content";
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
	public int updateContentGood(int contentnum, int good) {
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "update content set good = ? where contentnum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, good);
			pstmt.setInt(2, contentnum);
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return row;
	}

	public ContentAll_DTO contentTopImage(int num, String userid) {
		ContentAll_DTO contentimage = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select contentnum, expectedhour, content, good, title, themenum, regionnum, image, themename, REGIONNAME from (select ROWNUM rn, c.*, i.image, r.REGIONNAME, t.themename from content c left outer join image i on c.contentnum = i.contentnum join region r on c.regionnum = r.REGIONNUM join theme t on c.themenum = t.themenum where c.CONTENTNUM = ?) where rn = 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int contentnum = rs.getInt("contentnum");
				int expectedhour = rs.getInt("expectedhour");
				String content = rs.getString("content");
				int good = rs.getInt("good");
				String title = rs.getString("title");
				int themenum = rs.getInt("themenum");
				int regionnum = rs.getInt("regionnum");
				String image = rs.getString("image");
				String themename = rs.getString("themename");
				String regionname = rs.getString("regionname");
				
				contentimage = new ContentAll_DTO(contentnum, expectedhour, content, good, title, themenum, regionnum, image, themename, regionname);
				
				Point_DAO poindao = new Point_DAO();
				Point_DTO pointdto = poindao.selectPoint(num, userid);
				
				if(pointdto == null) {
					contentimage.setPointck(0);
				}else {
					contentimage.setPointck(1);
				}
				
				Good_DAO gooddao = new Good_DAO();
				Good_DTO gooddto = gooddao.selectGood(num, userid);
				
				if(gooddto == null) {
					contentimage.setGoodck(0);
				}else {
					contentimage.setGoodck(1);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if(rs != null)try {rs.close();} catch (SQLException e) {}
			if(conn != null)try {conn.close();} catch (SQLException e) {}
		}
		
		return contentimage;
	}
	
	public List<Content_DTO> contentTOP3(int tnum, int rnum, int cnum){
		List<Content_DTO> list = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select contentnum, expectedhour, content, good, title, themenum, regionnum from (select ROWNUM rn, c.* from content c where c.themenum = ? and c.regionnum = ? and c.contentnum != ? order by c.good desc) where rn between 1 and 3";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tnum);
			pstmt.setInt(2, rnum);
			pstmt.setInt(3, cnum);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Content_DTO>();
			
			while(rs.next()) {
				int contentnum = rs.getInt("contentnum");
				int expectedhour = rs.getInt("expectedhour");
				String content = rs.getString("content");
				int good = rs.getInt("good");
				String title = rs.getString("title");
				int themenum = rs.getInt("themenum");
				int regionnum = rs.getInt("regionnum");
				
				Content_DTO contentdto = new Content_DTO(contentnum, expectedhour, content, good, title, themenum, regionnum);
				list.add(contentdto);
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
}
