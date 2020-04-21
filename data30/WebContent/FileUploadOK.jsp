<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
// 파일을 다룰 때는 브라우저에서 보이는 가상주소가 아니라 물리적 주소를 사용해야 함
// 물리적 위치를 구해주는 함수: getRealPath()
    String path = request.getRealPath("File");

    int size = 1024 * 1024 * 100; //10M
    String file = ""; // 인덱싱된, 수정된 파일이름
    String oriFile = ""; // 원본파일 이름
    
    try{
        MultipartRequest multi = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
        
        Enumeration files = multi.getFileNames();
        String str = (String)files.nextElement();
        
        file = multi.getFilesystemName(str); // 실제로 저장된 파일이름
        oriFile = multi.getOriginalFileName(str); // 원본파일 이름
        
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
    file upload success! 물리적 위치: <%= path %>
    <%
        response.sendRedirect("fileView.jsp?name=" + file);     
    %>
</body>
</html>