package kr.or.css.action;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.action.Action;
import kr.or.css.action.ActionForward;
import kr.or.css.dao.Members_DAO;

public class EmailCheck implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = null;
      String emailcheck =null;
      String email = request.getParameter("email");
      try {
         Members_DAO dao = new Members_DAO();
         emailcheck=dao.checkByemail(email);
         if(emailcheck.equals("true")) {
            request.setAttribute("emailcheck", emailcheck);
         }
         else {
        	
        	request.setAttribute("emailcheck", emailcheck);
        	
         }
         
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      forward=new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/WEB-INF/view/emailcheck.jsp");
      return forward;
   }

}