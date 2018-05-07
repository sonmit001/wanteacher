package kr.or.css.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.ContentImage_DAO;
import kr.or.css.dao.Content_DAO;
import kr.or.css.dto.ContentImage_DTO;
import kr.or.css.dto.Content_DTO;

public class Editing implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("editing action 들어옴 !!");
		Content_DTO contentdto = new Content_DTO();
		Content_DAO dao = new Content_DAO();
		ContentImage_DAO imgdao = new ContentImage_DAO();
		ArrayList<String> imagelist = null;
		
		int contentnum = Integer.parseInt(request.getParameter("contentnum"));
		int cp = Integer.parseInt(request.getParameter("cp"));
		int ps = Integer.parseInt(request.getParameter("ps"));
	
		contentdto = dao.selectContent(contentnum);
		imagelist = imgdao.selectAllContentImage(contentnum);
		System.out.println(imagelist.size()); //이미지를 총 5개만 넣기 위해서 이미지 갯수를 받아온다.
		
		//input file 넣은 갯수 정하기
		int inpuallow = 5-imagelist.size();
		System.out.println("버튼 허용 수");
		System.out.println(inpuallow);
		request.setAttribute("imgnamelist", imagelist );
		request.setAttribute("contentdto", contentdto);
		request.setAttribute("cp", cp);
		request.setAttribute("ps", ps);
		request.setAttribute("inpuallow", inpuallow);
		System.out.println("글 번호 확인 : "+contentnum);
		System.out.println(contentdto);
		System.out.println(imagelist);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/view/ContentEdit.jsp");

		return forward;
	}

}
