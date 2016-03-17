package robotics.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class UserService1 {
	@Resource
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String login(User u){
		User result=userDao.findUserByUserName(u);
		if(result==null){
			System.out.println("11111");
			return null;
		}
		else if(result.isValide()&&result!=null&&result.getUserName().equals(u.getUserName())&&
				result.getPassword().equals(u.getPassword())){
			
			result.setLoginStatus(true);
			userDao.updateUser(result);
			System.out.println("2222");

			return result.getUserType();
		}else{
			System.out.println("33333");

			return null;
		}
	}

	public User findUserByUserName(String userName){
		User u = new User();
		u.setUserName(userName);
		return userDao.findUserByUserName(u);
	}
	public void logout(User u) {
		User result=userDao.findUserByUserName(u);
		result.setLoginStatus(false);
		userDao.updateUser(result);
		return;
		
	}
	public void addUser(User u){
		userDao.addUser(u);
	}
	
	public void deleteUser(User u){
		userDao.delete(u);
	}
	
	public List<User> findAllUser(){
		return userDao.findUser();
	}
}
