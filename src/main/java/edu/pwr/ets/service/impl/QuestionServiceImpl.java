package edu.pwr.ets.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Service;

import edu.pwr.ets.dto.Acknowledge;
import edu.pwr.ets.dto.QuestionBank;
import edu.pwr.ets.service.QuestionService;
import edu.pwr.ets.util.ETSUtil;
import edu.pwr.ets.util.SQL;

@Service("questionService")
@Scope("session")
public class QuestionServiceImpl implements QuestionService {

	Logger logger = Logger.getLogger(QuestionServiceImpl.class.getName());

	public List<Acknowledge> saveQuestionDetails(QuestionBank questionDetails) {
		List<Acknowledge> list = new ArrayList<Acknowledge>();
		Acknowledge acknowledge = new Acknowledge();
		try{
			NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(ETSUtil.getDataSource());
			SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(questionDetails);
			GeneratedKeyHolder genKey=new GeneratedKeyHolder();
			
			template.update(SQL.SAVE_QUESTION, namedParameters,genKey);
			
			acknowledge.setId(genKey.getKey().longValue());
			acknowledge.setMessage("Question added to the question bank. <br/>");
			list.add(acknowledge);
			}catch(Exception e){
				logger.info("exception while adding new question: "+e.getMessage());
				String cause = e.getCause().toString();
				if(cause !=null){
					acknowledge.setMessage(cause.substring(cause.indexOf(":")+1, cause.length())+"<br/>");
					list.add(acknowledge);
				}
				
			}
		return list;
	}
	
	public List<Acknowledge> updateQuestionDetails(QuestionBank questionDetails) {
		List<Acknowledge> list = new ArrayList<Acknowledge>();
		Acknowledge acknowledge = new Acknowledge();
		try{
			NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(ETSUtil.getDataSource());
			SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(questionDetails);
			
			template.update(SQL.UPDATE_QUESTION, namedParameters);
			
			acknowledge.setId(questionDetails.getQuestionId().longValue());
			acknowledge.setMessage("Question details updated. <br/>");
			list.add(acknowledge);
			}catch(Exception e){
				logger.info("exception while updating the question: "+e.getMessage());
				String cause = e.getCause().toString();
				if(cause !=null){
					acknowledge.setMessage(cause.substring(cause.indexOf(":")+1, cause.length())+"<br/>");
					list.add(acknowledge);
				}
				
			}
		return list;
	}
	
	
	
	public List<QuestionBank> getAllQuestions(
			String questionArea,String complexcity,String subjectCode,String questionId) {
		String sql="";
		List<QuestionBank> list=new ArrayList<QuestionBank>();
		JdbcTemplate template = new JdbcTemplate(ETSUtil.getDataSource());
		RowMapper<QuestionBank> mapper = new RowMapper<QuestionBank>() {
			
			public QuestionBank mapRow(ResultSet rs, int rowNum) throws SQLException {
				QuestionBank question = new QuestionBank();
				question.setQuestion(rs.getString("question"));
				question.setComplexcity(rs.getString("complexcity"));
				question.setQuestionId(rs.getInt("question_id"));
				question.setQuestionArea(rs.getString("question_area"));
				question.setSubjectCode(rs.getString("subject_id"));
				return question;
			}
			
		};
		try{
			if(complexcity!=""){
				complexcity =" = '"+complexcity+"' ";
			}else{
				complexcity =" IN (1,2,3)";
			}
			if(questionId!=""){
				questionId = " = "+questionId;
			}else{
				questionId = " >= 1";
			}
			sql="Select question,complexcity,question_id,question_area,subject_id from tbl_question_bank "
					+" where question_area= '"+questionArea+"' OR subject_id= '"+subjectCode+ "' OR complexcity "+complexcity
					+" OR question_id "+questionId  ;
					logger.info("SQL Questions Search "+sql);
					list = template.query(sql, mapper);
			}catch (Exception e){
				logger.info("Exception cause "+e.getMessage());
			}
			return list;	
		
	}


}
