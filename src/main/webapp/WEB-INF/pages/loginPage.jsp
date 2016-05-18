<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<!--META-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Form</title>

<!--STYLESHEETS-->
<link href="/ETS/css/style.css" rel="stylesheet" type="text/css" />

<!--SCRIPTS-->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!--Slider-in icons-->
<script type="text/javascript">
$(document).ready(function() {
	$(".username").focus(function() {
		$(".user-icon").css("left","-48px");
	});
	$(".username").blur(function() {
		$(".user-icon").css("left","0px");
	});
	
	$(".password").focus(function() {
		$(".pass-icon").css("left","-48px");
	});
	$(".password").blur(function() {
		$(".pass-icon").css("left","0px");
	});
});
</script>

</head>
<body>

<div id="wrapper">

	<!--SLIDE-IN ICONS-->
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
    <!--END SLIDE-IN ICONS-->

<!--LOGIN FORM-->
<form name="login-form" class="login-form" action="j_spring_security_check" method = "post" >

    <div class="header">
    <h1>ETS Login Form</h1>
    <span>Please Login to the application.</span>
    <c:if test="${not empty param.login_error}">
    <div class="error">
        Your login attempt was not successful, try again.<br />
        Reason: #{sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}
    </div>
</c:if>
    </div>
    
	

    <div class="content">
	<input name="username" type="text" class="input username" value="teacher1" onfocus="this.value=''" />
    <input name="password" type="password" class="input password" value="teacher" onfocus="this.value=''" />
    </div>
    
    <div class="footer">
    Remember Me:&nbsp;<input type="checkbox" name="remember-me" />
    <input type="submit" name="submit" value="Login" class="button" />
    <input type="submit" name="submit" value="Register" class="register" />
    </div>


</form>
<!--END LOGIN FORM-->

</div>
<!--END WRAPPER-->

<!--GRADIENT--><div class="gradient"></div><!--END GRADIENT-->

</body>
</html>