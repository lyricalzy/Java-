<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 페이지</title>
		<link rel="stylesheet" type="text/css" href="../css/shop.css"/>
	</head>
	<body>
		<!-- div를 계층적으로 사용할 수 있다. -->
		<div id="total">
			<div id="top1"> <!-- 메뉴 -->
				<jsp:include page="top1.jsp"></jsp:include>
			</div> 
			<!-- 장바구니 -->
			<div id="top2">
				<jsp:include page="top2.jsp"></jsp:include>
			</div>
			<!-- 각 메뉴별 내용 -->
			<div id="center">
			각 페이지 내용 들어가는 부분
			</div> 
		</div>
	</body>
</html>
