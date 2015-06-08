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
    
    <title>My JSP 'BookAlter.jsp' starting page</title>
    
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
  	<%! Book book = new Book(); %>
  	<% book = (Book) request.getSession().getAttribute("Book"); %>
    <form action="bookManage" method="post">
    	<h1>修改图书信息</h1>
    	<hr>
    	<input type="hidden" name="operate" value="alter"/>
    	图书名称&nbsp;&nbsp;&nbsp;<input type="text" name="bookName" value="<%= book.getBookName() %>"/><br>
    	图书编号&nbsp;&nbsp;&nbsp;<input type="text" name="bookNumber" value="<%= book.getBookName() %>"/><br>
    	图书作者&nbsp;&nbsp;&nbsp;<input type="text" name="bookAuthor" value="<%= book.getBookAuthor() %>"/><br>
    	图书简介&nbsp;&nbsp;&nbsp;<input type="text" name="bookInfo" value="<%= book.getBookInfo() %>"/><br>
    	图书出版社&nbsp;&nbsp;&nbsp;<input type="text" name="bookPublicHouse" value="<%= book.getBookPublicHouse() %>"/><br>
    	图书所在书架&nbsp;&nbsp;&nbsp;<input type="text" name="bookShelf" value="<%= book.getBookShelf() %>"/><br>
    	图书状态&nbsp;&nbsp;&nbsp;<input type="text" name="bookState" value="<%= book.getBookState() %>"/><br>
    	<input type="submit" value="确定"/>
    </form>
  </body>
</html>
