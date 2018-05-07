package kr.or.css.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.css.dao.ContentImage_DAO;
import kr.or.css.dao.Content_DAO;
import kr.or.css.dto.ContentImage_DTO;
import kr.or.css.dto.Content_DTO;

public class Write_Ok implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Content_DTO content = new Content_DTO();
		Content_DAO dao = new Content_DAO();
		System.out.println("글입력1");
		
		
		String savePath = request.getServletContext().getRealPath("upload");
		System.out.println(savePath);
		int size = 1024*1024*15;
		
		 MultipartRequest multi = new MultipartRequest(
	    			request,//기존 사용했던 request 객체 주소
	    			savePath, //실 저장 경로
	    			size,
	    			"UTF-8",
	    			new DefaultFileRenamePolicy()
	    		);
		 
		 System.out.println("title 들어오나 멀티팟");
		
		System.out.println(multi.getParameter("EXPECTEDHOUR"));
		content.setTitle(multi.getParameter("title"));
		System.out.println(multi.getParameter("title"));
		
		
		
		content.setContent(multi.getParameter("content"));
		System.out.println(multi.getParameter("content"));
		content.setExpectedhour(Integer.parseInt(multi.getParameter("EXPECTEDHOUR")));
		System.out.println(multi.getParameter("EXPECTEDHOUR"));
		content.setgood(0);
		content.setThemenum(Integer.parseInt(multi.getParameter("theme")));
		System.out.println(multi.getParameter("theme"));
		content.setRegionnum(Integer.parseInt(multi.getParameter("regionselect")));
		System.out.println(multi.getParameter("regionselect"));
		
		int result = dao.insertContent(content);
		//result -1이면 업로드 실패
		//0이면 글 업로드 성공
		//0이상이면 contentnum return 된 것이다.
		
		if(result>0) {
		System.out.println("result >0 들어옴");
		
		ContentImage_DAO imgdao = new ContentImage_DAO();
		ContentImage_DTO imgdto = new ContentImage_DTO();
		
		int result2 = 0;
		
		 Enumeration filenames = multi.getFileNames();
		 
		 while(filenames.hasMoreElements()){
			 System.out.println("반복 수 확인하기");
		    	String inputname = (String) filenames.nextElement();
		    	String realname = multi.getFilesystemName(inputname);
		    	
		    	if(realname!=null) {
		    	imgdto.setContentnum(result);
		    	imgdto.setImage(realname);
		    	imgdto.setTopimage(0);//이미지 이름 배열에서 0번째 인거 뽑아 쓰면 되기 때문에 의미가 없어졌다.
		    	
		    	result2 = imgdao.insertContentImage(imgdto);
		    	}
		   }
		 
		}
		 
		 
		if(result>-1) {
			System.out.println("글 입력 성공");
			System.out.println("글번호 " + result);
		}
		if(result>0) {
			System.out.println("이미지 넣기 성공");
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/contentList.db");		
		
		return forward;
	}

}
