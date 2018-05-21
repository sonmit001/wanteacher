package kr.co.solution.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.solution.service.TreeService;

@Controller
public class TreeController {
	
	@Autowired
	TreeService service;
}
