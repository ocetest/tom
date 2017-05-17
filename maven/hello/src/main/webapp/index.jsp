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
<title> China  hong</title>

</head>

<body>
<h1>update webapps</h1>

<h2>Sucess or Failed! You are  <%=name1 %> !</h2>
</body>
</html>
