package kr.or.css.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.css.action.Action;
import kr.or.css.action.ActionForward;
import kr.or.css.dao.Members_DAO;
import kr.or.css.dto.Members_DTO;

public class UserEditok implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null; 
		Members_DTO member = new Members_DTO();
		Members_DAO dao = new Members_DAO();
		 String url="";
	     String msg ="";
		
		 System.out.println("처음");
		 member.setId(request.getParameter("userId"));
		 System.out.println(member.getId());
		 member.setPwd(request.getParameter("pwd"));
		 System.out.println(member.getPwd());
		 member.setNickname(request.getParameter("nickname"));
		 System.out.println(member.getNickname());
		 member.setAge(Integer.parseInt(request.getParameter("age")));
		 System.out.println(member.getAge());
		 member.setGender(request.getParameter("gender"));
		 System.out.println(member.getGender());
		 member.setEmail(request.getParameter("email"));
		 System.out.println(member.getEmail());
		 member.setPartner(request.getParameter("partner"));
		 System.out.println(member.getPartner());
		 member.setRuby(Integer.parseInt(request.getParameter("ruby")));
		 System.out.println(member.getRuby());
		 
		 try {
			 
		 int result = dao.updateUser(member);
		 
		 if(result>0) {
			 msg="true";
			 url="main.jsp";
			
		     	
		
		 }else {
			 msg="false";
			 url="main.jsp";
		 }
		 request.setAttribute("msg",msg);
         request.setAttribute("url",url);
		 }catch(Exception e) {
			
			
		     //메인으로 넘어가기out.print("location.href='MemoList';"); 
		 }
		forward = new ActionForward();
		forward.setRedirect(false);
	    forward.setPath("/WEB-INF/view/useredit.jsp");
	    return forward;
	
	}

}
