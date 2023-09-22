<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	 .in-line{
      height:190px;
    }
    textarea{
      width:50%;
      height:80%;
      font-size:1em;
      padding-left: 5px;
      font-style: oblique;
      display:inline;
      outline:none;
      box-sizing: border-box;
      color:black;

    }
	button[type=submit]{
      width: 10%;
      height:80%;
      border:none;
      background-color: lightgray;
      background-color: white;
      font-size:1em;
      color:#042AaC;
      outline:none;
      display:inline;
      margin-left: -5px;
      box-sizing: border-box;
    }
    textarea, button{
      vertical-align:middle;
    }
 
</style>
<script>
	function doaction(){
		let msg = document.getElementById("content");
		if(msg.value.length==0){
			alert('메세지를 입력하세요.')
			return false;
		}else{
			document.msgBoxForm.submit();
			return false;
		}
		return true;
	}
</script>
<body>
<% 
 	int	sendId = Integer.parseInt(request.getParameter("id"));
	int receiveId = Integer.parseInt(request.getParameter("receiveId"));
%>

<form action="MsgSave.dd" id="msgBoxForm" name="msgBoxForm">
	<input type="hidden" name="sendId" value="<%=sendId %>"><br>
	<input type="hidden" name="receiveId" value="<%=receiveId %>"><br>
	<div class="in-line" >
	<textarea id="content" name="msgCont" rows="6" cols="20" placeholder="메세지를 입력해주세요"></textarea>
	<button type="button" onclick="doaction();">send</button>
	</div>
</form>


</body>
</html>