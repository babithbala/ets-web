<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
#menuList li{
    margin: 10px 0;
}
a {text-decoration: none}
a:hover { color: white; text-decoration: none; font-weight: bold;font-size: 17px;}
</style>
<body>
<br/>
<br/>

<ul style="list-style-type:none" id="menuList">
<li><a href="userHome.htm" style="color:white"><spring:message code="label.home"/></a></li>
<li>
	<sec:authorize access="hasRole('ROLE_TEACHER')">
		<a href="scheduleQuiz.htm" style="color:white"><spring:message code="label.scheduleQuiz"/></a>
 	</sec:authorize>
</li>

<li>
	<sec:authorize access="hasRole('ROLE_TEACHER')">
		<a href="addQuestion.htm" style="color:white"><spring:message code="label.addQuestion"/></a>
 	</sec:authorize>
</li>

<li>
	<sec:authorize access="hasRole('ROLE_TEACHER')">
		<a href="editQuestion.htm" style="color:white"><spring:message code="label.editQuestion"/></a>
 	</sec:authorize>
</li>

<li>
	<sec:authorize access="hasRole('ROLE_TEACHER')">
		<a href="viewAllQuestions.htm" style="color:white"><spring:message code="label.viewAllQuestions"/></a>
 	</sec:authorize>
</li>

<li>
	<sec:authorize access="hasRole('ROLE_STUDENT')">
		<a href="startQuiz.htm" style="color:white;"><spring:message code="label.startQuiz"/></a>
 	</sec:authorize>
</li>

<li>
	<sec:authorize access="hasRole('ROLE_STUDENT')">
		<a href="takenQuizzes.htm" style="color:white"><spring:message code="label.takenQuizzes"/></a>
 	</sec:authorize>
</li>

<li><a href="changePassword.htm" style="color:white"><spring:message code="label.changePassword"/></a></li>

<li><a href="<c:url value="j_spring_security_logout" />"  style="color:white">Logout</a></li>

</ul>
</body>
</head>
</html>