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
    
    <title>My JSP 'userDelete.jsp' starting page</title>
    
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
  	<%! List<String> namelist=new ArrayList<String>(); %>
  	<% namelist = (List<String>) request.getSession().getAttribute("Namelist"); %>
    <h1>图书管理系统</h1>
    <strong>人名：</strong>
    <form action="userDelete" method="post">
    <table>
    	<% for(int i=0; i < namelist.size();i++){ %>
    	<tr><td><%= namelist.get(i) %></td><td><input type="submit" name="delete" value="删除"></td></tr>
    </table>
    <% } %>
    </form>
  </body>
</html>
