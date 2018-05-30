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

		System.out.println(param);
		service.linkAdd(param);
		
		int id = service.getmaxid();
		try {
			res.getWriter().println(id);
		} catch (JSONException | IOException e) {			
			e.printStackTrace();
		}
		
	}
	
//	/folderAdd
	
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
		
		List<HashMap<String, String>> list = service.getCategoryList();
		
		for(int i=0; i<list.size(); i++) {
			
			JSONObject jsonObject = new JSONObject();

			String parentid = String.valueOf(list.get(i).get("PARENT_ID"));
			if(parentid.equals("0") ) {
				jsonObject.put("parent", "#");
			}else {
				jsonObject.put("parent", list.get(i).get("PARENT_ID"));
			}
			
			String href =  list.get(i).get("HREF");
			HashMap<String,String> test = new HashMap<>();
			test.put("href", href);
			
			jsonObject.put("id", list.get(i).get("ID"));
			jsonObject.put("text", list.get(i).get("TEXT"));
			jsonObject.put("icon", list.get(i).get("ICON"));
			jsonObject.put("a_attr", test);
			System.out.println(test);
			jsonArray.put(jsonObject);
		}
		try {
			res.getWriter().println(jsonArray);
		} catch (JSONException | IOException e) {			
			e.printStackTrace();
		}
	}
	
	//deleteNode\
	
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
