package kr.or.css.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Theme_DAO;
import kr.or.css.dto.ContentAll_DTO;
import kr.or.css.dto.Content_DTO;
import kr.or.css.dto.Content_Image_DTO;
import net.sf.json.JSONArray;

public class ThemaList implements Action{

	
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null;
		
		try {
			// 선택 테마 출력
		  
			 int tnum = Integer.parseInt(request.getParameter("tnum"));
			 String id = (String)request.getSession().getAttribute("id");
			Content_DAO dao = new Content_DAO();
			ArrayList<Content_DTO> themes = (ArrayList)dao.themeContent(tnum);
			
		
			
			List<ContentAll_DTO> top3list = new ArrayList<>();
			
			for(int i=0; i<themes.size(); i++) {
				System.out.println(themes.get(i).getContentnum());
				System.out.println(dao.contentTopImage(themes.get(i).getContentnum(), id));
				top3list.add(dao.contentTopImage(themes.get(i).getContentnum(), id));
			}
			
			
			
			
			JSONArray jsonlist = JSONArray.fromObject(top3list);
			// 요청 결과 저장
			
			System.out.println(jsonlist);
			// view 페이지 설정
			/*RequestDispatcher dis = request.getRequestDispatcher("tables.jsp");
			dis.forward(request, response);*/
					
            
            
           forward = new ActionForward();
            
            request.setAttribute("jsonarray", jsonlist);
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/view/arraytojson.jsp");
			
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		
		
		
		return forward;
		
	} // end - execute

} // end - class
