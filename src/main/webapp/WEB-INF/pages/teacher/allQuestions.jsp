<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" >
$(function(){
	
	var searchByQuesstionArea="";
	var searchByComplexcity="";
	var searchBySubjectCode="";
	var searchByQuestionNo= "";
	var view_questionID ="";
	
	
	$("#viewALlQuestionsSearchModalPanel").dialog({
		autoOpen: false,
		height:100,
		width:250,
		modal: true,
		closeOnEscape: false,
		open: function(event, ui) { 
			$(".ui-dialog-titlebar-close").hide(); 
			}
	});
	
	$( ".buttonToWinIcon" ).button({
        icons: {
            primary: "ui-icon-newwin"
        },
        text: false
    });
	
	 $( ".buttonWithText" ).button({
         text:true        
     });
	 
	 $("#viewAllQuestionCancelButton").click(function(){
		 document.getElementById("viewAllQuestionCancelLink").click();
	 });
	 
	 
	//ust use datatype: 'local' initially. 
		//At the moment when you need to load the data you should change the datatype to json or xml, for eg.
		//jQuery("#viewAllQuestionsJQGTable").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
		var viewAllQuestionsGrid =jQuery("#viewAllQuestionsJQGTable");
			
			var container = $('#listAllQuestionsContainer');
			var incidentSearch = $("#viewAllQuestionForm").validate({
				errorContainer : container,
				errorLabelContainer : $("ol", container),
				wrapper : 'li',
				meta : "validate",
				rules:{  
					questionArea : {
						required:true
					},
					subjectCode : {
						required:true
					}
				},
				messages : {
					questionArea : {
						required:'Please enter Question Area.'
					},
					subjectCode : {
						required : 'Please enter subject code.'
					}
				},
				submitHandler : function() {
					$("#viewALlQuestionsSearchModalPanel").dialog("open");
					searchByQuesstionArea= $.trim($('#viewAllQuestionArea').val());
					searchByComplexcity= $.trim($('#viewAllQuestionComplexcity').val());
					searchBySubjectCode= $.trim($('#viewAllSubjectId').val());
					searchByQuestionNo= $.trim($('#viewAllQuestionNo').val());
										
					reloadViewAllQuestionsSearchStore();
					return false;
					}
			});

			
			
		//});
		
			function reloadViewAllQuestionsSearchStore (){

			$.ajax({
				url: 'listAllQuestions.htm',
				data:{
						questionArea : searchByQuesstionArea,
						complexcity : searchByComplexcity,
						subjectCode : searchBySubjectCode,
						questionId : searchByQuestionNo
					},
				dataType: "json",
				type: "POST",
				success: function(data) {
					viewAllQuestionsGrid.jqGrid('setGridParam', { data: data }).trigger('reloadGrid');
					$("#viewALlQuestionsSearchModalPanel").dialog("close");
				}
			});
			viewAllQuestionsGrid.jqGrid({
						url:'/listAllQuestions.htm',
						mtype : "POST",
						jsonReader: {
										repeatitems: false,
										id: "questionId"
										
									},
						datatype: "local",
						colNames:['Question No', 'Question','Area','Subject', 'Complexcity'],
						colModel:[
							{name:'questionId',index:'questionId', width:85},
							{name:'question',index:'question', width:350},
							{name:'questionArea',index:'questionArea', width:100},
							{name:'subjectCode',index:'subjectCode', width:100},
							{name:'complexcity',index:'complexcity', width:100}
						],
						rowNum:10,
						rowList:[5,10,20,30],
						pager: '#viewAllQuestionsJQGTablePagingToolbar',
						sortname: 'questionId',
						viewrecords: true,
						loadonce:false,
						sortorder: "asc",
						caption:"All Questions",
						loadtext:'Loading....',
						emptyrecords:"There are no results to display",
						pgtext : "Page {0} of {1}",
						onSelectRow: function(rowid,status){ 
								 if (status) { 
									 var ret = viewAllQuestionsGrid.jqGrid('getRowData',rowid); 
									 view_questionID = ret.questionId; 
									 alert(view_questionID);
								 } 
						}
					});
					
				viewAllQuestionsGrid.jqGrid('navGrid','#viewAllQuestionsJQGTablePagingToolbar',{add:false,edit:false,del:false,search:true,refresh:true});
        
		}
		
});
</script>

</head>
<body>
<br/>
	  <div id="viewAllQuestionErrorMessage" style="color: red"></div>
  		<div class="container" id="listAllQuestionsContainer">
			<ol> 
			</ol>
		</div>
		
		<center> <h3>Search For Questions</h3></center>
		<div>
			<form id="viewAllQuestionForm"> 
			<table style="border-spacing: 6px;">
			<tr>
			<td>Question Area:</td>
			<td> 
				<input type="text" size="25" id="viewAllQuestionArea" name="questionArea" maxlength="150">&nbsp;
				<button id="addQuestionAreaPopupButton"  class="buttonToWinIcon" type="button"></button> 
			</td>
			
				<td align="right">Complexcity:</td>
				<td><select name="complexcity" id="viewAllQuestionComplexcity">
						<option value="" selected="selected">Select </option>
						<option value="1">LOW</option>
						<option value="2">MEDIUM</option>
						<option value="3">HIGH</option>
					</select>
				</td>
				
			</tr>
			
			<tr>
				<td>Subject Code:</td>
				<td><input type="text" size="25" id="viewAllSubjectId" name="subjectCode">&nbsp;
				<button id="viewAllSubjectIdPopupButton"  class="buttonToWinIcon" type="button"></button>
				</td>
				<td align="right">Question No:</td>
				<td><input type="text" size="25" id="viewAllQuestionNo" name="questionId" ></td>
			</tr>
			
			<tr>
			<td colspan="2"></td>
			<td><input type="button" class="buttonWithText" value="Cancel" id="viewAllQuestionCancelButton">&nbsp;
				<a href="goBacktoHome.htm" style="visibility: none;" id="viewAllQuestionCancelLink"></a>
				<input type="submit" class="buttonWithText" value="Search" id="viewAllQuestionSaveButton">&nbsp;
			</tr>
			</table>
		  </form>
		</div>

<br/>
<div id="viewAllQuestionsJQGTableWrapper">
<table id="viewAllQuestionsJQGTable"></table>
<div id="viewAllQuestionsJQGTablePagingToolbar"></div>
</div>


<div id="viewALlQuestionsSearchModalPanel" title="ETS">Please wait....</div>

</body>
</html>