package kr.or.css.action;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dao.Schedule_DAO;
import kr.or.css.dao.TimeSheet_DAO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Point_DTO;
import kr.or.css.dto.TimeSheet_DTO;
import net.sf.json.JSONArray;

public class InsertTimetableAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
		String userid = (String) request.getParameter("userid");
		String day = (String) request.getParameter("day");
		String[] contentnums = request.getParameterValues("timetable[]");
		
		for(String str : contentnums) {
			System.out.println(str);
		}
		
		// SCEDULES 테이블에 기존재여부 파악
		Schedule_DAO schedao = new Schedule_DAO();
		int scheduleck = schedao.selectSchedule(day, userid);
		System.out.println("기존재여부 : " + scheduleck);
		
		if(scheduleck == 0) {
		// SCEDULES 테이블에 해당 유저-해당 날짜 row 생성
		int result = schedao.insertSchedule(day, userid);
		System.out.println("row 생성여부 : " + scheduleck);
		}
		
		// 일단 해당 날짜의 유저 일정 모두 삭제
		TimeSheet_DAO timesheetdao = new TimeSheet_DAO();
		int result2 = timesheetdao.deleteAllTimeSheet(userid, day);
		if(result2 > 0) {
			System.out.println("일단 해당 날짜 ~ : " + result2);
		}
		
		
		int result3 = 0;
		// 반복 돌면서 9시 ~ 24시의 모든 일정에 컨텐츠 넘버 부여
		for(int i =0; i <16; i++) {
			System.out.println("con num : " + Integer.parseInt(contentnums[i]));
			result3 += timesheetdao.insertTimeSheet(i+9, userid, day, Integer.parseInt(contentnums[i]));
		}
		ArrayList results = new ArrayList();
		results.add(result3);
		
		JSONArray jsonlist = JSONArray.fromObject(results);
		request.setAttribute("jsonarray", jsonlist);
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
        forward.setPath("/WEB-INF/view/arraytojson.jsp");
			
		return forward;
		
	} // end - execute

} // end - class
