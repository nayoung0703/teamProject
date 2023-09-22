<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import="net.hb.common.*" %>
<%@ page import="net.hb.post.*"  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script type="text/javascript">
</script>
</head>
<body>
 <%
 
 int id = 0 ;
 int postId = 0;
 try{
	postId = (int)session.getAttribute("poId");
	id = (int)session.getAttribute("id");  // request에서 id 파라미터를 가져온다
	if( id == 0 ){                            // id가 Null 이거나 없을 경우
		response.sendRedirect("login.jsp");    // 로그인 페이지로 리다이렉트 한다.
	}
%>

<%
	int userId = Integer.parseInt(request.getParameter("id"));
	int postid= Integer.parseInt(request.getParameter("postid"));
	
	//좋아요 갯수 불러오기
	PostDAO pdao = new PostDAO();
	int likeCount = pdao.postLikeCountAll(postid);
	
	//좋아요 했는지 여부에 따라 이미지 표시
	int isLiked = pdao.Isliked(userId, postId);
%>
 <!-- detail 쪽에 삽입된 실제 좋아요 버튼들  -->
<div>
<% if(isLiked != 1){ %>
	&nbsp;&nbsp;<a href="LikesAddAction.do?id=<%=id%>&postId=<%=postId%>"> 🤍</a> <!-- 좋아요 증가 -->
<% }else{ %>	
	&nbsp;&nbsp;<a href="LikesSubAction.do?id=<%=id%>&postId=<%=postId%>"> ❤️</a> <!-- 좋아요 감소 -->	
<% } %>		
	&nbsp;<span> <%=likeCount %> 개</span> <p>
</div>
<%}catch(Exception ex){response.sendRedirect("login.jsp");}%>    
</body>
</html>