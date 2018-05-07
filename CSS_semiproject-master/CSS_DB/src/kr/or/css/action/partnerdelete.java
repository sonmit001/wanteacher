package kr.or.css.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Members_DAO;
import kr.or.css.dto.Members_DTO;
import kr.or.css.dto.Partner_DTO;
import net.sf.json.JSONArray;

public class partnerdelete implements Action{

   
   
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   ActionForward forward =null;
      try {
         // 선택 테마 출력
        
		  String mypageid = (String)request.getSession().getAttribute("id");
          Members_DAO mdao = new Members_DAO();
          Members_DTO mdto = mdao.selectUser(mypageid);
          String candidate = mdto.getPartner();
          if(candidate==null||candidate=="null") {}
          else {
          mdto.setPartner(null);
          mdao.updatemember(mdto);
          mdto=mdao.selectUser(candidate);
          mdto.setPartner(null);
          mdao.updatemember(mdto);
         System.out.println("커플삭제 성공");
          }
         
        
         
         
       
         // 요청 결과 저장
         
         
               
            
            
           forward = new ActionForward();
            
            forward.setRedirect(false);
            forward.setPath("/mypage.db");
         
         
         
               
            
            
         
         
         
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      
      
      
      
      
      return forward;
      
   } // end - execute

} // end - class