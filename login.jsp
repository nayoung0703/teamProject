<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            font-size:14px;
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
            margin-bottom: 20px;
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
            background-color: rgb(219, 12, 12);
            border-radius: 20px;
        }
        .field_button_f button {
            overflow: hidden;
            width: 420px;
            height: 40px;
            color: white;
            background-color: orange;
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
    <p style="margin-bottom:100px;"></p>
	<div class="pinter"> 
	<img src="img/logo.png" class="logo">
	<form name=loginform action="loginInsert.dd" >
	    <div  align="center" style="font-size: large;">
            <h1>영재야 밥먹자에 </h1>
            <h1>오신 것을 환영합니다</h1>
        </div>
        <div align="center">
            <p>홍대 서교동 주변 찐맛집 찾기</p>
        </div>
        
        <div class="field_body1">
			ID <br> 
			<input type="text" name="user_id" size="6" placeholder="아이디" >
		</div>
		
		<div class="field_body1">
			PASSWORD <br> 
			<input type="text" name="user_pwd" size="6" placeholder="비밀번호">
		</div>
		
		<p style="margin-bottom:10px;"></p>
		
		<div class="field_button_g" align="center"> 
		<button type="reset">내용삭제</button><br>
		<p style="margin-bottom:30px;"></p>	</div>
		
		<div class="field_button" align="center"> 
	    <button type="submit" value="login"> 로그인 </button> <br>
	    <b> 또는 </b> <br> </div>
	    <div class="field_button_f" align="center">
		<button type="button" onclick="location.href='join.jsp'"> 회원가입 </button> <br>
		</div>
	  
    
    	<br>
    	
        <div class="field_body2" align="center" style="font-size: 9pt; color: gray;">
            계속 진행하면 Pinterest <a href="">서비스</a> 약관에 동의하고 <br>
            <a href="">개인보호 정책</a>을 읽었음을 인정하는 것으로 간주 <br>
            됩니다. <a href="">컬렉션알림</a>.
        </div>
        <br>             
    
	</form>
	</div>
</body>
</html>