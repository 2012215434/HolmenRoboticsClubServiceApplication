package robotics.donation;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

@Component
public class DonationDao {
	@Resource
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public void add(Donation d){
		hibernateTemplate.save(d);
	}
	
	public int totalDonation(Date d){
		int totalDonation = 0;
		String hql = "from Donation d  where d.time <= ?";
		List<Donation> list =  hibernateTemplate.find(hql, d);
		for(Donation donation : list){
			totalDonation =  totalDonation + donation.getAmount();
		}
		return totalDonation;
	}
}
