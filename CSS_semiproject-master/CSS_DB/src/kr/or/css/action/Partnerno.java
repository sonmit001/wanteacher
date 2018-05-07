package kr.or.css.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Partner_DAO;
import kr.or.css.dto.Partner_DTO;

public class Partnerno implements Action{

	
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null;
		
		try {
			// 선택 테마 출력
		  
			 String candidate = (String)request.getParameter("candidate");
			 String mypid = (String)request.getParameter("mypageid");
			Partner_DAO pdao = new Partner_DAO();
			Partner_DTO pdto = new Partner_DTO(mypid,candidate);
			pdao.deletePartner(pdto);
			
			
					
            
            
           forward = new ActionForward();
            
            forward.setRedirect(false);
            forward.setPath("mypage.db?myid="+mypid);
			
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		
		
		
		return forward;
		
	} // end - execute

} // end - class
