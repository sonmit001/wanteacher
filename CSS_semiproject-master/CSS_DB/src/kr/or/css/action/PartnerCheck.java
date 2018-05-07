package kr.or.css.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Partner_DAO;
import kr.or.css.dto.Content_DTO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Partner_DTO;
import net.sf.json.JSONArray;

public class PartnerCheck implements Action{

   
   
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward =null;
      
      try {
         // 선택 테마 출력
        
          String mypageid = (String)request.getParameter("mypageid");
         Partner_DAO dao = new Partner_DAO();
         System.out.println("mypageid : "+mypageid);
         ArrayList<Partner_DTO> partnerlist = (ArrayList)dao.selectAllPartner(mypageid);
         System.out.println("pch : " + partnerlist);
         
         
         JSONArray jsonlist = JSONArray.fromObject(partnerlist);
         // 요청 결과 저장
         
         System.out.println(jsonlist);
               
            
            
           forward = new ActionForward();
            
            request.setAttribute("jsonarray", jsonlist);
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/view/arraytojson.jsp");
         
         
         
         
         
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      
      
      
      
      
      return forward;
      
   } // end - execute

} // end - class