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
		session.setAttribute("id", "hahaha");
	%>
	<form action="selectOne.jsp">
		검색할 no: <input type="text" name="no"><input type="submit"
			value="게시물 검색">
	</form>
</body>
</html>