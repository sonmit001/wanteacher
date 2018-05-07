package kr.or.css.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.ContentImage_DAO;
import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Good_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dao.Region_DAO;
import kr.or.css.dao.Review_DAO;
import kr.or.css.dao.Theme_DAO;
import kr.or.css.dto.ContentAll_DTO;
import kr.or.css.dto.ContentReview_DTO;
import kr.or.css.dto.Content_DTO;
import kr.or.css.dto.Good_DTO;
import kr.or.css.dto.Point_DTO;
import kr.or.css.dto.Region_DTO;
import kr.or.css.dto.Review_DTO;
import kr.or.css.dto.Theme_DTO;

public class ContentDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Content_DAO cotentdao = new Content_DAO();
		Region_DAO regiondao = new Region_DAO();
		Theme_DAO themedao = new Theme_DAO();
		Good_DAO gooddao = new Good_DAO();
		Point_DAO pointdao = new Point_DAO();
		Review_DAO reviewdao = new Review_DAO();
		ContentImage_DAO contentimagedao = new ContentImage_DAO();
		
		int contentnum = 0;
		try {
			contentnum = Integer.parseInt(request.getParameter("contentnum"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String id = (String)request.getSession().getAttribute("id");
		
		
		Content_DTO content = cotentdao.selectContent(contentnum);
		Theme_DTO theme = themedao.selectTheme(content.getThemenum());
		Region_DTO region = regiondao.selectRegion(content.getRegionnum());
		int totalGoodCount = gooddao.totalGoodCount(contentnum);
		Point_DTO point = pointdao.selectPoint(contentnum, id);
		Good_DTO good = gooddao.selectGood(contentnum, id);
		List<ContentReview_DTO> reviewlist = reviewdao.selectAllReview(contentnum, 1, 3);
		Review_DTO reviewdto = reviewdao.selectReview(contentnum, id);
		List<Content_DTO> top3 = cotentdao.contentTOP3(content.getThemenum(), content.getRegionnum(), contentnum);
		List<ContentAll_DTO> top3list = new ArrayList<>();
		List<String> imagelist = contentimagedao.selectAllContentImage(contentnum);
		
		for(int i=0; i<top3.size(); i++) {
			System.out.println(top3.get(i).getContentnum());
			System.out.println(cotentdao.contentTopImage(top3.get(i).getContentnum(), id));
			top3list.add(cotentdao.contentTopImage(top3.get(i).getContentnum(), id));
		}
		
		request.setAttribute("content", content);
		request.setAttribute("contentnum", content.getContentnum());
		request.setAttribute("themename", theme.getThemename());
		request.setAttribute("regionname", region.getRegionname());
		request.setAttribute("totalGoodCount", totalGoodCount);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("reviewfirst", 1);
		request.setAttribute("reviewlast", 3);
		request.setAttribute("top3list", top3list);
		request.setAttribute("imagelist", imagelist);
		
		if(point == null) {
			request.setAttribute("point", 0);
		}else {
			request.setAttribute("point", 1);
		}
		
		if(good == null) {
			request.setAttribute("good", 0);
		}else {
			request.setAttribute("good", 1);
		}
		
		if(reviewdto == null) {
			request.setAttribute("reviewck", 0);
		}else {
			request.setAttribute("reviewck", 1);
		}
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
        forward.setPath("/WEB-INF/view/contentDetail.jsp");
			
		return forward;
	}

}
