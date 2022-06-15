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
	
</head>
<body class="home">
<header id="header">		
	
		<div id="head" class="parallax" parallax-speed="2" style="padding: 0;">
		
		<% if(session.getAttribute("role") == null || session.getAttribute("role") == ""){ %>
			<div style="text-align: right; padding-right: 3vw;" >
				<span onclick="location.href='/moveToLogin'" >login</span> 
			</div>
		<% }else if((session.getAttribute("role") != null || session.getAttribute("role") != "") && !(session.getAttribute("role").equals("admin")) ){ %>	
			<div style="text-align: right; padding-right: 3vw;" >
				<span onclick="location.href='/logout'" >logout</span> | <span onclick="location.href='/moveWritePage'" >write</span>
			</div> 
		<% }else if(session.getAttribute("role") != null || session.getAttribute("role") != "" && session.getAttribute("role").equals("admin") ){ %>			 
			<div style="text-align: right; padding-right: 3vw;" >
				<span onclick="location.href='/logout'" >logout</span> | <span onclick="location.href='/moveWritePage'" >write	</span> | <span onclick="location.href='/moveToAdmin'" > admin</span>
			</div> 
		<% } %>
			<div class="text-center" style=" height: 100px; display: flex; justify-content: center; "> 
				<div class="col-md-9 col-sm-12	" style=" display: flex; justify-content: space-around;">
					<div class="" style="width: 34%"> 
						<img alt="logo" src="${path}/resources/images/logo.png" onclick="location.href='/';" style="height: 3.3rem; cursor: pointer; "/>
					</div>
					<div class="" style="width: 33%; overflow: hidden;">
						<!-- <img alt="" src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg"> -->
					</div>
					<div class="" style="width: 33%; overflow: hidden;" >
						<!-- <img alt="" src="https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg"> -->
					</div> 
				</div>	
				
			</div>
		</div> 
		<hr>
	</header>

<main id="main" style="min-height:62vh;">
	<div class="container">
		<% if(session.getAttribute("id") != null &&
		      (session.getAttribute("id").equals(request.getAttribute("writerId")) || session.getAttribute("role").equals("admin"))
		      ){ %>
		<div style="text-align: right;">
			<span onclick="location.href='/deleteById/${id}'">삭제하기</span>
		</div>
		<%} %>	
		<div class="row topspace">
			<div class="col-sm-8 col-sm-offset-2">
							
				<article class="post">

					<header class="entry-header">
						<h2 class="entry-title" style="font-size: 25px; font-weight: 900;">${title}</h2>
					</header>
					<div class="entry-content">
						${content}
					</div>
					<div style="display: flex; justify-content:flex-end; margin-bottom: 40px;" >
						<span class="posted-on" ><time class="entry-date published" style="font-size: 13px;">발행일  ${regDate}</time></span>
					</div>
					<div id="writerInfo">
						<div style="font-weight: 900;">ABOUT AUTHOR</div>
						<br>
						<div style="padding-left: 15px;">
							<span id="userID" style="color: #FF9100; font-weight: 900; "></span><span style="font-weight: 900;"> 기자</span>
							&nbsp; &nbsp; &nbsp; 
							<span id="userEmail" style="padding-left: 15px;"></span>
						</div>
							
						<br>
						<div id="userIntro" style="padding-left: 15px;"></div>	
						
					</div>
					
					
					
				</article> 
			</div> 
		</div>
	</div>
	
</main>
	<footer id="footer" 
			style="border-top: 1px solid gray;">
		<div class="widget-body" 
			 style="
			 	margin-bottom:20px;
			 	padding-left:50px;
				padding-right:50px;
				font-size:1rem;
				line-height: 36px; 
				"> 
			<p style="font-weight: 900; margin-bottom:5px; line-height: 50px">의라차차</p>
			<span>회사 : 빈픽쳐스 사업자번호 : 236-30-00585  등록번호 : 서울, 아05141</span><br>	
			<span>등록일자 : 2018.4.25 주소 : 서울시 성동구 무학로 14길18 가동 602호 (홍익동 한신그린빌)</span><br>
			<span>TEL : 02-470-2014   FAX : 050-7711-8367  E-mail : contact@beenpictures.com</span><br>
			<span style="font-weight: 900;   font-style: italic;">발행인 겸 편집인 : 박원빈  개인정보책임자  : 박순보  청소년보호책임자 : 박지연</span><br>
		</div>
		<div 
			style="
				background-color: #212a34; 
				color:white; 
				padding-top: 20px;
				padding-bottom: 70px;
				padding-left:50px;
				padding-right:50px;
				display: flex;
				justify-content: space-between;">
			<span >Copyrightⓒ Been Pictures, Ltd. All Rights Reserved.</span>
			<div> 
				<span ><a href="/eurachacha">About의라차차</a></span> 
				<span><a href="/teenProtect"> 청소년보호정책</a></span>
			</div>	
		</div>
	</footer>
	
	

<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>


<script>
$(function() {
	//파라미터 jsp el임
	getUser('${writerId}');
})

const getUser = function(id) {

	$.ajax({
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		method : "GET",
		url : "/getUser/"+id,
		success : function(result) {
			$("#userID").html(result.user.name);
			$("#userEmail").html(result.user.email);
			$("#userIntro").html(result.user.introduce);
			console.log(result)
		},
		error : function(result) {
			console.log("기자 정보 error");
		}
	});

}
</script>
</body>
</html>
