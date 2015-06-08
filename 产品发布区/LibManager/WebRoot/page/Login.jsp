<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   
     <h1 align="center">  欢迎使用图书馆管理系统</h1> <br>
     <a href="login?action=register">没有账号，先注册</a>
    <form action="login" method="post">
    <table>
    	<tr><th>用户名</th><td><input type="text" name="username"/></td></tr>
    	<tr><th>密码</th><td><input type="password" name="password"/></td></tr>
    	
    	<tr><td>身份</td><td><select name="identity">
    			<option value="Student">学生</option>
    			<option value="Teacher">教师</option>
    			<option value="Admin">管理员</option>
    			<option value="OtherPeople">校外人员</option>
    	</select></td></tr>
    	<tr><td><input type="submit" value="登录"></td>
    	<td><input type="reset" value="重置"></td></tr>
    	</table>
    </form>
  </body>
</html>
