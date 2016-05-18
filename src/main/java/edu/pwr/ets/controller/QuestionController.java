package edu.pwr.ets.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.pwr.ets.dto.Acknowledge;
import edu.pwr.ets.dto.QuestionBank;
import edu.pwr.ets.service.QuestionService;

@Controller
@Scope("session")
public class QuestionController {
	
	Logger logger=Logger.getLogger(QuestionController.class.getName());
	
	private QuestionService questionService;
	
	public QuestionService getQuestionService() {
		return questionService;
	}
	
	@Autowired
	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}
	
	@RequestMapping(value = "/addQuestion.htm", method = RequestMethod.GET)
	@Secured("ROLE_TEACHER")
	   public String addQuestion(Model model) {
	       model.addAttribute("title", "Logout");
	       return "addQuestion";
	   }
	
	@RequestMapping(value = "/editQuestion.htm", method = RequestMethod.GET)
	@Secured("ROLE_TEACHER")
	   public String editQuestion(Model model) {
	       model.addAttribute("title", "Logout");
	       return "editQuestion";
	   }
	
	@RequestMapping(value = "/viewAllQuestions.htm", method = RequestMethod.GET)
	@Secured("ROLE_TEACHER")
	   public String viewAllQuestions(Model model) {
	       model.addAttribute("title", "Logout");
	       return "viewAllQuestions";
	   }
	
	@RequestMapping(value="/saveOrUpdateQuestion.htm",method=RequestMethod.POST)
	@Secured({"ROLE_TEACHER"})
	public @ResponseBody String saveOrUpdateQuestion(@RequestBody  QuestionBank questionDetails){
			List<Acknowledge>  list = new ArrayList<Acknowledge>();
			logger.info("Question details :: QuestionId"+questionDetails.getQuestionId());
			if(questionDetails.getQuestionId()!=null && questionDetails.getQuestionId() >0){	
					list=questionService.updateQuestionDetails(questionDetails);
			}else{
					list=questionService.saveQuestionDetails(questionDetails);
			}
			JSONArray data = JSONArray.fromObject(list);
			return data.toString();
		}
	
	@RequestMapping(value="/listAllQuestions.htm",method=RequestMethod.POST)
	public @ResponseBody String viewAllQuestions(@RequestParam String questionArea,
			@RequestParam String complexcity,@RequestParam String subjectCode,
			@RequestParam String questionId){
		logger.info("listAllQuestions1.htm***************************************"+questionArea  );
		List<QuestionBank> list= questionService.getAllQuestions(questionArea,complexcity,subjectCode,questionId);
		JSONArray data = JSONArray.fromObject(list);
		return data.toString();
	}

}
