package edu.pwr.ets.util;

public class SQL {

	public static final String UPDATE_PASSWORD = "update users set password=:conformPassword where username=:userName";

	public static final String SAVE_QUESTION = "insert into tbl_question_bank (question_area,subject_id,question,option_1,"
			+ "option_2,option_3,option_4,answer,mark,complexcity) values (:questionArea,:subjectCode,:question,:option1,"
			+ ":option2,:option3,:option4,:answer,:mark,:complexcity)";
	
	public static final String UPDATE_QUESTION ="update tbl_question_bank set question_area=:questionArea,subject_id=:subjectCode,"
			+ "question=:question,option_1=:option1,option_2=:option2,option_3=:option3,option_4=:option4,answer=:answer,mark=:mark,"
			+ "complexcity=:complexcity where question_id=:questionId";

}
