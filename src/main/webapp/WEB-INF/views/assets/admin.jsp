<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
<title>로그인</title>

<link rel="shortcut icon" href="${path}/resources/images/gt_favicon.png">

<link rel="stylesheet" href="${path}/resources/css/login.css">

</head>
<body class="home">

<div class="login-page">
  <div class="form">    
            <button onclick="location.href='/moveToJoin'">신규 회원가입</button>
            <br><br> 
            <button onclick="location.href='/moveToUserList'">아이디 삭제</button>
  </div>
</div>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		
	<script src="${path}/resources/js/template.js"></script>
</body>
</html>
