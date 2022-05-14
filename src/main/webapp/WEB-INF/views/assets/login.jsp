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
    <!-- <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form> -->
    <form class="login-form" method="post" action="/login">
      <input type="text" placeholder="username" name="id"/>
      <input type="password" placeholder="password" name="password"/>
      <button type="submit">login</button>
<!--       <p class="message">Not registered? <a href="#">Create an account</a></p> -->
    </form>
  </div>
</div>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		
	<script src="${path}/resources/js/template.js"></script>
</body>
</html>
