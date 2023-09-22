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
id = (int)session.getAttribute("id");  // request에서 id 파라미터를 가져온다
if( id == 0 ){                            // id가 Null 이거나 없을 경우
	response.sendRedirect("login.jsp");    // 로그인 페이지로 리다이렉트 한다.
}
%>
	<jsp:include page="headerIndex.jsp" >
		<jsp:param value="<%=id %>" name="id"/>
	</jsp:include>
	 
	<main role="main">
    <section class="mt-4 mb-5" >
    <div class="container mb-4">
    	
    	<!--<h1 class="font-weight-bold title">Explore</h1> -->
    	<div class="row">
    		<jsp:include page="map.jsp"/>
			<div id="toPost"></div>
    		<nav class="navbar navbar-expand-lg navbar-light bg-white pl-2 pr-2" >
    		<button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExplore" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon" ></span>
    		</button>
    		
    		<div class="collapse navbar-collapse" id="navbarsExplore">
    			<ul class="navbar-nav">
    				<li class="nav-item">
    				<a class="nav-link" href="#">Lifestyle</a>
    				</li>
    				<li class="nav-item">
    				<a class="nav-link" href="#">Food</a>
    				</li>
    				<li class="nav-item">
    				<a class="nav-link" href="#">Home</a>
    				</li>
    				<li class="nav-item">
    				<a class="nav-link" href="#">Travel</a>
    				</li>
    				<li class="nav-item dropdown">
    				<a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">More</a>
    				<div class="dropdown-menu shadow-lg" aria-labelledby="dropdown01">
    					<a class="dropdown-item" href="#">Astronomy</a>
    					<a class="dropdown-item" href="#">Nature</a>
    					<a class="dropdown-item" href="#">Cooking</a>
    					<a class="dropdown-item" href="#">Fashion</a>
    					<a class="dropdown-item" href="#">Wellness</a>
    					<a class="dropdown-item" href="#">Dieting</a>
    				</div>
    				</li>
    			</ul>
    		</div>	
    		</nav>
    	</div>
    </div>
    
    <div class="container-fluid" id="post">
    	<div class="row">
    		<div class="card-columns">
<%
		List<PostVO> postList = pdao.postListAll(); // 전체 게시글 DB에서 가져오기 
		for(PostVO ivo : postList){ // 전체게시글 출력
%>   
    			<div class="card card-pin"> 
    				<img class="card-img" src="img/<%=ivo.getPostImg()%>" alt="Card image"> 
    				<div class="overlay">
    					<h2 class="card-title title"><%=ivo.getStoreName()%></h2>
    					<div class="more">
    						<a href="postDetail.do?postid=<%=ivo.getPostId()%>">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
 <%
		}// for END
%>   	
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
