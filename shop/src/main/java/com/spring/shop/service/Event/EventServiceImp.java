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

	@Override
	public void deleteEvent(int eno) {
		eventDao.deleteEvent(eno);
	}

	@Override
	public List<Event> selectEventAllbyTag() {
		return eventDao.selectEventAllbyTag();
	}

	@Override
	public void updateEvent(Event event) {
		eventDao.updateEvent(event);
	}

	@Override
	public int updateEventTagOn(String tag) {
		return eventDao.updateEventTagOn(tag);
	}

	@Override
	public int updateEventTagOff(String tag) {
		return eventDao.updateEventTagOff(tag);
	}

	@Override
	public List<Event> selectEventTagOn() {
		return eventDao.selectEventTagOn();
	}

	@Override
	public List<Event> selectEventTagFlagOnly() {
		return eventDao.selectEventTagFlagOnly();
	}

}
