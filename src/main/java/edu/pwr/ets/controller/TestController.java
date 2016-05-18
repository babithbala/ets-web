package edu.pwr.ets.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Scope("session")
public class TestController {
	
	@RequestMapping(value = "/scheduleQuiz.htm", method = RequestMethod.GET)
	@Secured({"ROLE_ADMIN","ROLE_TEACHER"})
	   public String scheduleQuiz(Model model) {
	       model.addAttribute("title", "Logout");
	       return "scheduleQuiz";
	   }
	
	

}
