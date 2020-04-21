<%@page import="bean.BasketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	function pay(money) {
		IMP.init('imp35581923');

		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : money, //판매 가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
			location.href = 'product.jsp'
		});
	}
</script>

<jsp:useBean id="dto" class="bean.BasketDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
<%
	ArrayList<BasketDTO> paylist = (ArrayList<BasketDTO>) session.getAttribute("pay");
	if (paylist == null) {
		paylist = new ArrayList<BasketDTO>();
	}
	if (dto.getId() != null) {
		paylist.add(dto);
		session.setAttribute("pay", paylist);
	}
%>
<table border="1">
	<tr>
		<td>상품 id</td>
		<td>상품 가격</td>
		<td>상품 수량</td>
	</tr>
	<%
		int total = 0;
		for (BasketDTO dto2 : paylist) {
			total = total + dto2.getPrice() * dto2.getCount();
	%>
	<tr>
		<td><%=dto2.getId()%></td>
		<td><%=dto2.getPrice()%></td>
		<td><%=dto2.getCount()%></td>
	</tr>
	<%
		}
		session.setAttribute("total", total);
	%>
	<tr>
		<td colspan="2">총 구매가격은 <%=total%>원입니다.
		</td>
		<td><button onclick="pay(<%=total%>)">결제하기</button></td>
	</tr>
</table>