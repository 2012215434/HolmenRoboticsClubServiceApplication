package robotics.events;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

@Component
public class EventDao {
	@Resource
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public ArrayList<Events> findAllEvents(Date start,Date end) {
		String hql = "from Events e where (starttime between ? and ? or endtime between ? and ?) and approvedstatus=true and valid = true";
		@SuppressWarnings("unchecked")
		ArrayList<Events> list = (ArrayList<Events>) hibernateTemplate.find(hql,start,end,start,end);
		return list;
	} 
	
	public void addEvent(Events e) {
		hibernateTemplate.save(e);
	}

	public void updateEvents(Events e) {
		hibernateTemplate.update(e);
	}

	public Events findEventsByID(Events e) {
		String hql = "from Events e where e.eventID = ?";
		Events event = (Events) hibernateTemplate.find(hql, e.getEventID()).get(0);
		return event;
	}

	public ArrayList<Events> findAllEventsUnAprroved() {
		String hql = "from Events e where e.approvedstatus = ?";
		@SuppressWarnings("unchecked")
		ArrayList<Events> list = (ArrayList<Events>) hibernateTemplate.find(hql, false);
		return list;
	}

	public ArrayList<Events> findAllEventsByTime(Timestamp start, Timestamp end) {
		String hql = "from Events e where (starttime between ? and ? or endtime between ? and ?) and approvedstatus=true";
		@SuppressWarnings("unchecked")
		ArrayList<Events> list = (ArrayList<Events>) hibernateTemplate.find(hql,start,end,start,end);
		return list;
	}

	public ArrayList<Events> findAllEventsByAdmin(Date date, Date date2) {
		String hql = "from Events e where (starttime between ? and ? or endtime between ? and ?)";
		@SuppressWarnings("unchecked")
		ArrayList<Events> list = (ArrayList<Events>) hibernateTemplate.find(hql,date,date2,date,date2);
		return list;
	}

	public ArrayList<Events> findAllEvents2() {
		// TODO Auto-generated method stub
		String hql = "from Events e";
		@SuppressWarnings("unchecked")
		ArrayList<Events> list = (ArrayList<Events>) hibernateTemplate.find(hql);
		return list;
	}

	public ArrayList<Events> findAllEventsByUsername(String username) {
		String hql = "from Events e where e.username = ?";
		@SuppressWarnings("unchecked")
		ArrayList<Events> list = (ArrayList<Events>) hibernateTemplate.find(hql, username);
		return list;
	}

}
