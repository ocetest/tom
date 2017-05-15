<%@page import="csphere.xc.dao.user_select"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
user_select select = new user_select();
String name1 = select.select();
request.setAttribute("name", name1);
%>
<html>
<head>
<title> Jerry </title>
</head>

<body>
<h1>Improve some function</h1>

<h2>20170513! You are  <%=name1 %> !</h2>
</body>
</html>
