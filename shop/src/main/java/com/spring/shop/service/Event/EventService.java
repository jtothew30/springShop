package com.spring.shop.service.Event;

import java.util.List;

import com.spring.shop.vo.Event;

public interface EventService {

	List<Event> selectEventAll();

	void insertEvent(Event event);

	List<Event> selectEventTagFlag();	
}
