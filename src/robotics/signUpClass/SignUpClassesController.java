package robotics.signUpClass;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import robotics.events.EventService;
import robotics.events.Events;
import robotics.user.User;

@Controller
public class SignUpClassesController {

	@Resource
	private SignUpClassesService signUpClassesService;
	@Resource
	EventService eventService;

	public SignUpClassesService getSignUpClassesService() {
		return signUpClassesService;
	}

	public void setSignUpClassesService(SignUpClassesService signUpClassesService) {
		this.signUpClassesService = signUpClassesService;
	}
	
	@RequestMapping("/addSignUpClasses.do")
	public String addSignUpClasses(ModelMap mp,HttpServletRequest request){
		int eventID = Integer.parseInt(request.getParameter("eventID"));
		String userName = request.getParameter("userName");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		User u = new User();
		u.setUserName(userName);
		List<Events> list = signUpClassesService.findSignedUpClassesByUserName(u);
		Iterator<Events> itr = list.iterator();
		while(itr.hasNext()){
			Events e1= itr.next();
			if(e1.getEventID()==eventID){
				mp.addAttribute("success", "false");
				return "calendar";
			}
		}
		Timestamp start = Timestamp.valueOf(starttime);
		Timestamp end = Timestamp.valueOf(endtime);
		Iterator<Events> itr1 = list.iterator();
		while(itr1.hasNext()){
			Events e2= itr1.next();
			if((e2.getStarttime().after(start)&&e2.getStarttime().before(end))||(e2.getEndtime().after(start)&&e2.getEndtime().before(end))
					||(e2.getStarttime().before(start)&&e2.getEndtime().after(end))
					||(e2.getStarttime().equals(start))
					||(e2.getEndtime().equals(end))){
				mp.addAttribute("IsSignUpEventsAtThisTime", "true");
				return "calendar";
			}
		}
		if(!mp.containsAttribute("IsSignUpEventsAtThisTime")){
			mp.addAttribute("IsSignUpEventsAtThisTime", "false");
		}
		
		SignUp s = new SignUp();
		s.setEventID(eventID);
		s.setUserName(userName);
		SignUpClass s1 = new SignUpClass();
		s1.setS(s);
		signUpClassesService.addSignUpClasses(s1);
		mp.addAttribute("success", "true");
		return "calendar";
	}
	
	@RequestMapping("/cancelSignUpClasses.do")
	public String cancelSignUpClasses(HttpServletRequest request){
		int eventID = Integer.parseInt(request.getParameter("eventID"));
		String userName = request.getParameter("userName");
		SignUp s = new SignUp();
		s.setEventID(eventID);
		s.setUserName(userName);
		SignUpClass s1 = new SignUpClass();
		s1.setS(s);
		signUpClassesService.cancelSignUpClasses(s1);
		return "calendar";
	}
	
	@RequestMapping("/findSignUpClasses.do")
	public String findSignUpClasses(ModelMap mp,HttpServletRequest request){
		String userName = request.getParameter("userName");
		User u = new User();
		u.setUserName(userName);
		List<Events> list = signUpClassesService.findSignedUpClassesByUserName(u);
		mp.addAttribute("classList", list);
		return "";
	}
	
}
