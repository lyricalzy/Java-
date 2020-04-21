<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회사 구성원 페이지</title>
	</head>
	<body>
		<center>
			<div id="top"> 
				<!-- 동적 태그: jsp -->
				<jsp:include page="top.jsp"></jsp:include>
			</div>
			<hr color="blue" width="300">
			
			<div id="center">
				<table border="1" style="border-color: green;">
					<tr align="center">
						<td width="80" style="background: pink;">부서</td>
						<td width="80" style="background: yellow;">이름</td>
						<td width="80" style="background: lime;">직급</td>
					</tr>
					<tr align="center">
						<td style="font-style: italic; font-weight: bold;">기획</td>
						<td>박기획</td>
						<td>과장</td>
					</tr>
					<tr align="center">
						<td>영업</td>
						<td>박영업</td>
						<td>대리</td>
					</tr>
					<tr align="center">
						<td>교육</td>
						<td>박대리</td>
						<td>사원</td>
					</tr>
				</table>
			</div>
			
			<hr color="red" width="300">
			
			<div id="bottom">
				<jsp:include page="bottom.jsp"></jsp:include>
			</div>
		</center>
	</body>
</html>