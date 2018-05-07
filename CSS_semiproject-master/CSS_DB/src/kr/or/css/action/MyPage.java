package kr.or.css.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Members_DAO;
import kr.or.css.dto.Members_DTO;

public class MyPage implements Action{

	
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null;
		
		try {
			// 선택 테마 출력
			Members_DAO dao = new Members_DAO();
			String id = (String)request.getSession().getAttribute("id");
			Members_DTO user = dao.selectUser(id);
			System.out.println(id);
			// 요청 결과 저장
			
			// view 페이지 설정
			/*RequestDispatcher dis = request.getRequestDispatcher("tables.jsp");
			dis.forward(request, response);*/
					
            
            
           forward = new ActionForward();
            
            request.setAttribute("mypid", user.getId());
            request.setAttribute("mypwd", user.getPwd());
            request.setAttribute("mynickname", user.getNickname());
            request.setAttribute("myage", user.getAge());
            request.setAttribute("mygender", user.getGender());
            request.setAttribute("myemail", user.getEmail());
            request.setAttribute("partner", user.getPartner());
            request.setAttribute("myruby", user.getRuby());
           
            System.out.println("mypage partner : "+user.getPartner());
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/view/mypage.jsp");
			
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		
		
		
		return forward;
		
	} // end - execute

} // end - class
