package kr.or.css.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.action.Action;
import kr.or.css.action.ActionForward;
import kr.or.css.dao.Members_DAO;

public class NickName implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = null;
      String namecheck =null;
      String nickname = request.getParameter("nickname");
      try {
         Members_DAO dao = new Members_DAO();
         namecheck=dao.checkByname(nickname);
         if(namecheck.equals("true")) {
            request.setAttribute("nickname", namecheck);
         }else {
        	 request.setAttribute("nickname", namecheck);
         }
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      forward=new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/WEB-INF/view/nickname.jsp");
      return forward;
   }

}