package kr.or.css.action;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Members_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Point_DTO;
import net.sf.json.JSONArray;

public class FindPartnerAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String userid = (String) request.getParameter("userid");
        
        Members_DAO memberdao = new Members_DAO();
        String partner_name = memberdao.selectPartner(userid);
		ArrayList<String> list = new ArrayList<>();
		list.add(partner_name);
		
		JSONArray jsonlist = JSONArray.fromObject(list);
		request.setAttribute("jsonarray", jsonlist);
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
        forward.setPath("/WEB-INF/view/arraytojson.jsp");
			
		return forward;
		
	} // end - execute

} // end - class
