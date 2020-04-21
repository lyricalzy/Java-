<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객센터 페이지</title>
	</head>
	<body>
		<center>
			<div id="top"> 
				<!-- 동적 태그: jsp -->
				<jsp:include page="top.jsp"></jsp:include>
			</div>
			<hr color="blue" width="300">
			
			<div id="center">
				<audio controls src="media/horse.mp3"></audio><br>
				<video width="320" height="240" controls="controls">
					<source src="media/mov_bbb.mp4" type="video/mp4">
				</video>
			</div>
			
			<hr color="red" width="300">
			
			<div id="bottom">
				<jsp:include page="bottom.jsp"></jsp:include>
			</div>
		</center>
	</body>
</html>