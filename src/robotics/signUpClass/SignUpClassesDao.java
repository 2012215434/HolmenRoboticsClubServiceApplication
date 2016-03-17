package robotics.signUpClass;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import robotics.events.EventDao;
import robotics.events.Events;
import robotics.user.User;

@Component
public class SignUpClassesDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	@Resource
	EventDao e= new EventDao();

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public void addSignUpClasses(SignUpClass s){
		hibernateTemplate.save(s);
	}
	
	public void cancelSignUpClasses(SignUpClass s){
		hibernateTemplate.delete(s);
	}
	

	public List<SignUpClass> findSignUpClassByUserName(String userName){
		String hql = "from SignUpClass s where s.s.userName=?";
		System.out.println(userName);
		
		List<SignUpClass> list =  hibernateTemplate.find(hql, userName);
		return list;
	
	}
	public List<Events> findSignedUpClassesByUsername(User u){
		List<Events> list1=new LinkedList<Events>();
		String hql = "from SignUpClass s where s.s.userName=?"; 
		@SuppressWarnings("unchecked")
		List<SignUpClass> list = hibernateTemplate.find(hql, u.getUserName());
		Iterator<SignUpClass> itr = list.iterator();
		while(itr.hasNext()){
			SignUpClass s = itr.next();
			int eventsID = s.getS().getEventID();
			Events events = new Events();
			events.setEventID(eventsID);
			list1.add(e.findEventsByID(events));
		}
		return list1;
	}
	
	public List<SignUpClass> findSignUpClassByEventID(String eventID){
		
		String hql = "from SignUpClass s where s.s.eventID=?";
		System.out.println(eventID);
		
		List<SignUpClass> list =  hibernateTemplate.find(hql, Integer.parseInt(eventID));
		return list;
	
	}
}
