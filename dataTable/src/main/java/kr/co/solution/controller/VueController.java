package kr.co.solution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VueController {
	
	@RequestMapping("vueTest")
	public String vueTest() {
		return "vue/vueTest";
	}
}
