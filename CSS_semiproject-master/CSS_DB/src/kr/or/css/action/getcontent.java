package kr.or.css.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dto.ContentList_DTO;
import kr.or.css.dto.Content_DTO;
import kr.or.css.dto.Content_Image_DTO;

public class getcontent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Content_DAO dao = new Content_DAO();
		int num = Integer.parseInt(request.getParameter("contentnum"));
		Content_DTO contentdto = dao.selectContent(num);

		request.setAttribute("Content_DTO", contentdto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/ContentEdit.jsp");
		
		return forward;
	}

}
