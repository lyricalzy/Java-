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
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
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
			<table>
				<tr>
					<th>상품id</th><th>상품 명</th><th>상품 가격</th><th>상품 수량</th>
				</tr>
				<%
					ArrayList<BasketDTO> list = (ArrayList<BasketDTO>)session.getAttribute("pay");
					
				%>
			
			
			</table>
		</div>
	</div>
</body>
</html>