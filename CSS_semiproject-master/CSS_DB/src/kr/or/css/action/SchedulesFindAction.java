package kr.or.css.action;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.css.dao.Content_DAO;
import kr.or.css.dao.Point_DAO;
import kr.or.css.dao.TimeSheet_DAO;
import kr.or.css.dto.Content_Image_DTO;
import kr.or.css.dto.Point_DTO;
import kr.or.css.dto.TimeSheetAndContent_DTO;
import net.sf.json.JSONArray;

public class SchedulesFindAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
		
		String userid = (String) request.getParameter("userid");
		String date = (String) request.getParameter("day");
		
		TimeSheet_DAO dao = new TimeSheet_DAO();
		ArrayList<TimeSheetAndContent_DTO> dtolist = new ArrayList<TimeSheetAndContent_DTO>();
		
		// 해당 유저의 해당 날짜 일정이 9시 -> 24시 순으로 담긴 일정표가 넘어 온다
		dtolist = dao.selectAllTimeSheet(userid, date);
		
		JSONArray jsonlist = JSONArray.fromObject(dtolist);
		request.setAttribute("jsonarray", jsonlist);
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
        forward.setPath("/WEB-INF/view/arraytojson.jsp");
			
		return forward;
		
	} // end - execute

} // end - class
