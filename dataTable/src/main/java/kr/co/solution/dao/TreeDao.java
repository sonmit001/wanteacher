package kr.co.solution.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("TreeDao")
public class TreeDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
		
}
