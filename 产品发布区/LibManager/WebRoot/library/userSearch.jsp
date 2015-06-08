<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userSearch.jsp' starting page</title>
    
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
    <h1 align="center">图书管理系统</h1>
    <form action="userSearch" method="post">
    	用户查询：<br>
    	用户名：<input type="text" name="username"><br>
    	
    	身份：<select name="identity">
    	<option value="Student">学生</option>
    			<option value="Teacher">教师</option>
    			<option value="Admin">管理员</option>
    			<option value="OtherPeople">校外人员</option>
    		</select><br>
    	
    	<input type="submit" value="提交">
    	
    	<br>	
    		
    </form>
  </body>
</html>
