<%@ page language="java" import="java.util.*" import="bean.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user=(User)request.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'EditInfo.jsp' starting page</title>
    
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
function birthdayVerify(){
	
	if($("#birthday").val()==""){
		$("#birthdayError").text("不能空").css("color","red");
		return 0;
	}else{
		$("#birthdayError").text("Ok").css("color","green");
		return 2;
	}
}
function addressVerify(){
	if($("#address").val()==""){
		$("#addressError").text("不能空").css("color","red");
		return 0;
	}else{
		$("#addressError").text("Ok").css("color","green");
		return 2;
	}
}
	function tijiao(){
		var birthadyResult=birthdayVerify();
		var addressResult=addressVerify();
		console.log(birthadyResult+addressResult);
		if(birthadyResult==2&&addressResult==2){
			$("#infoForm").submit();
		}
	}
</script>
  </head>
  
  <body>
    <form action="modify/editInfo.action" id="infoForm">
    	生日:<input type="text" name="birthday" value="<%=user.getBirthday() %>" id="birthday" onblur="birthdayVerify()"><span id="birthdayError"></span><br/>
    	地址:<input type="text" name="address" value="<%=user.getAddress() %>" id="address" onblur="addressVerify()"><span id="addressError"></span><br/>
    	<input type="button" value="提交" onclick="tijiao()">
    </form> <br>
  </body>
</html>
