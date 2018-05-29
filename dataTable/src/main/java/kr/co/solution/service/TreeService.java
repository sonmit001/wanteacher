package kr.co.solution.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.solution.dao.TreeDao;

@Service("TreeService")
public class TreeService {
	
	@Autowired
	TreeDao dao;

	public List<HashMap<String, Object>> getCategoryList() {		
		return dao.getCategoryList();
	}

	public int updateNodeText(HashMap<String, String> param) {
		return dao.updateNodeText(param);
	}
}
