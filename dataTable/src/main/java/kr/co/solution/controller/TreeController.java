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
	
	@RequestMapping("linkAdd")
	public void linkAdd(HttpServletResponse res , @RequestParam HashMap<String, String> param) {
		res.setCharacterEncoding("UTF-8");
		service.linkAdd(param);
		
		int id = service.getmaxid();
		try {
			res.getWriter().println(id);
		} catch (JSONException | IOException e) {			
			e.printStackTrace();
		}
	}
	
	@RequestMapping("folderAdd")
	public void folderAdd(HttpServletResponse res , @RequestParam HashMap<String, String> param) {
		res.setCharacterEncoding("UTF-8");

		System.out.println(param);
		service.folderAdd(param);
		
		int id = service.getmaxid();
		try {
			res.getWriter().println(id);
		} catch (JSONException | IOException e) {			
			e.printStackTrace();
		}		
	}
	
	@RequestMapping("getCategoryList")
	public void getCategoryList(HttpServletResponse res) {
		res.setCharacterEncoding("UTF-8");
		
		JSONArray jsonArray = new JSONArray();	
		
		List<HashMap<String, Object>> list = service.getCategoryList();
		
		if(list.size() == 0) { //데이터 없을 시
			JSONObject jsonObject = new JSONObject();
			
			int result = service.insertRootFolder(); 
			
			if(result == 1) {
				jsonObject.put("id", "1");
				jsonObject.put("parent", "#");				
				jsonObject.put("text", "ROOT");
				jsonObject.put("icon", "");
				jsonObject.put("href", "");
				jsonObject.put("sharing", "");
				
				jsonArray.put(jsonObject);
			}			
		}else {
			for(int i=0; i<list.size(); i++) {			
				JSONObject jsonObject = new JSONObject();
				
				jsonObject.put("id", list.get(i).get("ID"));
				
				if(list.get(i).get("PARENT_ID").toString().equals("0")) 
					jsonObject.put("parent", "#");
				else 
					jsonObject.put("parent", list.get(i).get("PARENT_ID").toString());
				
				jsonObject.put("text", list.get(i).get("TEXT").toString());
				jsonObject.put("icon", list.get(i).get("ICON") == null ? "" : list.get(i).get("ICON").toString());
				jsonObject.put("href", list.get(i).get("HREF") == null ? "" : list.get(i).get("HREF").toString());
				jsonObject.put("sharing", list.get(i).get("SHARING") == null ? "" : list.get(i).get("SHARING"));
		
				jsonArray.put(jsonObject);
			}		
		}
		
		try {
			res.getWriter().println(jsonArray);
		} catch (JSONException | IOException e) {			
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deleteNode")
	public void deleteNode(@RequestParam HashMap<String, String> param, HttpServletResponse res) {		
		int result = service.deleteNode(param);
		
		try {
			res.getWriter().println(result);
		} catch (IOException e) {			
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
