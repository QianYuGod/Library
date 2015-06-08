<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<String> records=new ArrayList<String>();
 records=(ArrayList<String>)request.getAttribute("records");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>return</title>
    
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
  <h1>还书</h1>
   <table border="2" cellpadding="1" cellspacing="3"><tr><th>bookName</th><th>action</th></tr>
   <% for(int i=0;i<records.size();i++) {
       
  %>
  <tr><td><%=records.get(i) %></td>
  <td><a href="Operate.action?operate=change2&bookName=<%=records.get(i)%>">还书</a></td>
</tr>
<% }%>
</table>
  </body>
</html>
