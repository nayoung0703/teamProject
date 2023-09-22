<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Author - Pintereso Bootstrap Template</title>
    <script type="text/javascript">
    (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })();
    function deletepop(){
        window.open("delete.jsp","delete_blank","width=600, height=500, top=10, left=10");
        document.deleteform.submit();
    }
    </script>
    
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
    	<a href="profileEdit.jsp"><img src="userimg/<%=cdao.userProfile(id)%>" class="mt-neg100 mb-4 rounded-circle" width="128"></a>
    	<h1 class="font-weight-bold title"><%=cdao.userNick(id)%></h1>
    	<p>
    		이름 작성하기
    	</p>
    </div>
       
    <div class="container mb-4">
	    <form name=updateform action="UserUpdate.dd" >
	    <span style="font-size:16pt; color:gray;">회원 정보 수정</span><p style="margin-top:20px">
			회원 ID <input type="text" name="id" value="<%=id%>"><p>
			수정할 비밀번호를 입력하세요 <br><input type="text" name="pwd" size="50"><br>
			수정할 이름을 입력하세요 <br><input type="text" name="name"  size="50"><br>
			수정할 닉네임을 입력하세요 <br><input type="text" name="nick"  size="50"><p>
					<input type="submit" value="수정하기">
					<input type="reset" value="입력취소">
		<p style="margin-top:100px">
		</form>
	    
	    <span style="font-size:16pt; color:gray;">회원 탈퇴</span><p>
	    <form name=deleteform action="delete.jsp">
	    탈퇴 사유를 입력하세요<p>
	    <textarea style="width:800px;"></textarea><p>
	    <input type="submit" value="탈퇴하기" onclick="">
	    <input type="hidden" name="hiddenId" value="<%=id%>">
	    </form>
    </div>
        
    </main>

    <script src="./js/app.js"></script>
    <script src="./js/theme.js"></script>
    
   <jsp:include page="footer.jsp"/>
<%}catch(Exception ex){response.sendRedirect("login.jsp");}%>
<!-- session 받아오기 end -->
</body>
    
</html>
