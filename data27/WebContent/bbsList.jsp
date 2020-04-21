<%@page import="java.util.ArrayList"%>
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
		<%
			BbsDAO dao = new BbsDAO();
			ArrayList<BbsDTO> list = dao.list();
		%>
		<h3>게시판 입니다.</h3>
		<hr>
		<table border="1">
			<tr>
				<td><label>게시물 번호</label></td>
				<td><label>게시물 제목</label></td>
				<td><label>게시물 내용</label></td>
				<td><label>게시물 작성자</label></td>
			</tr>
			<%
				for(BbsDTO dto2:list){
			%>
			<tr>
				<td><label><%= dto2.getNo() %></label></td>
				<td><label><a href="bbsOne.jsp?no=<%= dto2.getNo() %>"><%= dto2.getTitle() %></a></label></td>
				<td><label><%= dto2.getContent() %></label></td>
				<td><label><%= dto2.getWriter() %></label></td>
			</tr>
			<%
				}
			%>
		</table>
		
	</body>
</html>
