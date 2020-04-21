<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" type="text/css" href="../css/shop.css" />
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#b1').click(function() {
			$.ajax({
				url : "login.jsp",
				data : {
					id : $('#id').val(),
					pw : $('#pw').val()
				},
				success : function(result) {
					console.log(result)
					if (result == "false") {
						$('#center').append("<span style=color:white;>로그인 실패</span>")
					} else {
						location.href = "member.jsp"
					}
				}
			})
		})
	})
</script>
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
				if (session.getAttribute("id") == null) {
			%>
			id: <input type="text" name="id" id="id"> pw: <input
				type="text" name="pw" id="pw">
			<button type="button" id="b1">로그인</button>
			<%
				} else {
					// 세션이 설정되어 있으면, 세션 정보를 보여주어야 함
			%>
			<span style="color: white;"><%=session.getAttribute("id")%>님 환영합니다.</span>
			<a href="logout.jsp" style="color: blue;">로그아웃</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>