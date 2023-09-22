<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>

<%@ page import="net.hb.common.*" %>
<%@ page import="net.hb.user.*"  %>
<%@ page import="net.hb.post.*"  %>
<%@ page import="net.hb.store.*"  %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.OutputStream" %>

<%@ page import="net.hb.chat.*" %>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>   </title>
 <style type="text/css">
   *{font-size: 14pt; font-weight:bold;}
   a{font-size: 14pt; text-decoration:none; color:blue; }
   a:hover{font-size: 16pt; color:blue;}
 </style>
</head>
<body>
 <%!
   Connection CN = null;
   Statement ST = null;
   PreparedStatement PST = null;
   ResultSet RS = null ;
   String msg = "";
   int OK = 0;
   int Gdata = 0;
   int userid=0, userpwd=0; 
   String username="", usernick="", userprofile="";
	
   int userId=0, postId=0, postGrade=0;
   String storeName="", postImg="", postText="";
   Date postdate;
 %>

 <%
  try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
	//System.out.println("------ db연결 성공했습니다 23-07-13 ------ ");
	//out.println("<h2> ------ db연결 성공했습니다 23-07-13 ------ </h2> ");
	ST = CN.createStatement();
  }catch(Exception ex){System.out.println("db에러:"+ex);}
 %>

<%!
  //MVC1모델1=순수자바 GuestDAO.java, GuestVO.java + Web문서 ~~.jsp
  CustomerDAO cdao = new CustomerDAO();
  CustomerVO cvo = new CustomerVO();
  PostDAO pdao = new PostDAO();
  PostVO pvo = new PostVO();
  StoreDAO sdao =  new StoreDAO();
  StoreVO svo = new StoreVO();
  ChatVO chvo = new ChatVO();
  ChatDAO chdao = new ChatDAO();
  MessagesVO mvo = new MessagesVO();
%>
</body>
</html>









