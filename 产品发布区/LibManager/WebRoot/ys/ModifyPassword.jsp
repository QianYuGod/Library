<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
  <head>
     <base href="<%=basePath%>">
    
    <title>modify password</title>
  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="javaScripts/jquery.js"></script>
<script type="text/javascript">
var pwdResult;
	function passwordVerify(){
		var pwd=$("#password").val();
		if(pwd==""){
			$("#passwordError").text("密码不能为空").css("color","red");
			return 0;
		}else{
			var data={password:pwd};
			
				$.post("verify/verifyPassword.action",data,function(result){
				pwdResult=result;
				
				if(result==1){
					$("#passwordError").text("与原密码不一致").css("color","red");
					
				}else{
					$("#passwordError").text("Ok").css("color","green");
					
				}
				
			});
		}
	}
	function verifyNewPassword(){
		var pwd=$("#newPassword").val();
		if(pwd==""){
			$("#newPasswordError").text("密码不能为空").css("color","red");
			return 0;
		}else{
			$("#newPasswordError").text("Ok").css("color","green");
			return 2;
		}
	}
	function rePasswordVerify(){
	var newPassword=$("#newPassword").val();
	var validatePassword=$("#validatePassword").val();
		if(validatePassword==""){
			$("#validateEorror").text("确认密码不可空").css("color","red");
			return 0;
		}
		else if(newPassword==validatePassword){
			$("#validateEorror").text("Ok").css("color","green");
			return 2;
		}else{
			$("#validateEorror").text("两次密码不一致").css("color","red");
			return 1;
		}
	}
	function tijiao(){
		
		var newResult=verifyNewPassword();
		var reResult=rePasswordVerify();
		console.log(pwdResult);
		if(pwdResult==2&&newResult==2&&reResult==2){
			$("#mpForm").submit();
		}
	}
</script>
  </head>
  
  <body>
    <form action="verify/verifyModifyPassword.action" method="post" id="mpForm">
    	原密码<input type="password" name="password" id="password" onblur="passwordVerify()"><span id="passwordError"></span><br/>
    	新密码<input type="password" name="newPassword" id="newPassword" onblur="verifyNewPassword()"><span id="newPasswordError"></span><br/>
    	确认密码<input type="password" name="validatePassword" id="validatePassword" onblur="rePasswordVerify()"><span id="validateEorror"></span><br/>
    	<input type="button" value="提交" onclick="tijiao()">
    </form><br>
  </body>
  
</html>
