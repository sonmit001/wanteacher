package kr.or.css.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Members_DAO;
import kr.or.css.dao.Partner_DAO;
import kr.or.css.dto.Partner_DTO;

public class partnersend implements Action{

	
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null;
		PrintWriter out = response.getWriter();
		String ch = "false";
		try {
			// 선택 테마 출력
		  
			 String partnerid = (String)request.getParameter("partnerid");
			 String id = (String)request.getSession().getAttribute("id");
			Members_DAO dao = new Members_DAO();
			Partner_DAO pdao = new Partner_DAO();
			Partner_DTO pdto = new Partner_DTO(id, partnerid);
			System.out.println("myid : "+id+"partnerid : "+partnerid);
			System.out.println(pdao.ispartnersend(pdto));
			
			if(pdao.ispartnersend(pdto) && dao.ismember(partnerid)) {//상대가 존재하는 맴버인지 파트너 초대를 보낸적이 있는지
				System.out.println("초대 보냄");
				pdao.insertPartner(pdto);
				ch = "true";
			}else {
				System.out.println("초대중복으로 못보냄");
				
			}
			System.out.println(ch);
			
		/*			
			 forward = new ActionForward();
	            
	            forward.setRedirect(false);
	            forward.setPath("mypage.db?myid="+id);
			*/
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		out.println(ch);
		

		return null;
		
	} // end - execute

} // end - class
