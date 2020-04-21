<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회사 소개 페이지</title>
	</head>
	<body>
		<center>
			<div id="top"> 
				<!-- 동적 태그: jsp -->
				<jsp:include page="top.jsp"></jsp:include>
			</div>
			<hr color="blue" width="300">
			
			<div id="center">
				<img alt="" src="img/singsing.jpg" width="300" height="300">
			</div>
			
			<hr color="red" width="300">
			
			<div id="bottom">
				<jsp:include page="bottom.jsp"></jsp:include>
			</div>
		</center>
	</body>
</html>