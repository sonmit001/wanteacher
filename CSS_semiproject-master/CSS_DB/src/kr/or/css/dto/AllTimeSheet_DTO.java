package kr.or.css.dto;

import java.sql.Date;
import java.util.ArrayList;

public class AllTimeSheet_DTO {
	private String id;
	private String day;
	private ArrayList<TimeSheetAndContent_DTO> timesheetandcontent_dtolist;
	
	public AllTimeSheet_DTO() {
		super();
	}

	public AllTimeSheet_DTO(String id, String day, ArrayList<TimeSheetAndContent_DTO> timesheetandcontent_dtolist) {
		super();
		this.id = id;
		this.day = day;
		this.timesheetandcontent_dtolist = timesheetandcontent_dtolist;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public ArrayList<TimeSheetAndContent_DTO> getTimesheetandcontent_dtolist() {
		return timesheetandcontent_dtolist;
	}

	public void setTimesheetandcontent_dtolist(ArrayList<TimeSheetAndContent_DTO> timesheetandcontent_dtolist) {
		this.timesheetandcontent_dtolist = timesheetandcontent_dtolist;
	}
	
}
