package kr.or.css.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.action.Action;
import kr.or.css.action.ActionForward;
import kr.or.css.action.ContentDetail;
import kr.or.css.action.ContentFindAction;
import kr.or.css.action.ContentList;
import kr.or.css.action.DeleteContent;
import kr.or.css.action.DeletePointAction;
import kr.or.css.action.DeleteUser;
import kr.or.css.action.FindPartnerAction;
import kr.or.css.action.Good;
import kr.or.css.action.InsertTimetableAction;
import kr.or.css.action.Point;
import kr.or.css.action.Write_Ok;
import kr.or.css.action.zzim2Action;
import kr.or.css.dto.Good_DTO;
import kr.or.css.action.MemberManagement;
import kr.or.css.action.MyPage;
import kr.or.css.action.PartnerAdd;
import kr.or.css.action.PartnerCheck;
import kr.or.css.action.Partnerno;
import kr.or.css.action.PointListAction;

import kr.or.css.action.RegionList;
import kr.or.css.action.RegionSearchList;
import kr.or.css.action.SchedulesFindAction;
import kr.or.css.action.SearchContent;


import kr.or.css.action.SchedulesFindAction;


import kr.or.css.action.SearchUser;
import kr.or.css.action.SelectReview;
import kr.or.css.action.ShowMyTimetablesAction;
import kr.or.css.action.ThemaList;
import kr.or.css.action.Themasearchlist;
import kr.or.css.action.ThemeSelectList;

import kr.or.css.action.Editing;
import kr.or.css.action.Edit_Ok;
import kr.or.css.action.getregionname;
import kr.or.css.action.getthemename;
import kr.or.css.action.EmailCheck;
import kr.or.css.action.getcontent;
import kr.or.css.action.IdCheck;
import kr.or.css.action.InsertMember;
import kr.or.css.action.InsertReview;
import kr.or.css.action.loginOk;
import kr.or.css.action.partnerdelete;
import kr.or.css.action.partnersend;
import kr.or.css.action.UserEditok;
import kr.or.css.action.NickName;

import kr.or.css.action.RegionSelectlist;

@WebServlet("*.db")
public class MasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MasterController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();
		String url_command = RequestURI.substring(ContextPath.length());

		System.out.println(url_command);

		Action action = null;
		ActionForward forward = null;

		///////// 정권/////////
		if (url_command.equals("/pointlist.db")) {

			action = new PointListAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/findpartner.db")) {

			action = new FindPartnerAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/deletepoint.db")) {

			action = new DeletePointAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/contentfind.db")) {
			action = new ContentFindAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/schedulesfind.db")) {
			action = new SchedulesFindAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/inserttimetable.db")) {
			action = new InsertTimetableAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/showmytimetables.db")) {
			action = new ShowMyTimetablesAction();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/zzim2.db")) {
			System.out.println("zzim2");
			action = new zzim2Action();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		////////////////////

		///////// 준수/////////
		if (url_command.equals("/themalist.db")) { // 테마리스트
			System.out.println("themalist.db컨트롤러");
			action = new ThemaList();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/themasearch.db")) { // 테마 검색
			System.out.println("themasearch.db컨트롤러");
			action = new Themasearchlist();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/getthemename.db")) { // 테마 이름
			System.out.println("getthemename.db컨트롤러");
			action = new getthemename();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/regionlist.db")) {// 지역 리스트
			System.out.println("regionlist.db컨트롤러");
			action = new RegionList();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/regionsearch.db")) { // 지역 검색
			System.out.println("regionsearch.db컨트롤러");
			action = new RegionSearchList();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/getregionname.db")) {// 지역 이름
			System.out.println("getregionname.db컨트롤러");
			action = new getregionname();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/regionselect.db")) {// 지역 셀렉트
			System.out.println("regionselect.db컨트롤러");
			action = new RegionSelectlist();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/themeselect.db")) {// 테마 셀렉트
			System.out.println("themeselect.db컨트롤러");
			action = new ThemeSelectList();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/mypage.db")) {// 마이페이지 보내기
			System.out.println("mypage.db컨트롤러");
			action = new MyPage();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/partnerlist.db")) {// 커플 검색
			System.out.println("partnerlist.db컨트롤러");
			action = new PartnerCheck();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (url_command.equals("/partneradd.db")) {// 커플 승낙
			System.out.println("partneradd.db컨트롤러");
			action = new PartnerAdd();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/partnerno.db")) {// 커플 거절
			System.out.println("partnerno.db컨트롤러");
			action = new Partnerno();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/partnerdel.db")) {// 커플 삭제
			System.out.println("partnerdel.db컨트롤러");
			action = new partnerdelete();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (url_command.equals("/partnersend.db")) {// 커플 초대
			System.out.println("partnersend.db컨트롤러");
			action = new partnersend();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		////////////////////

		///////// 진광/////////
		if (url_command.equals("/region.db")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/location.jsp");
		}
		if (url_command.equals("/thema.db")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/thema.jsp");
		}
		if (url_command.equals("/loginform.db")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/loginform.jsp");
		}
		if (url_command.equals("/login.db")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/login.jsp");
		}
		if (url_command.equals("/logout.db")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/logout.jsp");
		}
		if (url_command.equals("/contentWrite.db")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/contentWrite.jsp");
		}
		
		if (url_command.equals("/zzim.db")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/zzim.jsp");
		}
		/*


	*/
		
		if (url_command.equals("/schedulemanage.db")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/view/schedulemanage.jsp");
		}
		
		if (url_command.equals("/usereditok.db")) { 
			System.out.println("usereditok.db컨트롤러");
			action = new UserEditok();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if (url_command.equals("/memberInsert.db")) {
			try {
				
				action = new InsertMember();
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (url_command.equals("/MemberInsertOk.db")) {
			try {
				action = new loginOk();
				forward = action.execute(request, response);

				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/idcheck.db")) {
			try {
				action = new IdCheck();
				
				forward = action.execute(request, response);
			} catch (Exception e) {
				
			}
		} else if (url_command.equals("/namecheck.db")) {
			try {
				action = new NickName();
				
				forward = action.execute(request, response);
			} catch (Exception e) {
				
			}
		} else if (url_command.equals("/emailcheck.db")) {
			try {
				action = new EmailCheck();
				
				forward = action.execute(request, response);
			} catch (Exception e) {
				
			}
		} else if (url_command.equals("/loginok.db")) {
			try {
				action = new loginOk();
				
				forward = action.execute(request, response);
			} catch (Exception e) {
				
			}
		} 
		////////////////////

		///////// 명수/////////

		if (url_command.equals("/writeok.db")) {
			action = new Write_Ok();
			try {
				forward = action.execute(request, response);

			} catch (Exception e1) {
				e1.printStackTrace();
			}

		} else if (url_command.equals("/getcontent.db")) {
			action = new getcontent();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(url_command.equals("/contentedit.db")) {
			action = new Editing();
			try {
				forward = action.execute(request, response);
				
			}catch (Exception e) {
			}
		}else if(url_command.equals("/contenteditok.db")) {
			System.out.println("controller");
			action = new Edit_Ok();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
			}
			
		}

		////////////////////

		///////// 희준/////////
		if (url_command.equals("/memberManagement.db")) {
			action = new MemberManagement();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/searchUser.db")) {
			action = new SearchUser();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/deleteUser.db")) {
			action = new DeleteUser();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/contentList.db")) {
			action = new ContentList();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/searchContent.db")) {
			action = new SearchContent();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/deleteContent.db")) {
			action = new DeleteContent();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (url_command.equals("/contentDetail.db")) {

			action = new ContentDetail();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(url_command.equals("/point.db")) {
			
			action = new Point();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(url_command.equals("/good.db")) {
			
			action = new Good();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(url_command.equals("/selectReview.db")) {
			
			action = new SelectReview();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(url_command.equals("/insertreview.db")) {
			
			action = new InsertReview();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		////////////////////

		///////// 진국/////////

		///////////////////////

		if (forward != null) {
			if (forward.isRedirect()) { // true
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}

	}

}
