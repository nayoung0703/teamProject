<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 업로드</title>
</head>
   <style>
      *{
         text-align:center;
      }
      
      .filebox{
         border: 1px dotted black;
         align: center;
         width: 400px;
         margin:auto;
         margin-top: 300px;
         padding: 10px;
      }
      

   </style>
   
<body>
   <form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
      <div class="filebox">
      <label for="file">사진변경</label><p>
      <input type="file" name="file">
      <input type="submit" value="업로드"><br>
      </div>
   </form>
</body>
</html>