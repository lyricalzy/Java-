<%@page import="java.util.ArrayList"%>
<%@page import="bean.BasketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//basket세션을 가지고 와서 list의 개수를 세준다.
	ArrayList<BasketDTO> list = (ArrayList<BasketDTO>) session.getAttribute("basket");
	int size = 0;
	if(list != null){
		size = list.size();
	}
%><p style="color: blue; text-align: center;">장바구니: <%= size%>개</p>
<p style="color: red; text-align: center;">구매금액: <%= session.getAttribute("total")%>원</p>