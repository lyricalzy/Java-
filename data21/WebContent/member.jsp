<%@page import="db.MemberDAO"%>
<%@page import="db.MemberDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 스크립트릿 -->
		<%
			/* request: 미리 만들어져 있는 객체, 내장된 객체, built-in */
			// 클라이언트 ----> 웹서버
			// 클라이언트가 입력하여 전송한 데이터를 웹서버가 받아주는 역할
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String com = request.getParameter("com");
			String tel = request.getParameter("tel");
			String gender = request.getParameter("gender");
			String[] hobby = request.getParameterValues("hobby");
			String list = "";
			if(hobby != null){
				for(String s: hobby){ // for-each
					list = list + s + " ";
				}
			}else{
				list = "없음";
			}
			String word = request.getParameter("word");
			if(word.equals("")){
				word = "작성하지 않음";
			}
			
			// ctrl+shift+m = 자동 import
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setTel(com+"-"+tel);
			MemberDAO dao = new MemberDAO();
			dao.insert(dto);
		%>
		받은 아이디는: <% out.print(id); %><br>
		받은 패스워드는: <%= pw %><br><!-- 표현식(expression) -->
		받은 이름은: <%= name %><br>
		받은 연락처는: <%= com %>-<%= tel %><br>
		받은 성별은: <%= gender %>자<br>
		받은 취미는: <%= list %><br>
		하고 싶은 말은: <%= word %>
	</body>
</html>