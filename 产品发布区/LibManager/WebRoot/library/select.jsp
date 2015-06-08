<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Reader Manage</title>
    
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
    
    <strong>请选择您要选择的操作：</strong><br>
    <form action="operate_select"  method="post">
    <input type="hidden" name="select" value="userSearch"/>
    <input type="submit" value="读者信息查询"></form><br>
    
    
    <form action="operate_select"  method="post">
    <input type="hidden" name="select" value="userDelete"/>
    <input type="submit" value="读者信息删除"><br>
    </form>
  </body>
</html>
