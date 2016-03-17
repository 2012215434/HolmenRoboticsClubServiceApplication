package robotics.events;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import robotics.signUpClass.SignUpClass;
import robotics.signUpClass.SignUpClassesDao;
import robotics.signUpClass.SignUpClassesService;
import robotics.user.User;
import robotics.user.UserDao;

@Controller
public class EventController {
	@Resource
	private EventService eventService;
	@Resource
	private SignUpClassesService signUpClassesService;
	
	@Resource
	SignUpClassesDao s = new SignUpClassesDao();
	@Resource
	UserDao u = new UserDao();
	String URL = "Http://localhost:8080/Demo1/findEventByID.do?id=";
	
//	@RequestMapping("/findEventByID.do")
//	public void findAEvent(HttpServletRequest request, HttpServletResponse response) throws IOException{
//	
//	     int id = Integer.parseInt(request.getParameter("id"));
//	     Events e= eventService.findEventsByID(id);
//	     Gson gson = new Gson();
//	     String json = gson.toJson(e);
//	     response.getWriter().append(json);
//	     //return jsonList;
//	}
	
	@RequestMapping("/findEventByID.do")
	public String findAEvent(ModelMap mp,HttpServletRequest request, HttpServletResponse response) throws IOException{
	
	     int id = Integer.parseInt(request.getParameter("id"));
	     String username = request.getParameter("username");
	     User u1 = new User();
	     u1.setUserName(username);
	     u1 = u.findUserByUserName(u1);
	     List<SignUpClass> sign = s.findSignUpClassByUserName(username);
	     if(!sign.isEmpty()&&sign!=null){
	    	 Iterator<SignUpClass> itr = sign.iterator();
		     while(itr.hasNext()){
		    	 SignUpClass signUpClass=itr.next(); 
		    	 if(signUpClass.getS().getEventID()==id){
			    	 mp.addAttribute("flag", "true");
			    	 break;
			     }
		     }
	     }
	     if(!mp.containsAttribute("flag")){
		    	mp.addAttribute("flag", "false");
		  }
	     if(u1.getUserType().equals("volunteer"))
	     {
	    	 mp.addAttribute("flag", "volunteer");
	     }
	     else if(u1.getUserType().equals("admin"))
	     {
	    	 mp.addAttribute("flag", "admin");
	     }
	     Events e= eventService.findEventsByID(id);
	     mp.addAttribute("events", e);
	     return "calendar";
	}
	
	
	@RequestMapping("/findAllEvents.do")
	public void findAllEvents(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Date start = Date.valueOf(request.getParameter("start"));
		Date end = Date.valueOf(request.getParameter("end"));
		String username = request.getParameter("username");
		System.out.println(start);
		System.out.println(end);
		ArrayList<Events> list = eventService.findAllEvents(start, end);
		ArrayList<EventObject> list1 = new ArrayList<EventObject>();
		StringBuffer json=new StringBuffer("[");
		for(Events e: list){
			System.out.println(e.getTitle());
			EventObject e1 = new EventObject();
			e1.setId(e.getEventID());
			json.append("{\"id\":\""+e.getEventID()+"\",");
			e1.setTitle(e.getTitle());
			json.append("\"title\":\""+e.getTitle()+"\",");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			String starttime = df.format(e.getStarttime());
			String endTime=df.format(e.getEndtime());
			e1.setStart(starttime);
			json.append("\"start\":\""+starttime+"\",");
			e1.setEnd(endTime);
			json.append("\"end\":\""+endTime+"\",");
			e1.setUrl(URL);
			json.append("\"url\":\""+URL+e.getEventID()+"&username="+username+"\",");
			e1.setOverlap(false);
			json.append("\"overlap\":\""+"false"+"\"");
			list1.add(e1);
			json.append("},");
		}
		json.replace(json.length()-1,json.length(),"]");
	     System.out.println(json);
	     
	     response.getWriter().append(json);
	     //return jsonList;
	}
	
	@RequestMapping("/findAllEventsByAdmin.do")
	public String findAllEventsByAdmin(ModelMap mp, HttpServletRequest request, HttpServletResponse response) throws IOException{
		if(request.getParameter("date")=="")
		{
			ArrayList<Events> list = eventService.findAllEvents2();
			mp.addAttribute("Events", list);
			return "manageEvent";
		}
//		Timestamp date1 = Timestamp.valueOf(request.getParameter("date")+" 00:00:00");
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(Date.valueOf(request.getParameter("date")));
//		cal.add(Calendar.DATE, 1);
//		Timestamp date2 = new Timestamp(cal.getTime().getTime());
		String time = request.getParameter("date");
		int day1 =  Integer.parseInt(time.substring(8, 10))+1;
		time = time.substring(0, 8) + day1;
		Date date2 = Date.valueOf(time);
		Date date1 = Date.valueOf(request.getParameter("date"));
		ArrayList<Events> list = eventService.findAllEventsByAdmin(date1, date2);
		mp.addAttribute("Events", list);
		return "manageEvent";
	}
	
	@RequestMapping("/findAllEventsByUsername.do")
	public String findAllEventsByUsername(ModelMap mp, HttpServletRequest request){
		String username = request.getParameter("volunteer");
		ArrayList<Events> list = eventService.findAllEventsByUsername(username);
		mp.addAttribute("Events", list);
		return "manageEvent";
	}
	
	@RequestMapping("/findAllEventsUnApproved.do")
	public String findAllEventsUnAprroved(ModelMap mp, HttpServletRequest request){
		
		ArrayList<Events> list = eventService.findAllEventsUnAprroved();
		mp.addAttribute("unApprovedEvents", list);
		return "events";
	}
	
	@RequestMapping("/updateSchedule.do")
	public String updateSchedule(ModelMap mp, HttpServletRequest request){
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		String id = request.getParameter("eventID");
		
		Timestamp start = Timestamp.valueOf(starttime);
		Timestamp end = Timestamp.valueOf(endtime);
		
		List<SignUpClass> list  = signUpClassesService.findSignedUpClassesByEventID(id);
		
		Iterator<SignUpClass> itr = list.iterator();
		while(itr.hasNext()){
			SignUpClass s = itr.next();
			signUpClassesService.cancelSignUpClasses(s);
		}
			
		
		Events e = eventService.findEventsByID(Integer.parseInt(id));
		e.setStarttime(start);
		e.setEndtime(end);	
		eventService.updateEvents(e);
		return "calendar";
	}
	
	@RequestMapping("/approve.do")
	public String approve( HttpServletRequest request){
		int eventID = Integer.parseInt(request.getParameter("eventID"));
		Events e = new Events();
		e.setEventID(eventID);
		eventService.approve(e);
		return "manageEvent";
	}
	
	@RequestMapping("/addEvent.do")
	public String addEvent(ModelMap mp, HttpServletRequest request){
		String userType = request.getParameter("userType");
		
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String description = request.getParameter("description");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		String location = request.getParameter("location");
		String username = request.getParameter("username");
		
		System.out.println(starttime);
		
		Timestamp start = Timestamp.valueOf(starttime);
		Timestamp end = Timestamp.valueOf(endtime);
		
		if(userType.equals("volunteer")){
			ArrayList<Events> list = eventService.findAllEventsByTime(start, end);
			Iterator<Events> itr = list.iterator();
			while(itr.hasNext()){
				Events e1 = itr.next();
				if(e1.getUsername().equals(username)){
					mp.addAttribute("IsSignUpEventsAtThisTime", "true");
					return "calendar";
				}
			}
			if(!mp.containsAttribute("IsSignUpEventsAtThisTime")){
				mp.addAttribute("IsSignUpEventsAtThisTime", "false");
			}
		}
		Events e = new Events();
		e.setTitle(title);
		e.setType(type);
		e.setDescription(description);
		e.setStarttime(Timestamp.valueOf(starttime));
		e.setEndtime(Timestamp.valueOf(endtime));
		e.setLocation(location);
		e.setUsername(username);
		e.setValid(true);
		eventService.addEvents(e, userType);
		
		return "calendar";
	}
	
	@RequestMapping("/deleteEvents.do")
	public String deleteEvents(ModelMap mp, HttpServletRequest request){
		int eventID= Integer.valueOf(request.getParameter("eventID"));
		Events e = eventService.findEventsByID(eventID);
		e.setValid(false);
		eventService.deleteEvents(e);
		return "calendar";
	}
	
}
