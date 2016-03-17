package robotics.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

@Component
public class UserDao {
	@Resource
	private HibernateTemplate hibernateTemplate ;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public User findUserByUserName(User u){
		String userName=u.getUserName();
		String hql="from User u where u.userName=?";
		System.out.println(u.getUserName());
		System.out.println(u.getUserType());
		@SuppressWarnings("unchecked")
		ArrayList<User> list = (ArrayList<User>) hibernateTemplate.find(hql,userName);
		if(list.isEmpty()){
			return null;
		}
		System.out.println("user not empty!");
		
		System.out.println(list.get(0).getPassword());
		return list.get(0);
	}

	public void addUser(User u) {
		hibernateTemplate.save(u);
	}

	public void delete(User u) {
		//hibernateTemplate.delete(u);
		User u1 = findUserByUserName(u);
		u1.setValide(false);
		hibernateTemplate.update(u1);
	}
	
	public List<User> findUser(){
		String hql="from User u";
		@SuppressWarnings("unchecked")
		List<User> list= hibernateTemplate.find(hql);
		return list;
	}

	public List<User> findUserByName(User u) {
		String hql="from User u where u.userName=?";
		@SuppressWarnings("unchecked")
		List<User> list=hibernateTemplate.find(hql,u.getUserName());
		if(list.isEmpty()){
			return null;
		}
		return list;
	}
	
	public boolean updateUser(User u){
		if(findUserByUserName(u)!=null){
			hibernateTemplate.update(u);
			return true;
		}else{
			return false;
		}
		
	}
}
