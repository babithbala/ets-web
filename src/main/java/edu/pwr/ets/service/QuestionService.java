package edu.pwr.ets.service;

import java.util.List;

import edu.pwr.ets.dto.Acknowledge;
import edu.pwr.ets.dto.QuestionBank;

public interface QuestionService {
	
	public abstract List<Acknowledge> saveQuestionDetails(QuestionBank questionDetails);
	public abstract List<Acknowledge> updateQuestionDetails(QuestionBank questionDetails);
	
	public abstract List<QuestionBank> getAllQuestions(
			String questionArea,String complexcity,String subjectCode,String questionId);
	
}
