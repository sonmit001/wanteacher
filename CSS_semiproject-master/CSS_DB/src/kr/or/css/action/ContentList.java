package kr.or.css.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dto.ContentList_DTO;
import kr.or.css.dto.Members_DTO;

public class ContentList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Content_DAO dao = new Content_DAO();
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
		forward.setPath("/WEB-INF/view/contentList.jsp");
  
		return forward;
	}

}
