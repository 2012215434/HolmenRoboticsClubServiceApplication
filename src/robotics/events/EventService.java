package robotics.events;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class EventService {
	@Resource
	private EventDao eventDao;
	
	public ArrayList<Events> findAllEvents(Date start,Date end) {
		return eventDao.findAllEvents(start,end);
	}

	public void updateEvents(Events e){
		eventDao.updateEvents(e);
	}
	public Events findEventsByID(int id){
		Events e = new Events();
		e.setEventID(id);
		return eventDao.findEventsByID(e);
	}
	public void deleteEvents(Events e){
		eventDao.updateEvents(e);
	}
	public boolean addEvents(Events e, String userType) {
		if (userType.equals("admin")&&e.getType().equals("class")) {
			e.setApprovedstatus(true);
			eventDao.addEvent(e);
		} else {
			eventDao.addEvent(e);
		}
		return true;
	}
	
	public ArrayList<Events> findAllEventsUnAprroved() {
		return eventDao.findAllEventsUnAprroved();
	}
 
	
	public boolean approve(Events e){
		Events event = eventDao.findEventsByID(e);
		event.setApprovedstatus(true);
		eventDao.updateEvents(event);
		return true;
	}

	public ArrayList<Events> findAllEventsByTime(Timestamp start, Timestamp end) {
		return eventDao.findAllEventsByTime(start,end);
	}

	public ArrayList<Events> findAllEventsByAdmin(Date date, Date date2) {
		return eventDao.findAllEventsByAdmin(date,date2);
	}

	public ArrayList<Events> findAllEvents2() {
		// TODO Auto-generated method stub
		return eventDao.findAllEvents2();
	}

	public ArrayList<Events> findAllEventsByUsername(String username) {
		// TODO Auto-generated method stub
		return eventDao.findAllEventsByUsername(username);
	}
}
