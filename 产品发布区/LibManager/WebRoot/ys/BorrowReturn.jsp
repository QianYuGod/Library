<%@ page language="java" import="java.util.*" import="bean.Record" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Record> records=(List<Record>)request.getAttribute("records");
%>
<%@taglib prefix="c"  uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>BorrowReturn</title>
    
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
    <h1 align="center">借阅信息</h1> <br>
    <table border="1" align="center">
    	<tr><th>借阅人</th><th>借阅书籍</th><th>借阅时间</th><th>借阅状态</th></tr>
    	
    <% for(int i=0;i<records.size();i++) { %>
    	<tr>
    		<td><%=records.get(i).getUsername()%></td>
    		<td><%=records.get(i).getBookName()%></td>
    		<td><%=records.get(i).getTime()%></td>
    		<td><%=records.get(i).getState()%></td>
    	
    		</tr>
    
    	<% }%>
    </table>
    <a href="ys/index.jsp">返回</a>
  </body>
</html>
