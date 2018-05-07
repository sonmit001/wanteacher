package kr.or.css.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Good_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dto.Point_DTO;

public class Good implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Good_DAO gooddao = new Good_DAO();
		Content_DAO contentdao = new Content_DAO();
		
		int goodck = Integer.parseInt(request.getParameter("good"));
		String id = (String)request.getSession().getAttribute("id");
		System.out.println("contentnum : " + request.getParameter("contentnum"));
		System.out.println("point : " + goodck);
		int contentnum = Integer.parseInt(request.getParameter("contentnum"));
		
		
		int row = 0;
		if(goodck == 0){
			row = gooddao.insertGood(contentnum, id);
		}else if(goodck == 1) {
			row = gooddao.deleteGood(contentnum, id);
		}
		
		int goodcount = gooddao.totalGoodCount(contentnum);
		row = contentdao.updateContentGood(contentnum, goodcount);
		
		return null;
	}

}
