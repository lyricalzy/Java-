<%@page import="bean.MemberDAO"%><%@page import="bean.MemberDTO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
String id = request.getParameter("id");
MemberDTO dto = new MemberDTO();
dto.setId(id);
MemberDAO dao = new MemberDAO();
int result = dao.idOver(dto);
String check = "";
if(result == 0){
	check = "사용 가능, 중복된 id없음";
}else {
	check = "사용 불가, 중복된 id있음";
}
%><%= check %>