<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="check.jsp" method="post">
		검색어<input type="text" name="find">
		<input type="submit" value="검색">
	</form>
	<hr>
	<form action="FileUploadOK.jsp" method="post" enctype="multipart/form-data">
		파일 첨부 <input type="file" name="file"><br><br>
		<input type="submit" value="파일 업로드">
	</form>
</body>
</html>