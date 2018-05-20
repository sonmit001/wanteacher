package kr.or.bit.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.bit.dao.IndexDao;

@Service("IndexService")
public class IndexService {

	@Autowired
	IndexDao dao;

	public int idck(HashMap<String, String> param) {		
		return dao.idck(param);
	}
	
	public int singup(HashMap<String, String> param) {		
		return dao.singup(param);
	}

	public int loginck(HashMap<String, String> param) {
		return dao.loginck(param);
	}

	public String findid(HashMap<String, String> param) {
		return dao.findid(param);
	}

	public List<HashMap<String,String>> memberlist(HashMap<String, String> param) {
		return dao.memberlist(param);
	}

	public int totalmember(HashMap<String, String> param) {
		return dao.totalmember(param);
	}

	public int memberdelete(HashMap<String, String> param) {
		return dao.memberdelete(param);
		
	}
}
