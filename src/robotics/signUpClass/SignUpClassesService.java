package robotics.signUpClass;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import robotics.events.Events;
import robotics.user.User;

@Component
public class SignUpClassesService {

	@Resource
	private SignUpClassesDao signUpClassesDao;

	public SignUpClassesDao getSignUpClassesDao() {
		return signUpClassesDao;
	}

	public void setSignUpClassesDao(SignUpClassesDao signUpClassesDao) {
		this.signUpClassesDao = signUpClassesDao;
	}
	
	public void addSignUpClasses(SignUpClass s){
		signUpClassesDao.addSignUpClasses(s);
	}
	
	public void cancelSignUpClasses(SignUpClass s){
		signUpClassesDao.cancelSignUpClasses(s);
	}
	
	public List<Events> findSignedUpClassesByUserName(User u){
		return signUpClassesDao.findSignedUpClassesByUsername(u);
	}
	
	public List<SignUpClass> findSignedUpClassesByEventID(String eventID){
		return signUpClassesDao.findSignUpClassByEventID(eventID);
	}
}
