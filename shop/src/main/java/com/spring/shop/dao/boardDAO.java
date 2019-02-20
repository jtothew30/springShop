package com.spring.shop.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Board;

@Repository
public class boardDAO {
	private Logger logger = LoggerFactory.getLogger(boardDAO.class);
	private final String NS = "";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Board> selectPaging() {
		logger.info("selectPaging : ");
		return sqlSession.selectList(NS+"selectPaging");
	}
}
