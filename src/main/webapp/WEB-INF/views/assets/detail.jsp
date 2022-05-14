<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>의라차차</title>

	<link rel="shortcut icon" href="${path}/resources/images/gt_favicon.png">
	
	<!-- Bootstrap -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.no-icons.min.css" rel="stylesheet">
	<!-- Icons -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<!-- Fonts -->
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Alice|Open+Sans:400,300,700">
	<!-- Custom styles -->
	<link rel="stylesheet" href="${path}/resources/css/styles.css">

	<!--[if lt IE 9]> <script src="${path}/resources/js/html5shiv.js"></script> <![endif]-->
</head>
<body class="home">
<header id="header">
	<div id="head" class="parallax" parallax-speed="2">
			<% if(session.getAttribute("id") == null || session.getAttribute("id") == ""){ %>
			<div style="text-align: right; padding-right: 3vw;" >
				<span onclick="location.href='/moveToLogin'" >login</span> 
			</div>
			<% }else{ %>
			 
			<div style="text-align: right; padding-right: 3vw;" >
				<span onclick="location.href='/logout'" >logout</span> | <span onclick="location.href='/moveWritePage'" >write</span>
			</div> 
			<% } %>
			
		<h1 id="logo" class="text-center" onclick="location.href='/'" style="font-weight:900;">
			의라차차
		</h1>
		
		<div class="entry-meta" style="text-align: center; margin-top: 50px;"> 
			<span class="posted-on"><time class="entry-date published">${regDate}</time></span>			
		</div>
		
	</div>
	<hr>
</header>

<main id="main" style="min-height:62vh;">

	<div class="container">
		<% if(session.getAttribute("id") != null && session.getAttribute("id") != ""){ %>
		<div style="text-align: right;">
			<span onclick="location.href='/deleteById/${id}'">삭제하기</span>
		</div>
		<%} %>								
		<div class="row topspace">
			<div class="col-sm-8 col-sm-offset-2">
							
				<article class="post">

					<header class="entry-header">
						<h1 class="entry-title">${title}</h1>
					</header>
					<div class="entry-content">
						${content}
					</div>
				</article> 
			</div> 
		</div>
	</div>
</main>
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-3 widget">
					<div class="widget-body">
						<p>
							사업자번호 236-30-00585 <br> 등록번호 서울, 아05141 <br> 등록일자 2018. 4. 25 <br> <br> 발행인 겸 편집인 박원빈<br> 개인정보책임자 박순보 <br>
							청소년보호책임자 박지연
						</p>
					</div>
				</div>
				<div class="col-md-3 widget">
					<div class="widget-body">
						<p><a href="/teenProtect">청소년 보호정책</a></p>
					</div>
				</div>
				<div class="col-md-3 widget">
					<div class="widget-body"></div>
				</div>
				<div class="col-md-3 widget">
					<div class="widget-body">
						<p>
							TEL : 02-470-2014<br> <a href="mailto:#">contact@beenpictures.com</a><br>
							<br> 서울시 성동구 무학로 14길 18 가동 602호(홍익동 한신그린빌)
						</p>
					</div>
				</div>
			</div>			
		</div>
	</footer>

<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="${path}/resources/js/template.js"></script>
</body>
</html>
