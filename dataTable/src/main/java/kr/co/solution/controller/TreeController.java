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
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.solution.service.TreeService;

@Controller
public class TreeController {
	
	@Autowired
	TreeService service;
	
	@RequestMapping("treeView")
	public String treeView() {
		return "jstree/treeView";
	}
	
	@RequestMapping("getCategoryList")
	public void getCategoryList(HttpServletResponse res) {
		res.setCharacterEncoding("UTF-8");
		
		JSONArray jsonArray = new JSONArray();	
		
		List<HashMap<String, Object>> list = service.getCategoryList();
		
		for(int i=0; i<list.size(); i++) {
			JSONObject jsonObject = new JSONObject();
			
			jsonObject.put("id", list.get(i).get("ID").toString());
			
			if(list.get(i).get("PARENT_ID").toString().equals("0")) {
				jsonObject.put("parent", "#");
			}else {
				jsonObject.put("parent", list.get(i).get("PARENT_ID"));
			}
			
			jsonObject.put("text", list.get(i).get("TEXT"));
			jsonObject.put("icon", list.get(i).get("ICON"));
			jsonObject.put("href", list.get(i).get("HREF"));
			jsonObject.put("sharing", list.get(i).get("SHARING"));
			
			jsonArray.put(jsonObject);
		}
		try {
			res.getWriter().println(jsonArray);
		} catch (JSONException | IOException e) {			
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updateNodeText")
	public void updateNodeText(@RequestParam HashMap<String, String> param, HttpServletResponse res) {		
		int result = service.updateNodeText(param);
		
		try {
			res.getWriter().println(result);
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
}
