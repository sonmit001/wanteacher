package kr.co.solution.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.solution.dao.TreeDao;

@Service("TreeService")
public class TreeService {
	
	@Autowired
	TreeDao dao;
}
