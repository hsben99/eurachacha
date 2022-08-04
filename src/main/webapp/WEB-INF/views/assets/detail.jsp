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
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">

<title>의라차차</title>

<link rel="shortcut icon" href="${path}/resources/images/gt_favicon.png">

<!-- Bootstrap -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.no-icons.min.css"
	rel="stylesheet">
<!-- Icons -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<!-- Fonts -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Alice|Open+Sans:400,300,700">
<!-- Custom styles -->
<link rel="stylesheet" href="${path}/resources/css/styles.css">

</head>
<body class="home">
	<jsp:include page="./header.jsp"></jsp:include>

	<main id="main" style="min-height: 62vh;">
		<div class="container">
			<%
				if (session.getAttribute("id") != null && (session.getAttribute("id").equals(request.getAttribute("writerId"))
					|| session.getAttribute("role").equals("admin"))) {
			%>
			<div style="text-align: right;">
				<span onclick="location.href='/deleteById/${model.id}'">삭제</span>
				
				<span onclick="location.href='/updateById/${model.id}'">수정</span>
			</div>
			<%
				}
			%>
			<div class="row topspace">
				<div class="col-sm-8 col-sm-offset-2">
					<article class="post">
						<div id="category" style="color:black; display: flex; justify-content: center;">
							<c:choose>
						         <c:when test = "${model.category eq 'medical'}">
					           		 <p>의료·학술</p>
						         </c:when>
						         <c:when test = "${model.category eq 'bio'}">
						         	<p>제약·바이오</p>
						         </c:when>
						         <c:when test = "${model.category eq 'tech'}">
						         	<p>의료기기·IT</p>
						         </c:when>
						     </c:choose>
						</div>
						<header class="entry-header">
							<h2 class="entry-title"
								style="font-size: 25px; font-weight: 900;">${model.title}</h2>
						</header>
						<div class="entry-content">${model.content}</div>
						<div
							style="display: flex; justify-content: flex-end; margin-bottom: 40px;">
							<span class="posted-on"><time
									class="entry-date published" style="font-size: 13px;">발행일
									${model.regDate}</time></span>
						</div>
						<div id="writerInfo">
							<div style="font-weight: 900;">ABOUT AUTHOR</div>
							<br>
							<div style="padding-left: 15px;">
								<span id="userID" style="font-weight: 900;"></span><span
									style="font-weight: 900;"> 기자</span> &nbsp; &nbsp; &nbsp; <span
									id="userEmail" style="padding-left: 15px;"></span>
							</div>

							<br>
							<div id="userIntro" style="padding-left: 15px;"></div>
						</div>
					</article>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="./footer.jsp"></jsp:include>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

	<script>
		$(function() {
			//파라미터 jsp el임
			getUser('${model.writerId}');
		})

		const getUser = function(id) {

			$.ajax({
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				method : "GET",
				url : "/getUser/" + id,
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
		<!-- 네이버 애널리틱스 -->	
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript">
		if(!wcs_add) var wcs_add = {};
		wcs_add["wa"] = "159d13e8e73ccd0";
		if(window.wcs) {
			wcs_do();
		}
	</script>
</body>
</html>
