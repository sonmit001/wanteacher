package kr.or.bit.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("IndexDao")
public class IndexDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int idck(HashMap<String, String> param) {		
		return sqlSessionTemplate.selectOne("memberMapper.idck", param);
	}
	
	public int singup(HashMap<String, String> param) {
		
		
		return sqlSessionTemplate.insert("memberMapper.singup", param);
	}
	
	public List<HashMap<String,String>> memberlist() {
		return sqlSessionTemplate.selectList("memberMapper.memberlist");
/*
	페이징 처리 하기 위한 파라미터 값들 어떻게 보내야하나
*/
	}

	public int loginck(HashMap<String, String> param) {
		return sqlSessionTemplate.selectOne("memberMapper.loginck",param);
	}

	public String findid(HashMap<String, String> param) {
		return sqlSessionTemplate.selectOne("memberMapper.findid",param);
	}

	public int totalmember(HashMap<String, String> param) {
		return sqlSessionTemplate.selectOne("memberMapper.totalmember",param);
	}

	
}
