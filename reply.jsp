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
	   
	    			<div class="card-body">
	    				<div id="comments" class="mt-4">   
    					<span style="font-size:16pt; color:gray;">댓글</span><p>
							<div id="myDIV" style="padding:16px;background-color:lightgray">
						
						</div>
					<%
						List<PostVO> replyList = pdao.replyListAll(postId);
							for(PostVO i: replyList ){
					%> 

						<script>
						// Create element:
						(function(){
							const fofo = document.createElement("form");
							fofo.setAttribute("action","replyDelete.do")
							
							const para = document.createElement("button");
							para.setAttribute("type","submit");
							para.innerHTML = "삭제";
							
							const pararaa = document.createElement("INPUT");
							pararaa.setAttribute("type","hidden");
							pararaa.setAttribute("value",<%=postId%>);
							pararaa.setAttribute("name","dpostId");
							
							const pararab = document.createElement("INPUT");
							pararab.setAttribute("type","hidden");
							pararab.setAttribute("value",<%=i.getUserid()%>);
							pararab.setAttribute("name","duserId");	
							
							const pararac = document.createElement("INPUT");
							pararac.setAttribute("type","hidden");
							pararac.setAttribute("value","<%=i.getRcontent()%>");
							pararac.setAttribute("name","drContent");
	
							fofo.innerHTML = <%=i.getUserid()%>+ " "+ '<%=i.getRcontent()%>' +" " + '<%=i.getRdate()%>' ;
							if (<%=id%> == <%=i.getUserid()%>){
								fofo.append(para,pararaa,pararab,pararac);
							}
							// Append to another element:
							document.getElementById("myDIV").appendChild(fofo);
						})()	
						</script>
						
					<% 		
							}
					%>
					<p style="margin-top:100px;">
				    <form name=replyform action="replyInsert.do">
					    작성자 <%=id%>님 <br>
					    <font>댓글입력</font>
					    <p style="margin-bottom:10px;"></p>					    
					    <input type="text" name="r_content" style="width:100%; height:100px;"><p>
					    <input type="hidden" name="postId" value="<%=postId%>">
					    <input type="hidden" name="userId" value="<%=id%>">
					    <p style="margin-bottom:10px;"></p>	
					    <button type="button" onclick="checkNull();">등록하기</button>
					    <input type="reset" value="취소">
				    </form>
    				</div>
    			</div>
			    <script type="text/javascript">
				function checkNull(){
					var rcontent = document.replyform.r_content.value;
					if(!rcontent){
						alert("내용을 입력하세요");
						return false;
					}else{document.replyform.submit(); }
					
				}
			
				</script>

<%}catch(Exception ex){response.sendRedirect("login.jsp");}%>    
</body>
    
</html>
