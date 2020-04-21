<%@page import="bean.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" type="text/css" href="../css/shop.css" />
<jsp:useBean id="dto" class="bean.ProductDTO"></jsp:useBean>
<jsp:setProperty property="id" name="dto" />
<%
	ProductDAO dao = new ProductDAO();
	ProductDTO dto2 = dao.one(dto);
%>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#bag').click(function() {
			$.ajax({
				url: "basket.jsp",
				data: {
					id: <%=dto2.getId()%>,
					price: <%=dto2.getPrice()%>
				},
				success: function(result) {
					alert('장바구니 추가됨')
					//console.log(result)
					move = confirm("장바구니로 이동하시겠습니까?")
					if (move == 1) { // 확인클릭시
						location.href = 'basket.jsp'
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
				if (session.getAttribute("id") != null) {
			%>
			<span style="color: white;"><%=session.getAttribute("id")%>님
				환영합니다.</span> <a href="logout.jsp" style="color: blue;">로그아웃</a>
			<%
				}
			%>
			<table style="color: green; background: yellow;" border="1">
				<tr align="center">
					<th width="100">제품id</th>
					<th width="100">제품명</th>
					<th width="200">가격</th>
					<th width="300">제품 상세 내용</th>
					<th width="300">제품이미지</th>
				</tr>
				<tr align="center">
					<td><%=dto2.getId()%></td>
					<td><%=dto2.getTitle()%></td>
					<td><%=dto2.getPrice()%></td>
					<td><%=dto2.getContent()%></td>
					<td><img src="../img/<%=dto2.getImg()%>" width="300"
						height="150"></td>
				</tr>
				<tr>
					<td colspan="5" align="right">
						<button onclick="location = 'product.jsp'">목록</button>
						<button>
							<img src="../img/bag.png" width="50" height="50" id="bag">
						</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>