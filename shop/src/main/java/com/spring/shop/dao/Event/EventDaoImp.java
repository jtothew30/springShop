package com.spring.shop.dao.Event;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Event;

@Repository
public class EventDaoImp implements EventDao{

	private static final String EventMapper = "com.spring.shop.mapper.EventMapper";
	
	@Inject
	private SqlSessionTemplate sqlSession; 
	
	@Override
	public List<Event> selectEventAll() {
		return sqlSession.selectList(EventMapper+".selectEventAll");
	}

	@Override
	public void insertEvent(Event event) {
		sqlSession.insert(EventMapper+".insertEvent");		
	}
}
