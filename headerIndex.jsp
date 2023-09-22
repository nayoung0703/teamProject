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
	input[type=submit] { 
		background: url(./img/search.svg) no-repeat center center;
		background-size: 30px;
		width: 50px;
		height: 50px;
		border: none;
	} 	
	.bd-search{
		display: flex;
	}

</style>
	
<body>
<%
int id = Integer.parseInt(request.getParameter("id"));
%>

    <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
    <a class="navbar-brand font-weight-bolder mr-3" href="#"><img src="./img/logo.png" style="width:100px; height:60px;"/></a>
    <button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsDefault" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsDefault">
    	<ul class="navbar-nav mr-auto align-items-center">
    		<form name="postSearch" class="bd-search hidden-sm-down" action="postSearch.do">
    			<input type="text" class="form-control bg-graylight border-0 font-weight-bold" id="search-input" name="search-input" placeholder="키워드 검색" autocomplete="off">
    			<input type="submit" class="img-button" onclick="" value="">
    			<div class="dropdown-menu bd-search-results" id="search-results">
    			</div>
    		</form>
    	</ul>
    	<ul class="navbar-nav ml-auto align-items-center">
    		<li class="nav-item">
    		<a class="nav-link active" href="#">Home</a>
    		</li>
    		<li class="nav-item">
    		<a class="nav-link" href="#toPost">Post</a>
    		</li>
    		<li class="nav-item">
    		<a class="nav-link" href="postMapToInsert.jsp">Post Write</a>
    		</li>
    		<li class="nav-item">
    		<a class="nav-link" href="author.jsp"><img class="rounded-circle mr-2" src="./userimg/<%=cdao.userProfile(id)%>" width="30"><span class="align-middle"><%=cdao.userId(id)%></span></a>
    		</li>
    		<li class="nav-item">
    		<a class="nav-link" href="selectReceiver.jsp"> Chatting </a>
    		</li>
    		<li class="nav-item dropdown">
    		<a class="nav-link" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    		<svg style="margin-top:10px;" class="_3DJPT" version="1.1" viewbox="0 0 32 32" width="21" height="21" aria-hidden="false" data-reactid="71"><path d="M7 15.5c0 1.9-1.6 3.5-3.5 3.5s-3.5-1.6-3.5-3.5 1.6-3.5 3.5-3.5 3.5 1.6 3.5 3.5zm21.5-3.5c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5zm-12.5 0c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5z" data-reactid="22"></path></svg>
    		</a>
    		<div class="dropdown-menu dropdown-menu-right shadow-lg" aria-labelledby="dropdown02">
    			<h4 class="dropdown-header display-4">프로필<br/>dusrb0803@naver.com</h4>
    			<div class="dropdown-divider">
    			</div>
    			<!-- 계정 관리 회원정보 변경, 탈퇴 jsp로 연결 -->
    			<span class="dropdown-item"><a href="authorDetail.jsp" class="btn btn-primary d-block"><i class="fa fa-download"></i>계정관리</a></span>
    			<div class="dropdown-divider">
    			</div>
    			<!-- logout servlet으로 연결 -->
    			<span class="dropdown-item"><a href="logoutclose.dd" class="btn btn-primary d-block"> 로그아웃</a></span>
    		</div>
    		</li>
    	</ul>
    </div>
    </nav>    
    
	<script src="./js/app.js"></script>
    <script src="./js/theme.js"></script>
    
  
</body>
    
</html>
