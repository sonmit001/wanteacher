package kr.or.css.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Members_DAO;
import kr.or.css.dto.Members_DTO;
import net.sf.json.JSONArray;

public class SearchUser implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Members_DAO dao = new Members_DAO();
		String userid = request.getParameter("id");
		
		Members_DTO member = dao.selectUser(userid);
		if(member != null) {
			JSONArray jsonlist = JSONArray.fromObject(member);
			request.setAttribute("jsonarray", jsonlist);
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/arraytojson.jsp");
  
		return forward;
	}

}
