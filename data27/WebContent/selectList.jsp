<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberDTO"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			function del(obj) {
			    idValue = $(obj).attr("id")
			    $.ajax({
			    	url: 'memberDelete.jsp',
			    	data: {
			    		id: idValue
			    	},
			    	success: function(result) {
			    		if (result == 0) {
				    		alert('삭제 실패!')
						}else {
				    		alert(id+ ' 삭제 완료!')
							// 버튼인 obj의 부모 = <td>. 다시 <td>의 부모는 <tr> 
						    var tr = $(obj).parent().parent();
						    //라인 삭제
						    tr.remove();
						}
					}
			    })
			}
			$(function() {
				$('#check').click(function() {
					choiceList = $('input:checkbox[class="choice"]:checked')
					choiceList.each(function(i, id) {
						$.ajax({
					    	url: 'memberDelete.jsp',
					    	data: {
					    		id: $(id).val()
					    	},
					    	success: function(result) {
					    		if (result == 0) {
						    		alert('삭제 실패!')
								}else {
						    		alert($(id).val()+ ' 삭제 완료!')
									// 버튼인 obj의 부모 = <td>. 다시 <td>의 부모는 <tr> 
								    var tr = $(id).parent().parent();
								    //라인 삭제
								    tr.remove();
								}
							}
					    })
					})
				})
			})
		</script>
	</head>
	<body>
		<h3 style="color: blue;">검색 결과 입니다.</h3>
		<hr color="red">
		<%
			MemberDAO dao = new MemberDAO();
			ArrayList<MemberDTO> list = dao.list();

			for(MemberDTO dto2:list){
		%>
			아이디: <%= dto2.getId() %><br>
			패스워드: <%= dto2.getPw() %><br>
			이름: <%= dto2.getName() %><br>
			전화: <%= dto2.getTel() %><br>
			<hr color="red">
		<% } %>
		<br>
		<table border="1">
			<tr>
				<td><button style="background: yellow;" id="check">체크</button></td>
				<td>아이디</td><td>패스워드</td><td>이름</td><td>전화</td><td>삭제</td>
			</tr>
		<%
			for(MemberDTO dto2:list){
		%>
			<tr>
				<td>
					<input type="checkbox" value="<%= dto2.getId() %>" class="choice">
				</td>
				<td>
					<a href="selectOne.jsp?id=<%= dto2.getId() %>">
						<%= dto2.getId() %>
					</a>
				</td>
				<td><%= dto2.getPw() %></td>
				<td><%= dto2.getName() %></td>
				<td><%= dto2.getTel() %></td>
				<td><button id="<%= dto2.getId() %>" onclick="del(this)"
							style="background: green;">삭제</button></td>
			</tr>
		<% } %>
		</table>
	</body>
</html>