<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
/* table { */
/*     	border-collapse: separate; */
/*     	border-spacing: 6px; */
/* 	} */
</style>

<script type="text/javascript" >
$(function(){
	
	$( ".buttonToWinIcon" ).button({
        icons: {
            primary: "ui-icon-newwin"
        },
        text: false
    });
	
	 $( ".buttonWithText" ).button({
         text:true        
     });
	 
	 $("#addQuestionCancelButton").click(function(){
		 $.ajax({
			  type: "GET",
			  url: "goBacktoHome.htm"
			}); 
	 });
	 
	 
	 
	 var container = $('div.container');
		var validator = $("#addQuestionForm").validate({
			errorContainer : container,
			errorLabelContainer : $("ol", container),
			wrapper : 'li',
			meta : "validate",
			rules:{  
						questionArea : {
								required : true
							},
						subjectCode : {
							required : true
							},
						question:{
								required:true
							}
					},
			messages : {
						questionArea : {
								required : 'Please enter Question Area.'
							},
							subjectCode : {
								required : 'Please enter Subject Code.'
							},
							question:{
								required:"Please enter the Question."
							}
						},
			submitHandler : function() {
				$("#addQuestionErrorMessage").html("");
				var questionDetails = $('#addQuestionForm').serializeObject();
				$.postJSON("saveOrUpdateQuestion.htm", questionDetails, function(data) {
					$(".inputError").removeClass("inputError");
					var i = 0;
					var success=true;
					var messages = "";
					for (i = 0; i < data.length; i++) {
						messages += data[i].message;
					}
					$("#addQuestionErrorMessage").html(messages);
			  	});
				return false;
		 	}
		}); 
});
</script>
</head>
<body>
<br/>
	  <div id="addQuestionErrorMessage" style="color: red"></div>
  		<div class="container">
			<ol> 
			</ol>
		</div>
		
		<center> <h3>Add Question</h3></center>
		<div>
			<form id="addQuestionForm">
			<table style="border-spacing: 6px;">
			<tr>
			<td>Question Area:</td>
			<td> 
				<input type="text" size="25" id="addQuestionArea" name="questionArea" maxlength="150">&nbsp;
				<button id="addQuestionAreaPopupButton"  class="buttonToWinIcon" type="button"></button> 
			</td>
			</tr>
			
			<tr>
				<td>Subject Code:</td>
				<td><input type="text" size="25" id="addSubjectId" name="subjectCode">&nbsp;
				<button id="addSubjectIdPopupButton"  class="buttonToWinIcon" type="button"></button>
				</td>
				<td align="right">Question No:</td>
				<td><input type="text" size="25" id="addQuestionNo" name="questionId" disabled="disabled"></td>
			</tr>
			
			<tr>
				<td>Question:</td>
				<td colspan="2"><textarea rows="5" cols="58" id="addQuestion" name="question"></textarea></td>
			</tr>
			
			<tr>
				<td>Option:</td>
				<td>a.<input type="text" size="25" name="option1" id="addQuestionOption1">
				<td align="right">Complexcity:</td>
				<td><select name="complexcity" id="addQuestionComplexcity">
						<option value="" selected="selected">Select </option>
						<option value="1">LOW</option>
						<option value="2">MEDIUM</option>
						<option value="3">HIGH</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td></td>
				<td>b.<input type="text" size="25" name="option2" id="addQuestionOption2"></td>
				<td align="right">Answer:</td>
				<td><input type="text" size="25" name="answer" id="addQuestionAnswer"></td>
			</tr>
			
			<tr>
				<td></td>
				<td>c.<input type="text" size="25" name="option3" id="addQuestionOption3"></td>
				<td align="right">Maximum Score:</td>
				<td><input type="text" size="25" name="mark" id="addQuestionMaxScore"></td>
			</tr>
			
			<tr>
				<td></td>
				<td>d.<input type="text" size="25" name="option4" id="addQuestionOption4"></td>
			</tr>
			
			<tr>
			<td colspan="2"></td>
			<td><input type="button" class="buttonWithText" value="Cancel" id="addQuestionCancelButton">&nbsp;
				<input type="submit" class="buttonWithText" value="Save" id="addQuestionSaveButton">&nbsp;
			</tr>
			</table>
		  </form>
		</div>
</body>
</html>