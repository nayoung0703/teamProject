<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 int userId = (int)request.getAttribute("id");
 boolean idOk = (boolean)request.getAttribute("idOk");
if(!idOk){
%>
  <script type="text/javascript">
     alert("<%=userId%> 는 사용가능한 ID입니다");
     opener.formJoin.userId.value = <%=userId%>;
     self.close();
  </script>
<%	
}else{
%>
  <script type="text/javascript">
     alert("<%=userId%> 는 중복된 ID입니다.");
     history.back();
  </script>	
<%	
}
%>

<form name="formCheckTransfer" action="join.jsp">
	<input type="hidden" name="idOk" value="<%=idOk%>">
	
</form>

</body>
</html>