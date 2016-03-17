package robotics.donation;

import java.sql.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class DonationService {
	@Resource
	private DonationDao donationDao;

	public DonationDao getDonationDao() {
		return donationDao;
	}

	public void setDonationDao(DonationDao donationDao) {
		this.donationDao = donationDao;
	}
	
	public void add(Donation d){
		donationDao.add(d);
	}
	
	public int totalDonation(Date d){
		return donationDao.totalDonation(d);
	}
}
