<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
            *{
            box-sizing: border-box; /*전체에 박스사이징*/
            outline: none; /*focus 했을때 테두리 나오게 */
            }

        body{
            font-family: 'Noto Sans KR', sans-serif, Comic Sans MS;
            font-size:12px;
            line-height: 2.0em;
            color : #222;
            margin-top: 100px;
            margin: auto; /*중앙 정렬*/
            }

        .pinter { 
            width: 460px;
            border: 2px solid gainsboro;
            margin: auto; /*중앙 정렬*/
            padding: 0 20px;
            margin-top: 20px;
            margin-bottom: 100px;
            border-radius: 30px;
            }
            
        .logo{
            display: block;
            margin: 50px auto ;

            }

        .field_body1 input {
            padding: 0 1em;
            border: 3px solid rgb(165, 163, 163);
            height: 55px;
            width: 100%;
            border-radius: 10px;
            
        }
        .field_body1 input:focus {
            outline : none;
            box-shadow: 0 0 0 3px rgb(165, 163, 163);
        }
        .field_button {
            width: 100%;
            height: auto;
        }
        .field_button button {
            overflow: hidden;
            width: 420px;
            height: 40px;
            color: white;
            background-color:  rgb(219, 12, 12);
            border-radius: 20px;
        }
        .field_button_f button {
            overflow: hidden;
            width: 420px;
            height: 40px;
            color: white;
            background-color: gray;
            border-radius: 20px;
        }
        .field_button_g button {
            overflow: hidden;
            width: 420px;
            height: 40px;
            color: white;
            background-color: lightgray;
            border-radius: 20px;
        }
        
        button {
            cursor: pointer;
            border: 0;
        }
       
 

        a{text-decoration: none; color: black; font-weight: bold;}
        a:hover{text-decoration: underline;}
    </style>
</head>



<body>
<script>

	function popCheckId(){
	     window.open("openIdCheck.jsp", "IDcheck", "width=500,height=170,left=700, top=250");
		 document.formJoin.userPwd.focus();
	}//end
	
	function checkPwd(){
		var userPwdCheck = document.formJoin.userPwdCheck.value;
		var userPwd = document.formJoin.userPwd.value;
		
		if (userPwd == userPwdCheck){
			document.getElementById("userPwdCt").innerHTML = "<font>비밀번호가 일치합니다.</font>";
		}else{
			document.getElementById("userPwdCt").innerHTML = "<font>비밀번호가 다릅니다.</font>";
		}	
	}//end
	
	function checkIdFirst(){
		var userId = document.formJoin.userId.value;
		if (userId==""||userId==null){
			alert("아이디를 입력해주세요")
			return false;
		}
		document.formJoin.submit();
	}//end
</script>

		<p style="margin-bottom:20px;"></p>
		<div class="pinter"> 
		<img src="img/logo.png" class="logo">
		<form name ="formJoin" action="FileInsert.dd"  >
	        
	        <div align="center">
	            <p style="font-size : large">회원가입</p>
	        </div>
	        
			<div class="field_body1">
				<font style="font-size:small;">아이디</font> <br>
				<input type="text" name ="userId" size="6" onfocus="popCheckId();" readonly>
			</div>
			<p style="margin-bottom:10px;"></p>
			
			<div class="field_body1">
				<font style="font-size:small;">비밀번호</font> <br>
				<input type="password" name ="userPwd" size="6" >
			</div>
			<p style="margin-bottom:10px;"></p>
			
			<div class="field_body1">
				<font style="font-size:small;">비밀번호 확인</font> <br>
				<input type="password" name = "userPwdCheck" size="6" onblur="checkPwd();"><span id ="userPwdCt"></span>
			</div>
			<p style="margin-bottom:10px;"></p>
	
			<div class="field_body1">
				<font style="font-size:small;">사용자이름</font> <br>
				<input type="text" name ="userName" size="6" >
			</div>
			<p style="margin-bottom:10px;"></p>
	
			<div class="field_body1">
				<font style="font-size:small;">사용자별명</font> <br>
				<input type="text" name ="userNick" size="6" >
			</div>
			<p style="margin-bottom:10px;"></p>
			<div class="field_button_g" align="center"> 
			<button type="reset"><font style="font-size:medium;">내용삭제</font></button><br>
			<p style="margin-bottom:10px;"></p></div>
			
			<div class="field_button" align="center"> 
		    <button type="button" onclick="checkIdFirst();"> <font style="font-size:medium;">회원가입</font> </button> <br>
			<b> <font style="font-size:small;">또는</font> </b> </div>
			<div class="field_button_f" align="center">
			<button type="button" onclick="location.href='login.jsp'"> <font style="font-size:medium;">로그인</font> </button> <br>
			</div>
			
			<p style="margin-bottom:50px;"></p>
		</form>
		</div>


</body>
</html>