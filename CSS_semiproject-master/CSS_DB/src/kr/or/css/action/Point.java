package kr.or.css.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Point_DAO;
import kr.or.css.dto.Content_DTO;
import kr.or.css.dto.Point_DTO;

public class Point implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Point_DAO pointdao = new Point_DAO();
		
		int pointck = Integer.parseInt(request.getParameter("point"));
		String id = (String)request.getSession().getAttribute("id");
		System.out.println("contentnum : " + request.getParameter("contentnum"));
		System.out.println("point : " + pointck);
		int contentnum = Integer.parseInt(request.getParameter("contentnum"));
		
		
		int row = 0;
		if(pointck == 0){
			Point_DTO point = new Point_DTO(id, contentnum);
			row = pointdao.insertPoint(point);
		}else if(pointck == 1) {
			row = pointdao.deletePoint(id, String.valueOf(contentnum));
		}
		
		return null;
	}

}
