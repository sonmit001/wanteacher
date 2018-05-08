package kr.co.solution.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.solution.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("memberlist")
	public String memberlist() {
		return "member/memberlist";
	}
	
	@RequestMapping("getMemberList")
	public void getMemberList(HttpServletResponse res){
		res.setCharacterEncoding("UTF-8");
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		
		List<HashMap<String, String>> list = service.getMemberList();
		
		for(int i=0; i<list.size(); i++)
			jsonArray.put(list.get(i));
		
		try {
			res.getWriter().println(jsonObject.put("data", jsonArray));
		} catch (JSONException jsonException) {
			jsonException.printStackTrace();
		} catch (IOException ioExceiption) {			
			ioExceiption.printStackTrace();
		}
	}
}
