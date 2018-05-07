package kr.or.css.action;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dto.ContentAll_DTO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Point_DTO;
import net.sf.json.JSONArray;

public class PointListAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
		
		String userid = (String) request.getParameter("userid");
		System.out.println(userid);
		
		ArrayList<Integer> pointlist = new ArrayList<Integer>();
		ArrayList<Content_Image_DTO> contents = new ArrayList<Content_Image_DTO>();

		Point_DAO pointdao = new Point_DAO();
		pointlist = pointdao.selectAllPoint(userid);

		Content_DAO contentdao = new Content_DAO();
		
		//////////////////////////////////////////////////////////////////////////////

		List<ContentAll_DTO> top3list = new ArrayList<>();
		// 콘텐츠 대표 이미지를 포함한 콘텐츠의 모든 정보가 담긴다
		for(int i = 0; i < pointlist.size(); i++) {
			Content_Image_DTO content_image_dto = new Content_Image_DTO();
			top3list.add(contentdao.contentTopImage(pointlist.get(i), userid));
		}

		//////////////////////////////////////////////////////////////////////////////
		
		JSONArray jsonlist = JSONArray.fromObject(top3list);
		request.setAttribute("jsonarray", jsonlist);
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
        forward.setPath("/WEB-INF/view/arraytojson.jsp");
			
		return forward;
		
	} // end - execute

} // end - class
