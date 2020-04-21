<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 1. 클라이언트가 넘긴 값을 받아온다.(request) -->
		<!-- 2. 요청한 인증번호를 만들어 처리한다. -->
		<!-- 3. 인증번호를 클라이언트에게 전송 -->	
		<% // 스크립트릿
			String tel = request.getParameter("tel");
			String no = "5647";
		%>
		<%= no %> <!-- out.print(no);, 표현식(expression) -->
	</body>
</html>