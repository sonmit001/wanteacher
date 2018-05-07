package kr.or.css.action;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import kr.or.css.action.Action;
import kr.or.css.action.ActionForward;
import kr.or.css.dao.Members_DAO;
import kr.or.css.dto.Members_DTO;

public class InsertMember implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      ActionForward forward =null;
      System.out.println("insertmember");
      String id = request.getParameter("id");
      System.out.println(id);
      String pwd = request.getParameter("pwd");
      System.out.println(pwd);
      String nickname = request.getParameter("nickname");
      System.out.println(nickname);
      int age = Integer.parseInt(request.getParameter("age"));
      System.out.println(age);
      String gender = request.getParameter("gender");
      System.out.println(gender);
      String email = request.getParameter("email");
      System.out.println(email);
      String partner = request.getParameter("partner");
      System.out.println(partner);
      
      
      Members_DTO user =null;
      response.setContentType("text/html;charset=UTF-8");
     
         int ruby = 0;
         Members_DAO dao = new Members_DAO();
         user =new Members_DTO(id,pwd,nickname, age, gender, email, partner, ruby);
         int result = dao.insertUser(user);
         System.out.println("result?"+result);
         String msg ="";
         String url ="";
         
         if(result>0){
        	 System.out.println("리썰트 값이 들어오냐?");
             //이걸해줘야 한글안깨짐
            msg = "등록성공";
            url="login.db";
         }else {
            msg = "등록실패";
            url ="loginform.db";
         }
         request.setAttribute("msg", msg);
         request.setAttribute("url", url);
         request.setAttribute("id", id);
         request.setAttribute("pwd", pwd);
     
      forward=new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/WEB-INF/view/joinok.jsp");
      return forward;
   }

}