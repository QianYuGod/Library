<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册账号</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <h1 align="center">注册账号</h1>
  <hr>
  <body>
 <script>
 function vertify(){
 
	 var password1 = document.getElementById("password").value;
	 var password2 = document.getElementById("password1").value;
	 var vertifyText = document.getElementById("vertifyText");
	 var submitbutton = document.getElementById("submit");

	 if(password1!=password2){
	 	vertifyText.text="两次密码输入不一致";
	 	submitbutton.setAttribute("type", "button");
	 	return;
	 }else if(password1==password2){
	 	vertifyText.text="两次输入匹配";
	 	
	 	submitbutton.setAttribute("type", "submit");
	 }
 }
 
 </script>
    <form action="login?action=saveUser" method="post">
    <div align="center">用户名：<input type="text" name="administrator" id="administrator"></div>
    <div align="center">密码：<input type="password" name="password" id="password"></div>
    <div align="center">输一次密码：<input type="password" name="password1" id="password1" onchange="vertify()"><a id="vertifyText"></a></div>
    <div align="center">姓名:<input type="text" name="name" id="name"></div>
    <div align="center">学号/职工号:<input type="text" name="number" id="number"></div>
    <div align="center">出生年月:<input type="text" name="birthday" id="birthday"></div>
    <div align="center">学院:<input type="text" name="college" id="college"></div>
    <div align="center">专业:<input type="text" name="major" id="major"></div>
    <div align="center">身份:<select name="id" id="id">
   <option value="Student">学生</option>
    			<option value="Teacher">教师</option>
    			<option value="Admin">管理员</option>
    			<option value="OtherPeople">校外人员</option>
    			</select>
    
    </div><br>
    
    <div align="center">
    <input id="submit" type="button" value="提交" >
    <input  type="reset" value="重置" ></div>
    </form>
  </body>
</html>
