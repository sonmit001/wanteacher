package kr.co.solution.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("TreeDao")
public class TreeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<HashMap<String, Object>> getCategoryList() {		
		return sqlSessionTemplate.selectList("treeMapper.getCategoryList");
	}

	public int updateNodeText(HashMap<String, String> param) {
		return sqlSessionTemplate.update("treeMapper.updateNodeText", param);
	}		
}
