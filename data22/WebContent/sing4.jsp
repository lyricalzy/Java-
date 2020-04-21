<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회사 오시는길 페이지</title>
	</head>
	<body>
		<center>
			<div id="top"> 
				<!-- 동적 태그: jsp -->
				<jsp:include page="top.jsp"></jsp:include>
			</div>
			<hr color="blue" width="300">
			
			<div id="center" style="width: 20%">
				<img alt="" src="img/map.jpg" width="200" height="200"><br>
				회사오시는 길 순서:
				<ol type="A">
					<li align="left">지하철 1호선 가산디지털역 3번 출구</li>
					<li align="left">독산동 방면으로 10분 도보</li>
					<li align="left">W몰 옆 건물 벽산디지털밸리</li>
				</ol>
			</div>
			
			<hr color="red" width="300">
			
			<div id="bottom">
				<jsp:include page="bottom.jsp"></jsp:include>
			</div>
		</center>
	</body>
</html>