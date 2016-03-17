package robotics.donation;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DonationController {
	@Resource
	private DonationService donationService;

	public DonationService getDonationService() {
		return donationService;
	}

	public void setDonationService(DonationService donationService) {
		this.donationService = donationService;
	}
	
	@RequestMapping("/donate.do")
	public String donate(HttpServletRequest request,HttpServletResponse response,ModelMap mp){
		String username = request.getParameter("username");
		String time = request.getParameter("time");
		int amount = Integer.parseInt(request.getParameter("amount"));
		Timestamp t = Timestamp.valueOf(time);
		Donation d = new Donation();
		d.setAmount(amount);
		d.setTime(t);
		d.setUsername(username);
		donationService.add(d);
		mp.addAttribute("success", "true");
		return "donate";
		
	}
	
	@RequestMapping("/getTotalDonation.do")
	public String getTotalDonation(HttpServletRequest request,HttpServletResponse response,ModelMap mp){
		
		String time = request.getParameter("date");
		int day1 =  Integer.parseInt(time.substring(8, 10))+1;
		time = time.substring(0, 8) + day1;
		Date d = Date.valueOf(time);
		int amount  = donationService.totalDonation(d);
		mp.addAttribute("amount", "$"+amount);
		
		return "checkDonation";
		
	}
	
}
