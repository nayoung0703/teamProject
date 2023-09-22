<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Author - Pintereso Bootstrap Template</title>
    <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
    <link rel="stylesheet" href="./css/app.css">
    <link rel="stylesheet" href="./css/theme.css">

</head>

<body>
<!-- session 받아오기 LoginInsert.java 파일에서 로그인 성공시에 id 값 session에 저장 -->
<%
int id = 0;

try{
id = (int)session.getAttribute("id");  // request에서 id 파라미터를 가져온다
if( id == 0 ){                            // id가 Null 이거나 없을 경우
	response.sendRedirect("login.jsp");    // 로그인 페이지로 리다이렉트 한다.
}
%>
	<jsp:include page="header.jsp" >
		<jsp:param value="<%=id %>" name="id"/>
	</jsp:include>
	
    
    <main role="main">
    <div class="jumbotron border-round-0 min-50vh" style="background-image:url(https://images.unsplash.com/photo-1522204657746-fccce0824cfd?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=84b5e9bea51f72c63862a0544f76e0a3&auto=format&fit=crop&w=1500&q=80);">
    </div>
    <div class="container mb-4">
    	<img src="userimg/<%=cdao.userProfile(id)%>" class="mt-neg100 mb-4 rounded-circle" width="128">
    	<h1 class="font-weight-bold title"><%=cdao.userNick(id)%></h1>
    	<p>
    		이름 작성하기
    	</p>
    </div>
    <div class="container-fluid mb-5">
    	<div class="row">
    		<div class="card-columns">
  <%
  	List<PostVO> list = pdao.authorListAll(id);
  	
  	for(PostVO ivo : list){ // 전체게시글 출력
  %>	
    			<div class="card card-pin">
    				<img class="card-img" src="img/<%=ivo.getPostImg() %>" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title"><%=ivo.getStoreName() %></h2>
    					<div class="more">
    						<a href="AuthorDetail.do?postid=<%=ivo.getPostId()%>">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>	
 <%} %>		
    		</div>
    	</div>
    </div>
        
    </main>

    <script src="./js/app.js"></script>
    <script src="./js/theme.js"></script>
    
    <jsp:include page="footer.jsp"/>
<%}catch(Exception ex){response.sendRedirect("login.jsp");}%> 
<!-- session 받아오기 end-->
</body>
    
</html>
