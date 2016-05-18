<html>
	<head>
	
	<script type="text/javascript">
	
	$(function(){
		 $(".buttonWithText").button( {
				text : true
			});
		 
	$('#passwordChangeSaveButton').click(function() {
			if ($('#oldPasswordId').val().trim().length > 0) {
				$("#oldPasswordId").removeClass("inputError");
			} else {
				$("#oldPasswordId").addClass("inputError");
			}
		});
	
	
	var container = $('div.container');
	var validator = $("#changePasswordForm").validate({
		errorContainer : container,
		errorLabelContainer : $("ol", container),
		wrapper : 'li',
		meta : "validate",
		rules:{  
					oldPassword : {
							required : true
						},
					newPassword : {
						required : true
						},
					conformPassword:{
							required:true
						}
				},
		messages : {
					oldPassword : {
							required : 'Please enter Old Password.'
						},
					newPassword : {
							required : 'Please enter New Password.'
						},
					conformPassword:{
							required:"Please enter Conform Password."
						}
					},
		submitHandler : function() {
			$("#addChangePasswordErrorMessage").html("");
			var passwordInfo = $('#changePasswordForm').serializeObject();
			$.postJSON("saveUserPassword.htm", passwordInfo, function(data) {
				$(".inputError").removeClass("inputError");
				var i = 0;
				var success=true;
				var messages = "";
				for (i = 0; i < data.length; i++) {
					messages += data[i].message;
				}
				$("#addChangePasswordErrorMessage").html(messages);
		  	});
			return false;
	 	}
	}); 
	
	});
	</script>
	
	</head>
	
	<body>
	<br/>
	  <div id="addChangePasswordErrorMessage" style="color: red"></div>
  		<div class="container">
			<ol> 
			    <li><label for="oldPasswordId" class="error">Please enter Old Password.</label></li>
			    <li><label for="newPasswordId" class="error">Please enter New Password.</label></li>
			    <li><label for="conformPasswordId" class="error">Please enter Conform Password.</label></li>
			</ol>
		</div>
		<center> <h3>Change Password</h3></center>
	<div style="align:center">
	<form id="changePasswordForm">
	<table border="0px">
		<tr>
			<td>Old password</td>
			<td><input name="oldPassword" type="text" size="50" maxlength="30" id="oldPasswordId"> </td>
		</tr>
		
		<tr>
			<td>New password</td>
			<td><input name="newPassword" type="text" size="50" maxlength="30" id="newPasswordId"> </td>
		</tr>
		
		<tr>
			<td>Conform password</td>
			<td><input name="conformPassword" type="text" size="50" maxlength="30" id="conformPasswordId"> </td>
		</tr>
		
		<tr>
			<td></td>
			<td align="center"><input type="submit"  value="Save" class="buttonWithText" id="passwordChangeSaveButton"></button></td>
		</tr>
	</table>
	 
	</form>
	</div>
	</body>
</html>