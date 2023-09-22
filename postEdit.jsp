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
			val = editform.rating.value;
			editform.editPgrade.value = val;
		}
    </script>  
    
	<script>
		function editCheck(){
			var editPostImg = editform.editfile.value;
			var editPostText = editform.editPtext.value;
			var editPostGrade = editform.editPgrade.value;


			if(editPostText=="" || editPostText==null){
				document.getElementById("chectEditPtext").innerHTML = "<font style='font-size:10pt; color:red'> 내용을 입력해주세요</font>";
				editform.editPtext.focus();
				return ;
			}
			else{
				document.getElementById("chectEditPtext").innerHTML = "";
				editform.editPgrade.focus();
			}
			
			if(editPostGrade=="" || editPostGrade==null){
				document.getElementById("checkEditPgrade").innerHTML = "<font style='font-size:10pt; color:red'> 식당 평점을 입력해주세요</font>";
				editform.editPgrade.focus();
				return ;
			}
			else{
				document.getElementById("checkEditPgrade").innerHTML = "";
			}
			
			if(editPostImg=="" || editPostImg==null){
				document.getElementById("checkEditPimg").innerHTML = "<font style='font-size:10pt; color:red'> 이미지를 선택해주세요</font>";
				return ;
			}
			else{
				document.getElementById("checkEditPimg").innerHTML = "";
			}
			
			if(confirm("게시글을 수정하시겠습니까?")==true){
				document.editform.submit();
			}
			else{
				alert("게시글 수정을 취소하셨습니다 이전으로 돌아갑니다")
				history.back();
			}
		}//nullCheck END
	</script>	
</head>

<body>
<%
int id = 0;

try{
id = (int)session.getAttribute("id");  // request에서 id 파라미터를 가져온다
if( id == 0 ){                            // id가 Null 이거나 없을 경우
	response.sendRedirect("login.jsp");    // 로그인 페이지로 리다이렉트 한다.
}
	userId = (int)request.getAttribute("id");
	postId = (int)request.getAttribute("postId");
	storeName = (String)request.getAttribute("storeName");
	postImg = (String)request.getAttribute("postImg");
	postText = (String)request.getAttribute("postText");
	postGrade = (int)request.getAttribute("postGrade");
	
    //GuestVO vo = (GuestVO)request.getAttribute("edit");		
%>
	<jsp:include page="header.jsp" >
		<jsp:param value="<%=id %>" name="id"/>
	</jsp:include>
	
    <main role="main">
    <section class="bg-gray200 pt-5 pb-5">
    <div class="container">
    	<div class="row justify-content-center">
    		<div class="col-md-7">
			  <form name="editform" action="PostEdit.do" method="post" enctype="multipart/form-data">
		  		<h2>수정하기</h2>
				<table>
					<tr>
						<th>아이디:</th>
						<td><input type="text" name="edituid" value="<%=userId%>" readonly ></td>
					</tr>
					<tr><!--postId 보내주기위해서 but 보이진않아도돼서 hidden으로 감춤 형식맞춤-->
						<td><input type="hidden" name="editpid" value="<%=postId%>" readonly ></td>
					</tr>
					<tr>
						<th>식당이름:</th>
						<td><input type="text" name="editSname" value="<%=storeName%>" readonly><span id=checkEditSname></span></td>
					</tr>
					<tr>
						<th>내용 :</th>
						<td><textarea name="editPtext" rows="5" cols="27" ><%=postText%></textarea><span id=chectEditPtext></span></td>
					</tr>
					<tr>
						<th>평점 :</th>
						<td>	
							<div class="star-rating">
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
							<input type="hidden" name="editPgrade">
							<span id=checkEditPgrade></span>
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td><input type="file" id="file" name="editfile" onchange="handleFileSelect()"><span id=checkEditPimg></span></td>
					</tr>
					<tr>
						<th>미리보기 :</th>
						<td><div id="preview"></div></td>
					</tr>
				</table>
				<p>
				<div align="center"> 
					<input type="button" value="수정" onclick="editCheck();">
					<input type="reset" value="취소">
				</div>
			  </form>
    		</div>
    	</div>
    </div>

    </section>
        
    </main>

    <script src="js/app.js"></script>
    <script src="js/theme.js"></script>
   
    <jsp:include page="footer.jsp"/>
<%}catch(Exception ex){response.sendRedirect("login.jsp");}%>      
</body>
    
</html>
