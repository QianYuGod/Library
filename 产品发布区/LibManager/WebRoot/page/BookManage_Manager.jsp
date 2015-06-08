<%@ page language="java" import="java.util.*" import="bean.User" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BookManage.jsp' starting page</title>
    
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
    <%! User user = new User();
    	List<String> bookNameList = new ArrayList<String>(); 
    %>
    <% user = (User) request.getSession().getAttribute("User"); 
    	bookNameList = (List<String>) request.getSession().getAttribute("bookNameList"); %>
    	
    你好！<%= user.getUsername() %>先生,您的身份是<%= user.getIdentity() %>。
    <hr>
    <h1>图书信息</h1>
    <table>
    	<% for(int i = 0; i < bookNameList.size(); i++){ %>
    		<tr><td><%= bookNameList.get(i) %></td><td><a href="bookManage.action?operate=query&bookName=<%=bookNameList.get(i)%>">查看</a></td></tr>
    	<%} %>
    </table>
    <form action="bookManage" method="post">
    	<input type="hidden" name="operate" value="add"/>
    	<input type="submit" value="图书录入"/>
    </form>
  </body>
</html>
