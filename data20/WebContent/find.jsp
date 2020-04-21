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
			// 자바 코드 넣는 부분
			// 1. 넘어온 값 "자동차"를 받아와야 함
			// http방법으로 전송할 것임
			String word = request.getParameter("word"); // 자동차
			
			out.print("당신이 검색한 단어는 " + word + "군요");
			// 2. db에 연결해서, 결과값 받아와야 함
			// 3. db검색 결과를 다시 클라이언트에게 보내줘야 함 *html로 보내주어야 함
		%>
	</body>
</html>