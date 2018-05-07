package kr.or.css.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Region_DAO;
import kr.or.css.dao.Theme_DAO;
import kr.or.css.dto.Region_DTO;
import kr.or.css.dto.Theme_DTO;
import net.sf.json.JSONArray;

public class getthemename implements Action{

	
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null;
		
		try {
			// 선택 테마 출력
			Theme_DAO dao = new Theme_DAO();
			List<Theme_DTO> themelist = dao.selectAllTheme();
			JSONArray jsonlist = JSONArray.fromObject(themelist);
			// 요청 결과 저장
			
			System.out.println("region"+jsonlist);
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
