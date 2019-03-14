package com.spring.shop.dao.Event;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Event;

@Repository
public class EventDaoImp implements EventDao{

	private static final String EventMapper = "com.spring.shop.mapper.EventMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(EventDaoImp.class);
	
	@Inject
	private SqlSessionTemplate sqlSession; 
	
	@Override
	public List<Event> selectEventAll() {
		return sqlSession.selectList(EventMapper+".selectEventAll");
	}

	@Override
	public void insertEvent(Event event) {
		sqlSession.insert(EventMapper+".insertEvent",event);		
	}

	@Override
	public List<Event> selectEventTagFlag() {
		return sqlSession.selectList(EventMapper+".selectEventTagFlag");
	}

	@Override
	public void deleteEvent(int eno) {
		sqlSession.delete(EventMapper+".deleteEvent", eno);
	}

	@Override
	public List<Event> selectEventAllbyTag() {
		return sqlSession.selectList(EventMapper+".selectEventAllbyTag");
	}

	@Override
	public void updateEvent(Event event) {
		sqlSession.update(EventMapper+".updateEvent",event);
	}

	@Override
	public int updateEventTagOn(String tag) {
		return sqlSession.update(EventMapper+".updateEventTagOn",tag);
	}

	@Override
	public int updateEventTagOff(String tag) {
		return sqlSession.update(EventMapper+".updateEventTagOff",tag);
	}

	@Override
	public List<Event> selectEventTagOn() {
		return sqlSession.selectList(EventMapper+".selectEventTagOn");
	}
	
	@Override
	public List<Event> selectEventTagFlagOnly() {
		return sqlSession.selectList(EventMapper+".selectEventTagFlagOnly");
	}
}
