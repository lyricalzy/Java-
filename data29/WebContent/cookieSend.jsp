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
		Cookie cookie1 = new Cookie("name","hong");
		Cookie cookie2 = new Cookie("age","100");
		
		// reponse: 내장된 객체
		// 웹서버가 클라이언트에 명령을 할 때 사용
		// response.sendRedirect("a.jsp")
		// 웹서버가 클라이언트에게 a.jsp를 호출하도록 명령
		response.addCookie(cookie1);
		response.addCookie(cookie2);
	%>
</body>
</html>