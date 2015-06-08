<%@ page language="java" import="java.util.*" import="bean.Book" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BookInfo.jsp' starting page</title>
    
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
    <%! Book book = new Book(); 
    	String state = null;
    %>
    <% book = (Book) request.getSession().getAttribute("Book"); 
    	if(book.getBookState() == 1){
    		state = "可借";
    	}else if(book.getBookState() == 0){
    		state = "已借出";
    	}
    		
    %>
    <table>
    	<tr><th>名称</th><td><%= book.getBookName() %></td></tr>
    	<tr><th>编号</th><td><%= book.getBookNumber() %></td></tr>
    	<tr><th>作者</th><td><%= book.getBookAuthor() %></td></tr>
    	<tr><th>简介</th><td><%= book.getBookInfo() %></td></tr>
    	<tr><th>出版社</th><td><%= book.getBookPublicHouse() %></td></tr>
    	<tr><th>所在书架</th><td><%= book.getBookShelf() %></td></tr>
    	<tr><th>状态</th><td><%= state %></td></tr>
    </table>
    <form action="bookManage" method="post">
    	<input type="hidden" name="operate" value="change"/>
    	<input type="submit" value="修改图书信息"/>
    </form>
    <form action="bookManage" method="post">
    	<input type="hidden" name="operate" value="delete"/>
    	<input type="hidden" name="bookName" value="<%= book.getBookName() %>">
    	<input type="submit" value="删除图书"/>
    </form>
  </body>
</html>
