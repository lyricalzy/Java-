<%@page import="bean.MemberDTO"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 1. 받아서 dto에 넣어야 함 -->
		<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
		<jsp:setProperty property="id" name="dto"/>
						<!-- setId(request.getParameter("id")) -->
		<!-- 2. dao의 select()호출, 결과 받아와야 함 -->
		<%
			MemberDAO dao = new MemberDAO();
			MemberDTO dto2 = dao.select(dto);
		%>
		<!-- 3. 받아온 dto를 html로 만들어줌 -->
		<h3 style="color: blue;">검색 결과 입니다.</h3>
		<hr color="red">
		아이디: <%= dto2.getId() %><br>
		패스워드: <%= dto2.getPw() %><br>
		이름: <%= dto2.getName() %><br>
		전화: <%= dto2.getTel() %><br>
		<hr color="red">
		
		<table border="1">
			<tr>
				<td>아이디</td><td><%= dto2.getId() %></td>
			</tr>
			<tr>
				<td>패스워드</td><td><%= dto2.getPw() %></td>
			</tr>
			<tr>
				<td>이름</td><td><%= dto2.getName() %></td>
			</tr>
			<tr>
				<td>전화</td><td><%= dto2.getTel() %></td>
			</tr>
		</table>
	</body>
</html>