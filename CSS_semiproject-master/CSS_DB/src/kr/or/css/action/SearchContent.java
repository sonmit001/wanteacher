package kr.or.css.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dto.ContentList_DTO;
import net.sf.json.JSONArray;

public class SearchContent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Content_DAO dao = new Content_DAO();
		int contentnum = 9999;
		try {
			contentnum = Integer.parseInt(request.getParameter("contentnum"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ContentList_DTO cotent = dao.searchContent(contentnum);
		if(cotent != null) {
			JSONArray jsonlist = JSONArray.fromObject(cotent);
			request.setAttribute("jsonarray", jsonlist);
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/arraytojson.jsp");
  
		return forward;
	}

}
