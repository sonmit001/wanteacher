package kr.or.css.action;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Point_DTO;
import net.sf.json.JSONArray;

public class DeletePointAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
		
        String userid = (String) request.getParameter("userid");

        String contentnum = (String) request.getParameter("contentnumber");
		
		Point_DAO pointdao = new Point_DAO();
		int result = pointdao.deletePoint(userid, contentnum);
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
        forward.setPath("/WEB-INF/view/arraytojson.jsp");
			
		return forward;
		
	} // end - execute

} // end - class
