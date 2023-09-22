<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home - Pintereso Bootstrap Template</title>
    <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
    
	<link rel="stylesheet" href="./css/app.css">
    <link rel="stylesheet" href="./css/theme.css">

</head>
<style>
	*{scroll-behavior: smooth;}
</style>

<body>
<%
int id = 0;
try{
id = (int)session.getAttribute("id");// request에서 id 파라미터를 가져온다
if( id == 0 ){                            // id가 Null 이거나 없을 경우
	response.sendRedirect("login.jsp");    // 로그인 페이지로 리다이렉트 한다.
}

%>
	<jsp:include page="header.jsp" >
		<jsp:param value="<%=id %>" name="id"/>
	</jsp:include>
	 
	<main role="main">
    <section class="mt-4 mb-5" >
    <div class="container mb-4">

    </div>
    
    <div class="container-fluid" id="post">
    	<div class="row">
    		<div class="card-columns">
    	<form action="MsgReceiveId.dd">
 		<select name="receiveId">
 <%
List<CustomerVO> userIdList = cdao.alluser();

for(CustomerVO i :userIdList){
	if(id!=i.getId()){
%>
  <option value="<%=i.getId()%>"><%=i.getId() %></option>
<%	
	}
}
%>
    	</select>
    	<button type="submit">메세지 보내기</button>
    	</form>
    		
	
    		</div>
    	</div>
    </div>
    </section>
        
    </main>

    <script src="./js/app.js"></script>
    <script src="./js/theme.js"></script>
    
    <jsp:include page="footer.jsp"/>
<%}catch(Exception ex){response.sendRedirect("login.jsp");}%>
<!-- session 받아오기 end-->    
</body>
    
</html>