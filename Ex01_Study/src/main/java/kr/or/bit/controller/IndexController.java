package kr.or.bit.controller;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.bit.service.IndexService;
import net.sf.json.JSONArray;

@Controller
public class IndexController {

	@Autowired
	IndexService service;
	
	@RequestMapping("login")
	public String login() {
		return "index/login";
	}
	
	@RequestMapping("loginok")
	public String loginok(HttpServletRequest req) {
		return "index/loginok";
	}
	
	@RequestMapping("findid")
	private void findid(@RequestParam HashMap<String, String> param, HttpServletResponse res) {
		
		res.setCharacterEncoding("UTF-8");
		
		try {
			res.getWriter().println(service.findid(param));
		} catch (IOException e) {			
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("loginck")
	private void logingck(@RequestParam HashMap<String, String> param, HttpServletResponse res) {
		
		res.setCharacterEncoding("UTF-8");
		
		try {
			res.getWriter().println(service.loginck(param));
		} catch (IOException e) {			
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("idck")
	private void idck(HttpServletRequest req, HttpServletResponse res) {
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("id", req.getParameter("id"));
		
		
		
		res.setCharacterEncoding("UTF-8");
		
		try {
			res.getWriter().println(service.idck(param));
		} catch (IOException e) {			
			e.printStackTrace();
		}
	} 
	
/*	view ��
 	@RequestMapping("singup")
	private void singup(@RequestParam HashMap<String, String> param, Model model) {
		model.addAttribute("result", service.singup(param));
	
	return "index/login";
  
  
  */
	
	@RequestMapping("jstree")
	public String jstree(HttpServletRequest req) {
		return "index/jstree";
	}
	
	@RequestMapping("singup")
	private void singup(@RequestParam HashMap<String, String> param, HttpServletResponse res) {
		
		res.setCharacterEncoding("UTF-8");
		
		try {
			res.getWriter().println(service.singup(param));
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	@RequestMapping("memberlist")
	private String memberlist( Model model) {
	/*	List<HashMap<String, String>> list = service.memberlist();s
		model.addAttribute("list", list);*/
		return "index/memberlist";
				
	}
	
	@RequestMapping("memberdelete")
	private void memberdelete(@RequestParam HashMap<String, String> param ,HttpServletResponse res) {
		
		try {
			res.getWriter().println(service.memberdelete(param));
		} catch (IOException e) {			
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("getmemberlist")
	private void getmemberlist(@RequestParam HashMap<String, String> param ,HttpServletResponse res){		
		res.setCharacterEncoding("UTF-8");
	
	JSONArray jsonArray = new JSONArray();
	JSONObject jsonObject = new JSONObject();
	
	List<HashMap<String, String>> list = service.memberlist(param);
	System.out.println("아래 param");
	System.out.println(param.entrySet());
	
	for(int i=0; i<list.size(); i++)
		jsonArray.add(list.get(i));
	
	try {
		res.getWriter().println(jsonObject.put("data", jsonArray));
	} catch (JSONException jsonException) {
		jsonException.printStackTrace();
	} catch (IOException ioExceiption) {			
		ioExceiption.printStackTrace();
	}
		
	}
	
	
}
