package kr.or.css.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Members_DAO;
import kr.or.css.dao.Partner_DAO;
import kr.or.css.dto.Members_DTO;
import kr.or.css.dto.Partner_DTO;

public class PartnerAdd implements Action{

	
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null;
		
		try {
			// 선택 테마 출력
		  
			 String candidate = (String)request.getParameter("candidate");
				String mypid = (String)request.getSession().getAttribute("id");
			Members_DAO dao = new Members_DAO();
			Partner_DAO pdao = new Partner_DAO();
			
			
			if(dao.selectPartner(mypid)==null) {
			Partner_DTO pdto = new Partner_DTO(mypid,candidate);
			System.out.println("candidate : "+candidate+"mypid"+mypid);
			
			
			//user에 파트너 등록
			Members_DTO dto = dao.selectUser(mypid);
			System.out.println("selectUser");
			dto.setPartner(candidate);
			System.out.println("setPartner");
			dao.updatemember(dto);
			
			//파트너에 유저 등록
			dto = dao.selectUser(candidate);
			dto.setPartner(mypid);
			dao.updatemember(dto);
			
			
			
			
			
			System.out.println("updateUser");			
			pdao.deletePartner(pdto);
			System.out.println("deletePartner");
			}else {
				System.out.println("파트너 있음");
			}
			Members_DTO user = dao.selectUser(mypid);
			
			 request.setAttribute("mypid", user.getId());
	            request.setAttribute("mypwd", user.getPwd());
	            request.setAttribute("mynickname", user.getNickname());
	            request.setAttribute("myage", user.getAge());
	            request.setAttribute("mygender", user.getGender());
	            request.setAttribute("myemail", user.getEmail());
	            request.setAttribute("partner", user.getPartner());
	            request.setAttribute("myruby", user.getRuby());
	           
	            System.out.println("mypage partner : "+user.getPartner());

	            forward = new ActionForward();
	            forward.setRedirect(false);
	            forward.setPath("/WEB-INF/view/mypage.jsp");
						
            
            
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		
		
		
		return forward;
		
	} // end - execute

} // end - class
