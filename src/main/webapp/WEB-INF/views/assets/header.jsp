<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="kor">
<head>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/header.css">
</head>
<body>
<header>
		<div id="head">
		<% if(session.getAttribute("role") == null || session.getAttribute("role") == ""){ %>
			<div class="loginDiv">
				<span onclick="location.href='/moveToLogin'" >login</span> 
			</div>
		<% }else if((session.getAttribute("role") != null || session.getAttribute("role") != "") && !(session.getAttribute("role").equals("admin")) ){ %>	
			<div class="loginDiv">
				<span onclick="location.href='/logout'" >logout</span> | <span onclick="location.href='/moveWritePage'" >write</span>
			</div> 
		<% }else if(session.getAttribute("role") != null || session.getAttribute("role") != "" && session.getAttribute("role").equals("admin") ){ %>			 
			<div class="loginDiv">
				<span onclick="location.href='/logout'" >logout</span> | <span onclick="location.href='/moveWritePage'" >write	</span> | <span onclick="location.href='/moveToAdmin'" > admin</span>
			</div> 
		<% } %>
		
			<div id="logoDiv"> 
				<img alt="logo" src="${path}/resources/images/logo.png" onclick="location.href='/';" />
			</div>
		</div>
</header>
</body>
</html>
