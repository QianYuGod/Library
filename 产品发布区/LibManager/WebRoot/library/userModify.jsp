<%@ page language="java" import="java.util.*" import="bean.User" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userModify.jsp' starting page</title>
    
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
  	<%! User user = new User(); %>
  	<% user=(User)request.getSession().getAttribute("User"); %>
  	<form action="userModify" method="execute">
    <table>
   	 	<tr><th>个人信息</th></tr>
   	 	<tr><th>用户名：</th><td><input type="text" name="username" value="<%= user.getUsername() %>"></td></tr>
   	 	<tr><th>密码：</th><td><input type="text" name="password" value="<%= user.getPassword() %>"></td></tr>
   	 	<tr><th>姓名：</th><td><input type="text" name="name" value="<%= user.getName() %>"></td></tr>
   	 	<tr><th>出生日期：</th><td><input type="text" name="birthday"value="<%= user.getBirthday() %>"></td></tr>
   	 	<tr><th>专业：</th><td><input type="text" name="major" value="<%= user.getMajor() %>"></td></tr>
   	 	<tr><th>学号/工号：</th><td><input type="text" name="id" value="<%= user.getId() %>"></td></tr>
   	 	<tr><th>积称：</th><td><input type="text" name="teacherTitle" value="<%= user.getTeacherTitle() %>"></td></tr>
   	 	<tr><th>身份：</th><td><input type="text" name="identity" value="<%= user.getIdentity() %>"></td></tr>
   	 	<tr><th>工作单位：</th><td><input type="text" name="address" value="<%= user.getAddress() %>"></td></tr>
   	 </table>
   	 <input type="hidden" name="operate" value="modify_sure">
   	 <input type="submit" value="修改"/>
   	 </form>
  </body>
</html>
