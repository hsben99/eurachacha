<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>	
<link rel="stylesheet" type="text/css" href="${path}/resources/css/navbar.css">
</head>
<body>
<hr>
<div id="navDiv">
	<nav>
		<ul id="navUl">
			<li><a href="#" onclick="callList('1','','');">전체</a></li>
			<li><a href="#" onclick="callList('1','','medical');">의료·학술</a></li>
			<li><a href="#" onclick="callList('1','','bio');">제약·바이오</a></li>
			<li><a href="#" onclick="callList('1','','tech');">의료기기·IT</a></li> 
		</ul>
	</nav>
</div>
	<hr>
</body>
</html>
