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
	<jsp:setProperty property="*" name="dto" />
	<%
		BbsDAO dao = new BbsDAO();
		int result = dao.update(dto);
		if (result > 0) {
			// 서버 ---> 클라이언트
			// 브라우저에 명령을 할때 사용하는 객체 response
			response.sendRedirect("selectOne.jsp?no="+dto.getNo());
		} else {
			response.sendRedirect("update.jsp?no="+dto.getNo());
		}
	%>
</body>
</html>