<%@ page language="java" import="java.util.*" import="bean.Book" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Book> books=new ArrayList<Book>();
 books=(ArrayList<Book>)request.getAttribute("bookList");
 Integer  BBookNum=(Integer)request.getAttribute("BBokkNum");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Brrow BOok</title>
    
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
  <h1>图书信息</h1><div >注意:只能借10本</div>
  <div>您已经借阅<%=(Integer)request.getAttribute("BBokkNum") %>本</div>
   <table border="2" cellpadding="1" cellspacing="3" title="借书">
   <tr><th>bookName</th><th>bookState</th><th>action</th></tr>
  <% for(int i=0;i<books.size();i++) {
       
  %>
  <tr><td><%=books.get(i).getBookName() %></td>
  		<td>
  		<%
  		int state=books.get(i).getBookState();
  		if(state==1) {
  		%>可借<% 
  		}
  		else{
  		   %>已借<% 
  		}
  		 %>
  		 </td>
  		<% 
  		   if(state==1&&BBookNum<10){%>
  		<td><a href="Operate.action?operate=change&bookName=<%=books.get(i).getBookName() %>">借阅</a></td>
  		<% }%>
  </tr>
  <%} %>
  </table>
  
  

  </body>
</html>
