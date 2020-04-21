<%@page import="bean.BbsDTO"%>
<%@page import="bean.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:useBean id="dto" class="bean.BbsDTO"></jsp:useBean>
		<jsp:setProperty property="no" name="dto"/>
		<%
			BbsDAO dao = new BbsDAO();
			BbsDTO dto2 = dao.select(dto);
		%>
		<h3>게시물 검색 결과입니다.</h3>
		<hr>
		<table border="1">
			<tr>
				<td><label>게시물 번호</label></td><td><label><%= dto2.getNo() %></label></td>
			</tr>
			<tr>
				<td><label>게시물 제목</label></td><td><label><%= dto2.getTitle() %></label></td>
			</tr>
			<tr>
				<td><label>게시물 내용</label></td><td><label><%= dto2.getContent() %></label></td>
			</tr>
			<tr>
				<td><label>게시물 작성자</label></td><td><label><%= dto2.getWriter() %></label></td>
			</tr>
		</table>
		
	</body>
</html>