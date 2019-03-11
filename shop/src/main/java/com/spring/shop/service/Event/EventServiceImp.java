package com.spring.shop.service.Event;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Event.EventDao;
import com.spring.shop.vo.Event;

@Service("EventService")
public class EventServiceImp implements EventService{

	@Inject
	private EventDao eventDao;
	
	@Override
	public List<Event> selectEventAll() {
		return eventDao.selectEventAll();
	}

	@Override
	public void insertEvent(Event event) {
		eventDao.insertEvent(event);
	}

	@Override
	public List<Event> selectEventTagFlag() {
		return eventDao.selectEventTagFlag();
	}

}
