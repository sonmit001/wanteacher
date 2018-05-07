package kr.or.css.action;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dto.ContentAll_DTO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Point_DTO;
import net.sf.json.JSONArray;

public class zzim2Action implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("들어오니?");
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
		
		String d1 = (String) request.getParameter("changeday1");
		String d2 = (String) request.getParameter("changeday2");
		String d3 = (String) request.getParameter("changeday3");
		
		request.setAttribute("changeday1", d1);
		request.setAttribute("changeday2", d2);
		request.setAttribute("changeday3", d3);
		
		System.out.println("zzim2엑션");
		System.out.println(d1);
		System.out.println(d2);
		System.out.println(d3);
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
        forward.setPath("/WEB-INF/view/zzim.jsp");
			
		return forward;
		
	} // end - execute

} // end - class
