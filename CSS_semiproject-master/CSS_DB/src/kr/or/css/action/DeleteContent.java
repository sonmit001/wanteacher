package kr.or.css.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.ContentImage_DAO;
import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Good_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dao.Review_DAO;
import kr.or.css.dao.TimeSheet_DAO;
import kr.or.css.dto.ContentList_DTO;
import kr.or.css.dto.Content_Image_DTO;

public class DeleteContent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Content_DAO dao = new Content_DAO();
		ContentImage_DAO contentdao = new ContentImage_DAO();
		Review_DAO reviewdao = new Review_DAO();
		TimeSheet_DAO timesheetdao = new TimeSheet_DAO();
        Good_DAO gooddao = new Good_DAO();
        Point_DAO pointdao = new Point_DAO();
        
		int contentnum = 0;
		int row = 0;
		try {
			contentnum = Integer.parseInt(request.getParameter("contentnum"));;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		//참조하는 테이블 지우기
		row = contentdao.deleteContentImage(contentnum);
		row = reviewdao.deleteReview(contentnum);
		row = timesheetdao.deleteTimeSheet(contentnum);
		row = gooddao.deleteGood(contentnum);
		row = pointdao.deletePoint(contentnum);
		
		//콘텐츠 지우기
		row = dao.deleteContent(contentnum);
		
		int totalContentCount = dao.totalContentCount();
		
		String psStr = request.getParameter("ps");    //pagesize
        String cpStr = request.getParameter("cp");    //currentpage
        
        if(psStr == null || psStr.trim().equals("")){
            //default 값
            psStr = "5"; // default 5건씩 
        }
        
        if(cpStr == null || cpStr.trim().equals("")){
            cpStr= "1";        //default 1 page
        }
      
        int pagesize = Integer.parseInt(psStr);  //5
        int cpage = Integer.parseInt(cpStr);     //1
        int pagecount = 0;                       
        
        if(totalContentCount % pagesize==0){        //전체 건수 , pagesize > 
            pagecount = totalContentCount/pagesize;
        }else{
            pagecount = (totalContentCount/pagesize) + 1;
        }
		
		List<ContentList_DTO> list = dao.contentList(cpage, pagesize);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("cpage", cpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("list", list);
        request.setAttribute("totalContentCount", totalContentCount);
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/contentList.jsp?cp=" + cpage + "&ps=" + pagesize);
  
		return forward;
	}
}
