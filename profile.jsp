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
<%
int id = (int)request.getAttribute("id");
int pwd = (int)request.getAttribute("pwd");
String name = (String)request.getAttribute("name");
String nick = (String)request.getAttribute("nick");

%>
    <p style="margin-bottom:100px;"></p>
	<div class="pinter"> 
	<img src="img/logo.png" class="logo">
	<br>
	<div align="center">프로필에 사용할 이미지를 등록하세요</div>
	<br>
	<form name="profileForm" action="JoinInsert.dd" method="post" enctype="multipart/form-data">
			 <input type="hidden" name="userId" value ="<%=id %>">
			 <input type="hidden" name="userPwd" value ="<%=pwd %>">
			 <input type="hidden" name="userName" value ="<%=name%>">
			 <input type="hidden" name="userNick" value ="<%=nick%>">
			 <div align="center"> <img src="./userimg/av.png"> </div>
			
			 <div class="field_body1" align="center">
			 <p style="margin-bottom:10px;"></p>
		     <input type="file" name="file">
		     </div>
		     <p style="margin-bottom:30px;"></p>
		     
		     <div class="field_button" align="center">
			 <button type="submit" value="upload"> upload </button> <br>  
			 
			 <font style="font-size:small;">또는</font> </div>	
			 
			 <div class="field_button_f" align="center">
			 <button type="submit" value="skip"> skip </button> <br> </div>
			 <br>	
	 </form>


</body>
</html>