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
		$('#pay').click(function() {
			choiceList = $('input:checkbox[class="choice"]:checked')
			choiceList.each(function(i, id) {			
				idValue = $(id).val()
				console.log(idValue)
				$.ajax({
					url : "order.jsp",
					data: {
						id: idValue,
						price : $('.price' + idValue).val(),
						count : $('.count' + idValue).val(),
						logid : "<%=session.getAttribute("id")%>"
					},
					success : function() {
						location.href="order.jsp"
					}
				})
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
			<span style="color: blue;"><%=session.getAttribute("id")%></span> <span
				style="color: white;">님의 장바구니 화면입니다.</span>
			<%
				}
			%>
			<hr>
			<jsp:useBean id="dto" class="bean.BasketDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="dto" />
			<%
				ArrayList<BasketDTO> list = (ArrayList<BasketDTO>) session.getAttribute("basket");
				if (list == null) { // 장바구니 세션이 없다
					list = new ArrayList<BasketDTO>();
				}
				if (dto.getId() != null) {
					list.add(dto);
					session.setAttribute("basket", list);
				}
			%><span style="color: white;"><%=list.size()%>개가 장바구니에 들어있습니다.</span>
			<hr>
			<table border="1">
				<tr>
					<th>상품 id</th>
					<th>상품 가격</th>
					<th>상품 수량</th>
					<th>주문하기</th>
				</tr>
				<%
					for (BasketDTO dto2 : list) {
				%>
				<tr>
					<td><input type="text" class="id" name="id" id="id"
						value="<%=dto2.getId()%>"></td>
					<td><input type="text" class="price<%=dto2.getId()%>"
						name="price" id="price" value="<%=dto2.getPrice()%>"></td>
					<td><input type="text" class="count<%=dto2.getId()%>"
						name="count" id="count" value="1"></td>
					<td><input type="checkbox" value="<%=dto2.getId()%>"
						class="choice"></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="4" align="right">
						<button type="button" id="pay">주문하기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
