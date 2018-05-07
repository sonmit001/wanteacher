package kr.or.css.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.css.dao.ContentImage_DAO;
import kr.or.css.dao.Content_DAO;
import kr.or.css.dto.ContentImage_DTO;
import kr.or.css.dto.Content_DTO;

public class Edit_Ok implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("editok 들어옴!!");
		Content_DTO content = new Content_DTO();
		Content_DAO dao = new Content_DAO();
		ContentImage_DAO imgdao = new ContentImage_DAO();
		
		String savePath = request.getServletContext().getRealPath("upload");
		int size = 1024*1024*15;
		
		 MultipartRequest multi = new MultipartRequest(
	    			request,//기존 사용했던 request 객체 주소
	    			savePath, //실 저장 경로
	    			size,
	    			"UTF-8",
	    			new DefaultFileRenamePolicy()
	    		);
		 	
			content.setTitle(multi.getParameter("title"));
			content.setContent(multi.getParameter("content"));
			content.setExpectedhour(Integer.parseInt(multi.getParameter("EXPECTEDHOUR")));
			content.setThemenum(Integer.parseInt(multi.getParameter("theme")));
			content.setRegionnum(Integer.parseInt(multi.getParameter("regionselect")));
			int contentnum = Integer.parseInt(multi.getParameter("contentnum"));
			System.out.println("contentnum : " + multi.getParameter("contentnum"));
			content.setgood(Integer.parseInt(multi.getParameter("good")));
			System.out.println(multi.getParameter("good"));
			content.setContentnum(contentnum);
			System.out.println("배열로 이름을 받아보자");
			System.out.println(multi.getParameter("deleteimgname"));
			
			if(multi.getParameterValues("deleteimgname") !=null) {
				String[] deleteimgname = multi.getParameterValues("deleteimgname");
			
				for(int i=0; i<deleteimgname.length;i++) {
					System.out.println(deleteimgname[i]);
					int result1 = imgdao.deleteContentImage(contentnum, deleteimgname[i]);
					if(result1>0) {
						System.out.println("이미지 지우기 성공");
					}else {
						System.out.println("이미지 지우기 실패");
					}
				}
			}
			
			int result = dao.updateContent(content);
			//글 수정되는건 이미 확인 끝남
			System.out.println(result);
			if(result>0) {
				//content 수정 update 성공함
				System.out.println("content 수정 update 완료");
				
			/*	ContentImage_DAO imgdao = new ContentImage_DAO();*/
				ContentImage_DTO imgdto = new ContentImage_DTO();
				
				int result2 = 0;
				
				 Enumeration filenames = multi.getFileNames();
				 
				 while(filenames.hasMoreElements()){
					 System.out.println("사진 재 업로드 몇번 되엇니");
				    	String inputname = (String) filenames.nextElement();
				    	String realname = multi.getFilesystemName(inputname);
				    	
				    	System.out.println(realname);
				    	
				    	if(realname!=null) {
				    	imgdto.setContentnum(contentnum);
				    	imgdto.setImage(realname);
				    	imgdto.setTopimage(0);//이미지 이름 배열에서 0번째 인거 뽑아 쓰면 되기 때문에 의미가 없어졌다.
				    	
				    	result2 = imgdao.insertContentImage(imgdto);
				    	}
				   }
				 if(result2>0) {
					 System.out.println("이미지 넣기 성공"); 
				 }
				 
				
			}else{
				System.out.println("content 수정 update 실패");
			}
			
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/contentList.db");		
		
		
		return forward;
	}

}
