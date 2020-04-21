<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
// ������ �ٷ� ���� ���������� ���̴� �����ּҰ� �ƴ϶� ������ �ּҸ� ����ؾ� ��
// ������ ��ġ�� �����ִ� �Լ�: getRealPath()
    String path = request.getRealPath("File");

    int size = 1024 * 1024 * 100; //10M
    String file = ""; // �ε��̵�, ������ �����̸�
    String oriFile = ""; // �������� �̸�
    
    try{
        MultipartRequest multi = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
        
        Enumeration files = multi.getFileNames();
        String str = (String)files.nextElement();
        
        file = multi.getFilesystemName(str); // ������ ����� �����̸�
        oriFile = multi.getOriginalFileName(str); // �������� �̸�
        
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
    file upload success! ������ ��ġ: <%= path %>
    <%
        response.sendRedirect("fileView.jsp?name=" + file);     
    %>
</body>
</html>