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
    <style type="text/css">
    	 input[type=text] { width: 300px } 
    	 input[type=file] { width: 300px } 
    	 
    	 .star-rating {
			 display:flex;
			 flex-direction: row-reverse;
			 font-size:1.5em;
			 justify-content:space-around;
			 padding:0 .2em;
			 text-align:center;
			 width:5em;
		  }
		
		 .star-rating input {
		   display:none;
		 }
		
		 .star-rating label {
		   color:#ccc;
		   cursor:pointer;
		 }
		
		 .star-rating :checked ~ label {
		   color:#f90;
		 }
		
		 .star-rating label:hover,
		 .star-rating label:hover ~ label {
		   color:#fc0;
		 }
    </style>
    <script type="text/javascript">	function handleFileSelect() {//파일 미리보기 
        var files = document.getElementById('file').files[0]; //파일 객체
        var reader = new FileReader();
        //파일정보 수집        
        reader.onload = (function(theFile) {
          return function(e) {
            //이미지 뷰
            var img_view = ['<img src="', e.target.result, '" name="', escape(theFile.name), '"  width=300 height=300/>'].join('');                
            document.getElementById('preview').innerHTML = img_view;
          };
        })(files);
        reader.readAsDataURL(files);    
      }//end
    </script>
    
    <script type="text/javascript">
		function starValue(){
			var val = 0;	
			val = postform.rating.value;
			postform.newpgrade.value = val;
		}
    </script>  
    
	<script type="text/javascript">
		function nullCheck(){
			var checkPostFile = postform.newfile.value;
			var checkPostText = postform.newptext.value;
			var checkPostGrade = postform.newpgrade.value;
			
			if(checkPostText=="" || checkPostText==null){
				document.getElementById("checkptext").innerHTML = "<font style='font-size:10pt; color:red'> 게시할 내용을 입력해주세요</font>";
				postform.newptext.focus();
				return ;
			}
			else{
				document.getElementById("checkptext").innerHTML = "";
				postform.newpgrade.focus();
			}
			
			if(checkPostGrade=="" || checkPostGrade==null){
				document.getElementById("checkpgrade").innerHTML = "<font style='font-size:10pt; color:red'> 식당 평점을 입력해주세요</font>";
				postform.newpgrade.focus();
				return ;
			}
			else{
				document.getElementById("checkpgrade").innerHTML = "";
			}
			
			if(checkPostFile=="" || checkPostFile==null){
				document.getElementById("checkpfile").innerHTML = "<font style='font-size:10pt; color:red'> 이미지를 선택해주세요</font>";
				return ;
			}
			else{
				document.getElementById("checkpfile").innerHTML = "";
			}
			

			
			if(confirm("게시글을 등록하시겠습니까?")==true){
				document.postform.submit();
			}
			else{
				alert("게시글 등록을 취소하셨습니다 이전으로 돌아갑니다")
			}
		}//nullCheck END
	</script>
</head>

<body>
<%
int id = 0;

try{
id = (int)session.getAttribute("id");// request에서 id 파라미터를 가져온다
svo = (StoreVO)request.getAttribute("svo");
storeName = svo.getStoreName();

if( id == 0 ){                            // id가 Null 이거나 없을 경우
	response.sendRedirect("login.jsp");    // 로그인 페이지로 리다이렉트 한다.
}
%>
	<jsp:include page="header.jsp" >
		<jsp:param value="<%=id %>" name="id"/>
	</jsp:include>
	
    <main role="main">
    <section class="bg-gray200 pt-5 pb-5">
    <div class="container">
    	<div class="row justify-content-center">
    		<div class="col-md-7">
    			<form class="postform" name="postform" method="post" action="postInsert.do" enctype="multipart/form-data">
					<h2>새 게시글</h2>
					<table>
						<tr>
							<th>아이디:</th>
							<td><input type="text" name="newuid" value="<%=id%>"></td>
						</tr>
						<tr>
							<th>식당이름:</th>
							<td><input type="text" name="newsname" value = "<%=storeName %>"><span id=checksname></span></td>
						</tr>
						<tr>
							<th><font style='font-size:15pt; color:red'>*</font>내용 :</th>
							<td><textarea name="newptext" rows="5" cols="27" ></textarea><span id=checkptext></span></td>
						</tr>
						<tr>
							<th><font style='font-size:15pt; color:red'>*</font>평점 :</th>
							<td>	
							<div class="star-rating" style='float:left;'>
							  <input type="radio" id="5-stars" name="rating" value="5" onclick="starValue();"/>
							  <label for="5-stars" class="star">&#9733;</label>
							  <input type="radio" id="4-stars" name="rating" value="4" onclick="starValue();"/>
							  <label for="4-stars" class="star">&#9733;</label>
							  <input type="radio" id="3-stars" name="rating" value="3" onclick="starValue();"/>
							  <label for="3-stars" class="star">&#9733;</label>
							  <input type="radio" id="2-stars" name="rating" value="2" onclick="starValue();"/>
							  <label for="2-stars" class="star">&#9733;</label>
							  <input type="radio" id="1-star" name="rating" value="1" onclick="starValue();"/>
							  <label for="1-star" class="star">&#9733;</label>
							</div>
							<input type="hidden" name="newpgrade">
							<span id=checkpgrade style='margin-left:160px;'></span>
							</td>
						</tr>
						<tr>
							<th><font style='font-size:15pt; color:red'>*</font>이미지</th>
							<td><input type="file" id="file" name="newfile" onchange="handleFileSelect()"><span id=checkpfile></span></td>
						</tr>
						<tr>
							<th>미리보기 :</th>
							<td><div id="preview"></div></td>
						</tr>
					</table>
					<p>
					<div align="center"> 
						<input type="button" value="새 게시글 등록" onclick="nullCheck();">
						<input type="reset" value="내용지우기">
					</div>
  				</form>
    		</div>
    	</div>
    </div>
    <div class="container-fluid mt-5">
    </div>	
    </section>
        
    </main>

    <script src="js/app.js"></script>
    <script src="js/theme.js"></script>
    
    <jsp:include page="footer.jsp"/>
<%}catch(Exception ex){response.sendRedirect("login.jsp");}%>     
</body>
    
</html>
