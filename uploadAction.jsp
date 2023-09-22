<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
<%
int id = 0;

try{
id = (int)session.getAttribute("id");  // request에서 id 파라미터를 가져온다
if( id == 0 ){                            // id가 Null 이거나 없을 경우
	response.sendRedirect("login.jsp");    // 로그인 페이지로 리다이렉트 한다.
}
String directory = application.getRealPath("userimg");
int maxSize = 1024 * 1024 * 100;
String encoding = "UTF-8";

MultipartRequest multi
= new MultipartRequest(request, directory, maxSize, encoding,
		new DefaultFileRenamePolicy());

String fileSystemName = multi.getFilesystemName("file");

new FileDAO().upload(id, fileSystemName);

response.sendRedirect("author.jsp");

}catch(Exception ex){response.sendRedirect("login.jsp");}%> 
</body>
</html>