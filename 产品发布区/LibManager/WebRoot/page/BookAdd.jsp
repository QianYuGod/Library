<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BookAdd.jsp' starting page</title>
    
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
    <form action="bookManage" method="post">
    	<input type="hidden" name="operate" value="entry"/>
    	图书名称&nbsp;&nbsp;&nbsp;<input type="text" name="bookName"/><br>
    	图书编号&nbsp;&nbsp;&nbsp;<input type="text" name="bookNumber"/><br>
    	图书作者&nbsp;&nbsp;&nbsp;<input type="text" name="bookAuthor"/><br>
    	图书简介&nbsp;&nbsp;&nbsp;<input type="text" name="bookInfo"/><br>
    	图书出版社&nbsp;&nbsp;&nbsp;<input type="text" name="bookPublicHouse"/><br>
    	图书所在书架&nbsp;&nbsp;&nbsp;<input type="text" name="bookShelf"/><br>
    	图书状态&nbsp;&nbsp;&nbsp;可借<input type="hidden" name="bookState" value="1"/><br>
    	<input type="submit" value="录入"/>&nbsp;&nbsp;&nbsp;
    	<input type="reset" value="重置"/>
    </form>
  </body>
</html>
