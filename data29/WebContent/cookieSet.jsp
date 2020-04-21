<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie hc = new Cookie("hobby","tennis");
	Cookie tc = new Cookie("tour","yangyang");
	Cookie dc = new Cookie("date","20200407");
	
	response.addCookie(hc);
	response.addCookie(tc);
	response.addCookie(dc);
%>
<a href="cookieGet.jsp">cookieGet.jsp</a>
<a href="cookieDelete.jsp">cookieGet.jsp</a>
</body>
</html>