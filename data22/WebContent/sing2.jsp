<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회사 제품 페이지</title>
	</head>
	<body>
		<center>
			<div id="top"> 
				<!-- 동적 태그: jsp -->
				<jsp:include page="top.jsp"></jsp:include>
			</div>
			<hr color="blue" width="300">
			
			<div id="center" style="width: 10%">
				판매하는 품목:
				<ul type="square">
					<li align="left">생선</li>
					<li align="left">야채</li>
					<li align="left">해산물</li>
				</ul>
				
				판매하는 순서:
				<ol type="A">
					<li align="left">오프라인 판매</li>
					<li align="left">온라인 판매</li>
					<li align="left">방문 판매</li>
				</ol>
			</div>
			
			<hr color="red" width="300">
			
			<div id="bottom">
				<jsp:include page="bottom.jsp"></jsp:include>
			</div>
		</center>
	</body>
</html>