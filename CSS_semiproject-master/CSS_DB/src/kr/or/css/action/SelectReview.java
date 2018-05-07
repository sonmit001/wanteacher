package kr.or.css.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Review_DAO;
import kr.or.css.dto.ContentReview_DTO;
import net.sf.json.JSONArray;

public class SelectReview implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Review_DAO reviewdao = new Review_DAO();
		
		int reviewfirst = 0;
		int reivewlast = 0;
		int contentnum = 0;
		
		try {
			reviewfirst = Integer.parseInt(request.getParameter("reviewfirst"));
			reivewlast = Integer.parseInt(request.getParameter("reviewlast"));
			contentnum = Integer.parseInt(request.getParameter("contentnum"));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		List<ContentReview_DTO> list = reviewdao.selectAllReview(contentnum, reviewfirst, reivewlast);
		
		if(list != null) {
			JSONArray jsonlist = JSONArray.fromObject(list);
			request.setAttribute("jsonarray", jsonlist);
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/arraytojson.jsp");
  
		return forward;
	}

}
