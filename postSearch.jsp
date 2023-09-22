<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Post - Pintereso Bootstrap Template</title>
    <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
    <link rel="stylesheet" href="./css/app.css">
    <link rel="stylesheet" href="./css/theme.css">
	<style>
		.empty{
			background-color: #fff;			
			margin-top: 100px;
		}
		.empty .direction{
			width: 35%;
			text-align : left;
		}
	</style>
</head>

<body>
<!-- session 받아오기 LoginInsert.java 파일에서 로그인 성공시에 id 값 session에 저장 -->
<%
int id = 0;

try{
id = (int)session.getAttribute("id");  // request에서 id 파라미터를 가져온다
if(id == 0 ){                            // id가 Null 이거나 없을 경우
	response.sendRedirect("login.jsp");    // 로그인 페이지로 리다이렉트 한다.
}
String searchInput = (String)request.getAttribute("search-input");
%>
	<jsp:include page="header.jsp" >
		<jsp:param value="<%=id %>" name="id"/>
	</jsp:include>
	
    <main role="main">
    <section class="bg-gray200 pt-5 pb-5">
<%
		List<PostVO> searchList = (List<PostVO>)request.getAttribute("postSearchList"); // 전체 게시글 DB에서 가져오기 
%>
    <div class="container-fluid">
    	<div class="row">
    		<div class="card-columns">
<% 
		for(PostVO ivo : searchList){ // 전체게시글 출력
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
<%
		if(searchList.isEmpty()){
%>		
				<div class="empty" align="center" > 
					<h2><font style="color: red; font-size:25pt;"><%=searchInput %></font>&nbsp;에 대한 검색결과가 없습니다</h2> 
					<p style="margin-bottom: 50px;"></p>
					<div class="direction">
						<ul>
						<li>단어의 철자가 정확한지 확인해 보세요</li><br>
						<li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요</li><br>
						<li>검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요</li><br>
						<li>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요</li>
						</ul>
						<p style="margin-bottom: 100px;"></p>
					</div>
				</div>
<% 
		}//if END
%>     
    </main>

    <script src="./js/app.js"></script>
    <script src="./js/theme.js"></script>
       
	<jsp:include page="footer.jsp"/>    
<%}catch(Exception ex){response.sendRedirect("login.jsp");}%> 
<!-- session 받아오기 end-->
</body>
    
</html>
