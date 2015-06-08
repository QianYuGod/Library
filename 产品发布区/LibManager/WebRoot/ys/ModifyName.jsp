<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ModifyName.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="javaScripts/jquery.js"></script>
	<script type="text/javascript">
	var resultName;
	function nameVerify()
	{
		
		var data={username:$("[name=username]").val()};
		$.post("verify/nameVerify.action",data,function(result){
		
			if(result==2){
				$("#nameError").text("Ok").css("color","green");
			}else{
				$("#nameError").text("用户已经存在").css("color","red");
			}
		});
				
	}
	function tijiao(){
		var data={username:$("[name=username]").val()};
		$.post("verify/nameVerify.action",data,function(result){
		
			if(result==2){
				
				$("#nameForm").submit();
			}else{
				$("#nameError").text("用户已经存在").css("color","red");
			}
		});
		
	}	
	</script>
  </head>
  
  <body>
  
    <form action="modify/modifyName.action" method="post" id="nameForm">
    	<input type="text" name="username" value="${requestScope.username }" onblur="nameVerify()"><span id="nameError"></span></br>
    	<input type="button" value="提交" onclick="tijiao()">
    </form><br>
  </body>
</html>
