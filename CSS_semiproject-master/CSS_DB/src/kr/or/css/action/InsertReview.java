package kr.or.css.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Members_DAO;
import kr.or.css.dao.Review_DAO;

public class InsertReview implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Review_DAO reviewdao = new Review_DAO();
		Members_DAO membersdao = new Members_DAO();
		
		int contentnum = Integer.parseInt(request.getParameter("contentnum"));
		String reviewcontent = request.getParameter("reviewcontent");
		String id = (String)request.getSession().getAttribute("id");
		
		int row = reviewdao.insertReview(contentnum, id, reviewcontent);
		String msg = "";
		
		if(row == 0) {
			msg = "이미 리뷰를 작성하셨습니다.";
		}else if(row == 1) {
			msg = "리뷰 작성이 완료되었습니다.";
			membersdao.updateRuby(10, id);
		}
	
		request.setAttribute("msg", msg);
		//request.setAttribute("url", "contentDetail.jsp");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/reviewck.jsp");
  
		return forward;
	}

}
