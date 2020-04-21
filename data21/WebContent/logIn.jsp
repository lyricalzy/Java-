<%@page import="db.MemberDAO"%>
<%@page import="db.MemberDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 결과</title>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPw(pw);
			
			MemberDAO dao = new MemberDAO();
			if(dao.idCheck(dto)){
				out.print("로그인 성공");
			}else{
				out.print("로그인 실패");
			}
		%>
	</body>
</html>