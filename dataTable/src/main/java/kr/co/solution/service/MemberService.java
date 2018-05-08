package kr.co.solution.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.solution.dao.MemberDao;

@Service("MemberService")
public class MemberService {
	
	@Autowired
	MemberDao dao;

	public List<HashMap<String, String>> getMemberList() {		
		return dao.getMemberList();
	}
}
	