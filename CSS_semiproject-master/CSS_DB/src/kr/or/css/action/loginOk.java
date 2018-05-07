package kr.or.css.action;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.action.Action;
import kr.or.css.action.ActionForward;
import kr.or.css.dao.Members_DAO;
import kr.or.css.dto.Members_DTO;

public class loginOk implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      ActionForward forward =null;
      
      Members_DTO dto =null;
      String ck=null;
      String id=request.getParameter("id");
      String pwd=request.getParameter("pwd");
      String partner = request.getParameter("partner");
      String remember =request.getParameter("remember");
      Cookie cookie= null;
      String url="";
      String msg ="";
      Members_DAO dao = new Members_DAO();
      try {
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         ck= (String) dao.Login(id, pwd);
         //"localStorage.setItem('id','"+ id +"');"
			if (ck.equals("true")) {
				msg = "로그인 성공";
				url = "main.jsp";
				request.setAttribute("id", id);

				if (remember != null && remember.trim().equals("on")) {
					cookie = new Cookie("id", id);
					cookie.setMaxAge(60 * 60 * 24 * 365);
					response.addCookie(cookie);
				} else {
					cookie = new Cookie("id", null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			} else {
				System.out.println(11111111);
				msg = "로그인 실패";
				url = "login.db";
			}

       
         request.setAttribute("msg",msg);
         request.setAttribute("url",url);
      } catch (Exception e) {
         if(ck.equals("false")) {
         msg="로그인 실패";
         url="login.db";
         }
      }
      forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/WEB-INF/view/loginok.jsp");
      
      return forward;
   }
}