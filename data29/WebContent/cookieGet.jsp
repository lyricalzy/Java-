<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<%
			Cookie[] cookies = request.getCookies();
			for (int i = 1; i < cookies.length; i++) {
		%>
		<tr>
			<td><%=cookies[i].getName()%>:</td>
			<td><%=cookies[i].getValue()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>