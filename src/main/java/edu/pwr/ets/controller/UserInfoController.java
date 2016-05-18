package edu.pwr.ets.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;






import edu.pwr.ets.dto.Acknowledge;
import edu.pwr.ets.dto.ChangePassword;
import edu.pwr.ets.service.UserInfoService;


@Controller
@Scope("session")
public class UserInfoController {
	
Logger logger=Logger.getLogger(UserInfoController.class.getName());
	
	private UserInfoService userInfoService;
	
	
	
	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	@Autowired
	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}
	
	
	@RequestMapping(value="/saveUserPassword.htm",method=RequestMethod.POST, consumes="application/json")
	public @ResponseBody String saveUserPassword(@RequestBody  ChangePassword data,Principal user){
		List<Acknowledge>  list = new ArrayList<Acknowledge>();
		logger.info("old password : "+data.getOldPassword());
		data.setUserName(user.getName());
		list= userInfoService.savePassword(data);
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray.toString();
	}
	
	@RequestMapping(value = "/userInfo.htm", method = RequestMethod.GET)
	   public String userInfo(Model model, Principal principal) {
	       model.addAttribute("title", "User Info");
	 
	       String userName = principal.getName();
	 
	       model.addAttribute("message",
	               "User Info - This is protected page!. Hello " + userName);
	 
	       return "userInfoPage";
	   }
	
	
	
	@RequestMapping(value = "/updateUserInfo.htm", method = RequestMethod.GET)
	   public String updateUserInfo(Model model) {
	       return "updateUserInfo";
	   }
	   
	   @RequestMapping(value = "/userHome.htm", method = RequestMethod.GET)
	   public String userHomePage(Model model, Principal principal) {
		   String userName = principal.getName();
		   
	       model.addAttribute("message",
	               "Hello " + userName+ "\n This is protected page!.");
	 
	       return "userHome";
	   }
	   
	   
	   @RequestMapping(value = "/goBacktoHome.htm", method = RequestMethod.GET)
	   public String goBacktoHome(Model model) {
	       return "userHome";
	   }
}
