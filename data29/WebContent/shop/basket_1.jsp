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
<script type="text/javascript">
	$(function() {
		$('#form').submit(function() {
			dataValue = $(this).serialize() // 전달할 데이터를 JSON객체로 만들어줌
			console.log(dataValue)
			$.ajax({
				url: "order.jsp",
				data: dataValue,
				success: function(result) {
					alert(result+ "주문완료!")
				}
			})
			return false // 페이지 안넘어감
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
			<span style="color: blue;"><%=session.getAttribute("id")%></span> <span
				style="color: white;">님의 장바구니 화면입니다.</span>
			<%
				}
			%>
			<hr>
			<jsp:useBean id="dto" class="bean.BasketDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto" />
			<%
				// 장바구니를 한번도 사용하지 않았다면 세션으로 가지고 있을 이유가 없다
				// 장바구니 세션이 없으면, 장바구니를 한번도 사용하지 않았다는 의미
				ArrayList<BasketDTO> list = (ArrayList<BasketDTO>) session.getAttribute("basket");
				if(list == null){ // 장바구니 세션이 없다
					list = new ArrayList<BasketDTO>();
				}
				if(dto.getId() != null){
					list.add(dto);
					session.setAttribute("basket", list);
				}
			%><span style="color: white;"><%= list.size() %>개가 장바구니에 들어있습니다.</span>
			<hr>
			<form id="form">
			<table border="1">
				<tr>
					<th>상품 id</th><th>상품 가격</th><th>상품 수량</th><th>주문하기</th>
				</tr>
				<%
					for(BasketDTO dto2 : list){
				%>
				<tr>
					<td>
						<input type="text" name="id" id="id" value="<%= dto2.getId() %>">
					</td>
					<td>
						<input type="text" name="price" id="price" value="<%= dto2.getPrice() %>">
					</td>
					<td>
						<input type="text" name="count" id="count" value="1">
					</td>
					<td><button type="submit" id="button">주문하기</button></td>
				</tr>
				<%} %>
			</table>
			</form>
		</div>
	</div>
</body>
</html>