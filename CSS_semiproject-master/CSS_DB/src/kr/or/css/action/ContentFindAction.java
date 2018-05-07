package kr.or.css.action;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dto.Content_DTO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Point_DTO;
import net.sf.json.JSONArray;

public class ContentFindAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
		ArrayList<Content_DTO> contents = new ArrayList<>();
        
		String contentnum = (String) request.getParameter("contentnum");
		
		Content_DAO contentdao = new Content_DAO();
		Content_DTO dto = new Content_DTO();
		dto = contentdao.selectContent(Integer.parseInt(contentnum));

		contents.add(dto);
		
		JSONArray jsonlist = JSONArray.fromObject(contents);
		request.setAttribute("jsonarray", jsonlist);
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
        forward.setPath("/WEB-INF/view/arraytojson.jsp");
			
		return forward;
		
	} // end - execute

} // end - class
