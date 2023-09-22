<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="./css/app.css">
    <link rel="stylesheet" href="./css/theme.css">
</head>
<body>
<div align = "center">

<h2>회원탈퇴</h2>
<%
int id=Integer.parseInt(request.getParameter("hiddenId"));
%>

<form name=deleteform action="deleteInsert.dd" >
    비밀번호 확인 : <input type="text" name="user_pwd" size="6"><p style="margin-top:10px"> 
    <input type="hidden" name="user_id" value="<%=id %>">                    
    <input type="submit" value="delete">
    <input type="reset" value="cancle">
</form>
</div>
</body>
</html>