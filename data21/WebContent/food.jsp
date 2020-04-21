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
			String best = request.getParameter("best");
			String worst = request.getParameter("worst");
			out.print("내가 가장 좋아하는 음식은 " + best + "<br>");
			out.print("내가 가장 싫어하는 음식은 " + worst);
		%>
	</body>
</html>