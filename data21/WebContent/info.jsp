<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- @는 페이지에 대한 설정값 -->
    <!-- 이 페이지를 java로 만들겠다. java가 default기때문에 지워도 상관없음 -->
    <!-- html형태로 출력하겠다. 글자와 페이지의 인코딩은 UTF-8로 하겠다. -->
    <!-- tomcat에게 java로 하라고 지시해줌: 지시자 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<% // 스크립트릿, scriptlit
			// 1. 클라이언트로부터 온 데이터 4개를 받아야 함
			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String company = request.getParameter("company");
			String tel = request.getParameter("tel");
			out.print("당신의 이름은 " + name + "<br>");
			out.print("당신의 나이는 " + age + "<br>");
			out.print("당신의 소속은 " + company + "<br>");
			out.print("당신의 연락처는 " + tel + "<br>");
		%>
	</body>
</html>