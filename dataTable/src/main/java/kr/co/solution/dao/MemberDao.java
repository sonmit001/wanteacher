package kr.co.solution.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MemberDao")
public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<HashMap<String, String>> getMemberList() {		
		return sqlSessionTemplate.selectList("memberMapper.getMemberList");
	}
}
