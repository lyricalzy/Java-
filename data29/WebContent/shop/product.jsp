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
<style type="text/css">
a:hover{
	background: red;
	font-size: 30px;
	font-weight: bold;
	font-style: italic;
	text-decoration: overline;
}
</style>
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
				ProductDAO dao = new ProductDAO();
				ArrayList<ProductDTO> list = dao.list();
			%>
			<table style="color: green; background: yellow;" border="1">
				<tr align="center">
					<th width="100">제품id</th>
					<th width="120">제품명</th>
					<th width="200">가격</th>
					<th width="300">제품이미지</th>
				</tr>
				<%
					for (ProductDTO dto2 : list) {
				%>
				<tr align="center">
					<td><%=dto2.getId()%></td>
					<td><a href="productOne.jsp?id=<%=dto2.getId()%>"><%=dto2.getTitle()%></a></td>
					<td><%=dto2.getPrice()%></td>
					<td><img src="../img/<%=dto2.getImg()%>" width="300"
						height="150"></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>