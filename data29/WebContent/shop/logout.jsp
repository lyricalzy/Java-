<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 세션 끊어줌
	session.invalidate();
	response.sendRedirect("member.jsp");
%>
<!-- 서버가 다음페이지를 지정하여 호출한 후, 결과를 클라이언트에게 넘김 -->
<!-- 서버가 임의로 호출한 경우에는 브라우저에 기록이 남지 않음. -->
<%-- <jsp:forward page="member.jsp"></jsp:forward> --%>