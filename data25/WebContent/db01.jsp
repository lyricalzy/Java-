<%@page import="bean.Member1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 넘어오는 값 받기 -->
<!-- 2. DTO객체 만들어서 set메소드로 값 넣기 -->
<!-- 1번 2번 한꺼번에 처리 -->
<!-- 다른 패키지에 있는 클래스를 import해서 객체 생성, 생성된 객체의 이름은 dto -->
<jsp:useBean id="dto" class="bean.Member1DTO"></jsp:useBean>
<!-- 넘어오는 값을 다 받아서, 객체의 이름으로 지정된 dto의 메소드 중
	넘어오는 매개변수 이름과 동일하면 해당 set메소드를 불러서 dto에 넣어줌 -->
<jsp:setProperty property="*" name="dto"/>
<!-- 3. DAO객체 만들어서 insert() 호출 -->
<%
	Member1DAO dao = new Member1DAO();
	dao.insert(dto);
%>
sql문 전송함.