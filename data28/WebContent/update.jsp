<%@page import="bean.BbsDTO"%>
<%@page import="bean.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.t1 {
	text-align: center;
	background: green;
	color: white;
	width: 150px;
}
.t2 {
	text-align: center;
	background: orange;
	width: 300px;
}
</style>
</head>
<body>
	<jsp:useBean id="dto" class="bean.BbsDTO"></jsp:useBean>
	<jsp:setProperty property="no" name="dto" />
	<%
		BbsDAO dao = new BbsDAO();
		BbsDTO dto2 = dao.select(dto);
	%>
	<a href="main.jsp">게시물 검색</a>
	<br>
	<form action="update2.jsp">
		<table border="1">
			<tr>
				<td class="t1">번호</td>
				<td class="t2"><%=dto2.getNo()%><input type="hidden" name="no"
					value="<%=dto2.getNo()%>"></td>
			</tr>
			<tr>
				<td class="t1">제목</td>
				<td class="t2"><input type="text" name="title"
					value="<%=dto2.getTitle()%>"></td>
			</tr>
			<tr>
				<td class="t1">내용</td>
				<td class="t2"><input type="text" name="content"
					value="<%=dto2.getContent()%>"></td>
			</tr>
			<tr>
				<td class="t1">작성자</td>
				<td class="t2"><%=session.getAttribute("id")%></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>