package kr.or.css.action;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dao.Schedule_DAO;
import kr.or.css.dao.TimeSheet_DAO;
import kr.or.css.dto.AllTimeSheet_DTO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Point_DTO;
import kr.or.css.dto.Schedule_DTO;
import kr.or.css.dto.TimeSheetAndContent_DTO;
import net.sf.json.JSONArray;

public class ShowMyTimetablesAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
		
		String userid = (String) request.getParameter("userid");
		String month = (String) request.getParameter("month");
		
		// 타겟 month 에 해당하는 해당 유저의 모든 스케줄 날짜들 가져옴
		ArrayList<Schedule_DTO> schedulelist = new ArrayList<Schedule_DTO>();
		Schedule_DAO scheduledao = new Schedule_DAO();
		schedulelist = scheduledao.selectAllSchedule(userid, month);
		
		// 가져온 스케줄 날짜들 저장
		ArrayList<String> ckdays = new ArrayList();
		for(int i = 0; i < schedulelist.size(); i++) {
			ckdays.add(schedulelist.get(i).getDay());
		}
		
		/////////////////////////////////////////////////////////////////////////////////////////////////여기까지 출력확인
		
		TimeSheet_DAO timesheet_dao = new TimeSheet_DAO();
		Schedule_DAO schedule_dao = new Schedule_DAO();
		ArrayList<AllTimeSheet_DTO> alltimesheetlist = new ArrayList<AllTimeSheet_DTO>();
		
		// 유저아이디, 날짜로 timesheet + content정보 접근
		// 날짜 기준으로 회전
		for(int i = 0; i < ckdays.size(); i++) {
		ArrayList<TimeSheetAndContent_DTO> timesheetandcontent_dtolist = new ArrayList<TimeSheetAndContent_DTO>();
		System.out.println("테스트 날짜 출력 : " + ckdays.get(i).substring(0, 10));
		timesheetandcontent_dtolist = timesheet_dao.selectAllTimeSheet(userid, ckdays.get(i).substring(0, 10));
		
			int ckcontentnum = 0;
			// 해당 날짜의 모든 일정 돌면서 contentnum all 0 여부 확인
			for(int j = 0; j < timesheetandcontent_dtolist.size(); j++) {
				
				// 모두 0 이었다면 ckcontentnum은 0이다
				ckcontentnum += timesheetandcontent_dtolist.get(j).getContentnum();
			}
			
				// 빈 일정이라는 뜻(하루 24시간 내 어떤 시각에도 일정이 없음)
				if(ckcontentnum == 0) {
					
					// 먼저 timesheet 삭제
					int result = timesheet_dao.deleteAllTimeSheet(userid, ckdays.get(i).substring(0, 10));
					
					// 그 뒤 schedules 삭제
					int result2 = schedule_dao.deleteSchedule2(ckdays.get(i).substring(0, 10), userid);
					
					if((result !=0)&&(result2!=0)) {
						System.out.println(ckdays.get(i) + "일의 일정을 삭제완료!");
					}
				}
				
				// 일정이 하루라도 있다는 것으로 전송을 해줘야 할 데이터
				else {
					AllTimeSheet_DTO alltimesheetdto = new AllTimeSheet_DTO();
					alltimesheetdto.setDay(ckdays.get(i).substring(0, 10));
					alltimesheetdto.setId(userid);
					alltimesheetdto.setTimesheetandcontent_dtolist(timesheetandcontent_dtolist);
					alltimesheetlist.add(alltimesheetdto);
				}
		
		}
		
		JSONArray jsonlist = JSONArray.fromObject(alltimesheetlist);
		request.setAttribute("jsonarray", jsonlist);
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
        forward.setPath("/WEB-INF/view/arraytojson.jsp");
			
		return forward;
		
	} // end - execute

} // end - class

// 여기부터 서버단 처리---------------------------------------------------------------------
// 일정표에서 date에 원하는 month만 잡아서 모두 뽑은 뒤

// 1) 뽑은 해당 월의 날짜들을 모두 검색해서 contentnum이 모두 0인 경우에는
// timesheet에서 해당 날짜 테이블 삭제 -> schedules에서 해당 날짜 삭제

// 2) 뽑은 해당 월의 날짜들을 모두 검색해서 contentnum이 하나라도 0이 아닌 경우에는
// timesheet_dto를 배열에 담아서 비동기 rdata로 전송한다
// ---------------------------------------------------------------------여기까지 서버단 처리


// 여기부터 클라이언트단 처리---------------------------------------------------------------
// order by hour asc 해서 만들어서 body 내 12사이즈인 컬럼에 4사이즈로 append
// 참고: append 구문은 zzim.jsp의 thunnail 붙이는 코드 + 일정표 붙이는 코드 동시 참고
// ----------------------------------------------------------------여기까지 클라이언트단 처리








