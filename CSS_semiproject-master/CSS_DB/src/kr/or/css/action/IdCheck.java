package kr.or.css.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.action.Action;
import kr.or.css.action.ActionForward;
import kr.or.css.dao.Members_DAO;

public class IdCheck implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = null;
      String idcheck=null;
      String id = request.getParameter("id");
      System.out.println("id"+id);
      PrintWriter out = response.getWriter();
      try {
         Members_DAO dao = new Members_DAO();
         idcheck = dao.checkById(id);
         System.out.println("idcheck.java"+idcheck);
         if(idcheck.equals("true")) {
        	 System.out.println("idcheck true"+idcheck);
            request.setAttribute("idcheck", idcheck);
            
        }else {
        	System.out.println("idcheck false"+idcheck);
        	request.setAttribute("idcheck", idcheck);
        	
         }
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/WEB-INF/view/idcheck.jsp");
      return forward;
   }

}