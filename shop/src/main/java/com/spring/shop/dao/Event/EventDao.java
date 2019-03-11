package com.spring.shop.dao.Event;

import java.util.List;

import com.spring.shop.vo.Event;

public interface EventDao {
	List<Event> selectEventAll();
	void insertEvent(Event event);
	List<Event> selectEventTagFlag(); 
}
