<%@page import="bean.BasketDTO"%>
<%@page import="sun.swing.BakedArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" type="text/css" href="../css/shop.css" />
</head>
<body>
	<!-- div를 계층적으로 사용할 수 있다. -->
	<div id="total">
		<div id="top1">
			<!-- 메뉴 -->
			<jsp:include page="top1.jsp"></jsp:include>
		</div>
		<!-- 장바구니 -->
		<div id="top2">
			<jsp:include page="top2.jsp"></jsp:include>
		</div>
		<!-- 각 메뉴별 내용 -->
		<div id="center">
			<%
				// 세션이 설정되어 있지 않으면, 로그인 화면을 보여주고
				if (session.getAttribute("id") != null) {
			%>
			<span style="color: blue;"><%=session.getAttribute("id")%></span> <span
				style="color: white;">님의 장바구니 화면입니다.</span>
			<%
				}
			%>
			<hr>
			<jsp:useBean id="dto" class="bean.BasketDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto" />
			<%
				// 장바구니를 한번도 사용하지 않았다면 세션으로 가지고 있을 이유가 없다
				// 장바구니 세션이 없으면, 장바구니를 한번도 사용하지 않았다는 의미
				ArrayList<BasketDTO> list = (ArrayList<BasketDTO>) session.getAttribute("basket");
				if(list == null){ // 장바구니 세션이 없다
					list = new ArrayList<BasketDTO>();
				}
				if(dto.getId() != null){
					list.add(dto);
					session.setAttribute("basket", list);
				}
			%><span style="color: white;"><%= list %></span>
			<hr>
			<span style="color: white;"><%= list.size() %></span>
		</div>
	</div>
</body>
</html>