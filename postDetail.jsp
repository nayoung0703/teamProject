<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Post - Pintereso Bootstrap Template</title>
    <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/theme.css">
    <style>
    	 .star-rating {
			display:float;
			flex-direction: row-reverse;
			font-size:1.5em;
			justify-content:space-around;
			width:7em;
		 }
		
		 .star-rating input {
		   display:none;
		 }
		
		 .star-rating label {
		   color:#f90;
		 }
		 
		 .star-rating .graystar {
		   color:#ccc;
		 }
		
    </style>
</head>

<body>
<%	
int id = 0;
int postId =0;

try{
	postId = (int)session.getAttribute("poId");
	id = (int)session.getAttribute("id");  // request에서 id 파라미터를 가져온다
	if( id == 0 ){                            // id가 Null 이거나 없을 경우
		response.sendRedirect("login.jsp");    // 로그인 페이지로 리다이렉트 한다.
	}

	PostVO pvo =  pdao.selectPostAll(postId);
	int postUserId = pvo.getUserId();
	String storeName  =  pvo.getStoreName();
	String postText  = pvo.getPostText();
	int postGrade	= pvo.getPostGrade();
	String postImg  = pvo.getPostImg();
	Date postDate  = pvo.getPostdate();
	
	
%>
	<jsp:include page="header.jsp" >
		<jsp:param value="<%=id %>" name="id"/>
	</jsp:include>

    <main role="main">
    <section class="bg-gray200 pt-5 pb-5">
    <div class="container">
    	<div class="row justify-content-center">
    		<div class="col-md-7">
    			<article class="card">
    			<span> <img class="rounded-circle mr-2" src="./userimg/<%=cdao.userProfile(postUserId)%>" width="50"><%= postUserId %></span>
    			<img class="card-img-top mb-2" src="img/<%= postImg %>" height="650" alt="Card image"> <!-- docs/img/ -->
    			<div class="card-body">
    				<span class="card-title display-4">&nbsp;<%=storeName%></span>
    				<!-- 별점 -->
    				<div class="star-rating">
    				&nbsp;
    				<% 
    					for(int i=0;i<postGrade;i++){
    				%>

						<input type="radio" id="stars" name="rating" readonly/>
						<label for="stars" class="yellowstar">&#9733;</label>

					<%
    					}//for END		
					%>
				 	<%
						for(int j=0;j<(5-postGrade);j++){
					%>
						
						<input type="radio" id="stars" name="rating" readonly/>
						<label for="stars" class="graystar">&#9733;</label>
					<%
    					}//for END
					%> 
					</div>
					<!-- 좋아요 -->
					<jsp:include page="likes.jsp">
   						<jsp:param value="<%=id %>" name="id"/>
   						<jsp:param value="<%=postId %>" name="postid"/>
   					</jsp:include> 
   					<!-- 내용 -->
 					&nbsp;&nbsp; <%= postText %> <p> <p>
 					<!-- 게시 날짜 -->
					&nbsp;&nbsp; <%= postDate %> 
					<!-- 댓글 -->
    				<jsp:include page="reply.jsp">
 						<jsp:param value="<%= postId %>" name="postId"/>
 					</jsp:include>
    			</div>

    			</article>
    		</div>
    	</div>
    </div>
    </section>
        
    </main>

    <script src="./js/app.js"></script>
    <script src="./js/theme.js"></script>
   
    <jsp:include page="footer.jsp"/>
<%}catch(Exception ex){response.sendRedirect("login.jsp");}%>    
</body>
    
</html>
