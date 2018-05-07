package kr.or.css.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Members_DAO;
import kr.or.css.dto.Members_DTO;

public class MemberManagement implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		Members_DAO dao = new Members_DAO();
		int totalUserCount = dao.totalUserCount();
		System.out.println("totalUserCount : " + totalUserCount);
		
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
        
        if(totalUserCount % pagesize==0){        //전체 건수 , pagesize > 
            pagecount = totalUserCount/pagesize;
        }else{
            pagecount = (totalUserCount/pagesize) + 1;
        }
		
		ArrayList<Members_DTO> list = dao.selectAllUser(cpage, pagesize);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("cpage", cpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("list", list);
        request.setAttribute("totalUserCount", totalUserCount);
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/memberManagement.jsp");
  
		return forward;
	}

}
