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
	
<title>회원가입</title>

<link rel="stylesheet" href="${path}/resources/css/login.css">

</head>
<body class="home">

<div class="login-page">
  <div class="form">
    <form class="register-form" method="post" action="/join">
      <input type="text" placeholder="ID" maxlength="25" name="id"/>
      <input type="password" placeholder="password" maxlength="25" name="password"/>
      <input type="text" placeholder="name" maxlength="25" name="name"/>
      <input type="email" placeholder="email address" maxlength="25" name="email"/>
      <input type="text" placeholder="facebook" maxlength="35" name="facebook"/>
      <input type="text" placeholder="twitter" maxlength="35"name="twitter"/>
      <input type="text" placeholder="instagram" maxlength="35" name="instagram"/>
      <input type="text" placeholder="introduce" maxlength="35" name="introduce"/>
      <button>create</button>
      <p class="message">이미 가입하셨나요?<a href="/moveToLogin">Sign In</a></p>
    </form>
<!--       <p class="message">Not registered? <a href="#">Create an account</a></p> -->
    
  </div>
</div>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</body>
</html>
