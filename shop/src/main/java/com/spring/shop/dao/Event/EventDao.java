package com.spring.shop.dao.Event;

import java.util.List;

import com.spring.shop.vo.Event;

public interface EventDao {
	List<Event> selectEventAll();
	void insertEvent(Event event);
	List<Event> selectEventTagFlag();
	void deleteEvent(int eno); 
	List<Event> selectEventAllbyTag();
	void updateEvent(Event event);
	int updateEventTagOn(String tag);
	int updateEventTagOff(String tag);
	List<Event> selectEventTagOn();
	List<Event> selectEventTagFlagOnly();
}
