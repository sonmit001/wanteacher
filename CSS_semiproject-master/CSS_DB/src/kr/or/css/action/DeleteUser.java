package kr.or.css.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Good_DAO;
import kr.or.css.dao.Members_DAO;
import kr.or.css.dao.Partner_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dao.Review_DAO;
import kr.or.css.dao.Schedule_DAO;
import kr.or.css.dao.TimeSheet_DAO;
import kr.or.css.dto.Members_DTO;

public class DeleteUser implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Members_DAO dao = new Members_DAO();
		Review_DAO reviewdao = new Review_DAO();
		Point_DAO pointdao = new Point_DAO();
		Partner_DAO partnerdao = new Partner_DAO();
		TimeSheet_DAO timedao = new TimeSheet_DAO();
		Schedule_DAO scheduledao = new Schedule_DAO();
		Good_DAO gooddao = new Good_DAO();
		
		String userid = request.getParameter("userid");
		System.out.println("userid: " + userid);
		
		int row = 0;
		
		row = reviewdao.deleteReview(userid);
		row = pointdao.deletePoint(userid);
		row = partnerdao.deletePartner(userid);
		row = timedao.deleteTimeSheet(userid);
		row = scheduledao.deleteSchedule(userid);
		row = gooddao.deleteGood(userid);
		
		row = dao.updateUser(userid);
		row = dao.deleteUser(userid);
		
		
		
		
		
		
		
		
		
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
		
		request.setAttribute("cpage", cpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("list", list);
        request.setAttribute("totalUserCount", totalUserCount);
        
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/memberManagement.jsp");
  
		return forward;
	}

}
