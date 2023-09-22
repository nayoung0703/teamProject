<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    *{font-size:12pt; font-weight:bold;}      
           
  </style>
<script type="text/javascript">

function checkId(){
    var userId = document.subform.userId.value;
    if(userId == "" | userId==null){
	  alert("아이디를 입력해주세요."); 
	  history.back();
	  document.subform.userId.focus();
	  return  false;
	}else{
		document.subform.submit();
	}

}//end

</script>
</head>
<body>

<%   String userId = request.getParameter("id");  %>

 <p>
 <div align="center">
  <form name="subform" action="Idinsert.dd">
    <font>아이디:</font>
        <input type="text" name="userId">
        <input type="button" value="중복확인" onclick="checkId();"> 
  </form>
 </div>
 
 	
</body>
</html>