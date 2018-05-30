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
	
	public int getmaxid() {
		return dao.getmaxid();
	};

	public List<HashMap<String, String>> getCategoryList() {		
		return dao.getCategoryList();
	}

	public int linkAdd(HashMap<String, String> param) {
		return dao.linkAdd(param);
		
	}

	public int updateNodeText(HashMap<String, String> param) {
		return dao.updateNodeText(param);
	}

	public int folderAdd(HashMap<String, String> param) {
		return dao.folderAdd(param);
		
	}

	public int deleteNode(HashMap<String, String> param) {
		return dao.deleteNode(param);
	}
}
