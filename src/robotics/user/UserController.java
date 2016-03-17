 package robotics.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	@Resource
	private UserService1 userService = new UserService1();

//	@RequestMapping("/test1")
//	public @ResponseBody
//	String test1() {
//    	System.out.println("123");
//
//		return "123";
//	}
	
	@RequestMapping("/login")
	public @ResponseBody
	String login(ModelMap mp,HttpServletRequest request) {
		String password = request.getParameter("password");
		String userName = request.getParameter("userName");
		User u = new User();
		u.setUserName(userName);
		u.setPassword(password);
		String userType = userService.login(u);
		u = userService.findUserByUserName(userName);
		mp.addAttribute("user", u);
		if(userType==null||userType.equals("")){
			return "welcome&login";
		}
		if (userType.equals("admin")) {
			System.out.println("===================");
			return "calendar";
		} else if (userType.equals("student")) {
			return "calendar";
		} else if (userType.equals("sponsor")) {
			return "calendar";
		} else if (userType.equals("volunteer")) {
			return "calendar";
		}
		System.out.println("--------------------");
		return "welcome&login";
	}
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		return "welcome&login";
	}

	@RequestMapping("/updateUser.do")
	public String updateUser(ModelMap mp, HttpServletRequest request) {
		String password = request.getParameter("password");
		//String userName = request.getParameter("userName");
		//String userID = request.getParameter("userID");
		User u = new User();
		u.setPassword(password);
		return "manageUser";

	}
	@RequestMapping("/addUser.do")
	public String addUser(HttpServletRequest request){
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");
		
		User u = new User();
		u.setUserName(userName);
		u.setPassword(password);
		u.setUserType(userType);
		u.setValide(true);
		User u1= userService.findUserByUserName(userName);
		if(u1==null){
			userService.addUser(u);
			return "manageUser";
		}else{
			return "manageUser";
		}
	}
	@RequestMapping("/deleteUser.do")
	public String deleteUser(HttpServletRequest request){
		String userName = request.getParameter("userName");
		User u = new User();
		u.setUserName(userName);
		userService.deleteUser(u);
		return "manageUser";
	}
	
	@RequestMapping("/showAllUser.do")
	public String showAllUser(ModelMap mp, HttpServletRequest request){
		List<User> list = userService.findAllUser();
		mp.addAttribute("user", list);
		return "manageUser";
	}
	@RequestMapping("/searchUser")
	public String searchUser(ModelMap mp,HttpServletRequest request){
		String userName = request.getParameter("userName");
		User u = userService.findUserByUserName(userName);
		List<User> list = new ArrayList<User>();
		list.add(u);
		mp.addAttribute("user", list);
		return "manageUser";
	}
	
	@RequestMapping("/skipToCalendar")
	public String findhUser(ModelMap mp,HttpServletRequest request){
		String userName = request.getParameter("userName");
		User u = userService.findUserByUserName(userName);
		mp.addAttribute("user", u);
		return "calendar";
	}
}
