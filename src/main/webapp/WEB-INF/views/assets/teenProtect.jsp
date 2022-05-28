<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	session = request.getSession();
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

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

<!--[if lt IE 9]> <script src="${path}/resources/js/html5shiv.js"></script> <![endif]-->
</head>
<body class="home">

	<header id="header">
		<div id="head" class="parallax" parallax-speed="2" style="padding:0px;">

			<%
				if (session.getAttribute("id") == null || session.getAttribute("id") == "") {
			%>
			<div style="text-align: right; padding-right: 3vw;">
				<span onclick="location.href='/moveToLogin'">login</span>
			</div>
			<%
				} else {
			%>
			<div style="text-align: right; padding-right: 3vw;">
				<span onclick="location.href='/logout'">logout</span> | <span
					onclick="location.href='/moveWritePage'">write</span>
			</div>
			<%
				}
			%>
			<h1 id="logo" class="text-center" onclick="location.href='/'" style="overflow: hidden; height: 200px; margin: 0;">
				<img alt="logo" src="${path}/resources/images/logo.svg" style="position: relative; top: -100px; left: -300px;"/>
			</h1>
		</div>
		
	</header>
	<hr> 
	<main id="main">

		<div class="container">
			<div>
				<h2>청소년 보호정책</h2>
				 
					<h5>의라차차(이하 회사)는 청소년이 유해한 정보로부터 보호받고 건전한 인터넷 사용을 할 수 있도록 하기 위해 청소년 보호정책을 수립·시행하고 있습니다.<br>
						<br>회사는 관련 법률에 따라 청소년들이 유해한정보에 접근할 수 없도록 방지하고 있으며 청소년보호를 위해 아래와 같은 조치를 취하고 있습니다. </h5>
					<p>1. 유해정보에 대한 청소년접근제한 및 관리조치 회사는 청소년이 아무런 제한장치 없이 청소년 유해정보에
						노출되지 않도록 청소년 유해 정보에 대해서 별도의 인증장치를 마련, 적용하며 청소년 유해정보가 노출되지 않기 위한
						예방차원의 조치를 강구합니다.</p>
					<p>2. 유해정보로부터의 청소년보호를 위한 업무 담당자 교육 시행 회사는 청소년보호 관련 법령 및 제재기준,
						유해정보 발견시 대처방법, 위반사항 처리에 대한 보고절차등을 관련업무 담당자에게 교육하고 있습니다.</p>
					<p>3. 유해정보로 인한 피해상담 및 고충처리 회사는 청소년 유해정보로 인한 피해상담 및 고충처리를 위한 인력을
						배치하여 그 피해가 확산되지 않도록 하고있습니다. 이용자 분들께서는 하단에 명시한 ‘청소년보호 책임자 및 담당자의
						소속, 성명 및 연락처’를 참고하여 전화나 이메일을 통해 피해상담 및 고충처리를 요청할 수있습니다.</p>
					<p>4. 청소년보호 책임자 및 담당자 지정 청소년보호책임자 및 청소년보호담당자를 지정하여 청소년유해정보의 차단
						및 관리,청소년유해정보로부터의 청소년보호정책을수립하는 등 청소년보호업무에 최선을 다하고 있습니다.</p>
			</div>
			<div>
				<p>
					청소년 보호 책임자 및 보호 담당자<br>
					 성명 : 박지연 <br>
					 소속 : 경영관리부 <br>
					 직위 : 운영이사 <br> 
					 전화번호 :02-470-2014<br>
					 이메일 : contact@beenpictures.com 
				</p>
			</div>

			<p></p>
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
				"> 
			<p style="font-weight: 900; margin-bottom:5px;">빈픽쳐스</p>
			<span>사업자번호 : 236-30-00585  등록번호 : 서울, 아05141 등록일자 : 2018.4.25</span><br>	
			<span>주소 : 서울시 성동구 무학로 14길18 가동 602호 (홍익동 한신그린빌)</span><br>
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
				<span ><a href="#" onclick="location.href='/eurachacha'">About BEENPICTURES</a></span>
				<span><a href="#" onclick="location.href='/teenProtect'"> 청소년보호정책</a></span>
			</div>	
		</div>
	</footer>
	<script>
		$(function() {
			callList();
			$(document).on("click", ".data-item", function() {
				var id = $(this).attr("data-id");
				location.href = "/moveDetailPage/" + id;
			});
		})

		var callList = function(page, searchKey, category) {
			if (searchKey === undefined) {
				searchKey = "";
			}
			if (category === undefined) {
				category = "";
			}

			var data = {
				"page" : page,
				"searchKey" : searchKey,
				"category" : category
			}
			$.ajax({
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					method : "POST",
					url : "/getMainList",
					data : JSON.stringify(data),
					success : function(result) {
						$("#dataList").html("");
						for (var i = 0; i < result.mainList.length; i++) {
							$("#dataList")
									.append(
											"<div class='data-item col-sm-6 col-md-3' data-id="+result.mainList[i].id+" style='border: 1px solid; min-height: 20rem; max-height: 20rem; overflow: hidden; display:table-cell;'>"
													+ "<h3 class='text-center' >"
													+ result.mainList[i].title
													+ "</h3>"
													+ "<p>"
													+ result.mainList[i].content
													+ "</p>" + "</div>")
						}
					},
					error : function(result) {
						console.log("error");
					}
				});

			callPage(page, searchKey, category);
		}

		var callPage = function(page, searchKey, category) {

			var pageData = {
				"page" : page,
				"searchKey" : searchKey,
				"category" : category,
			}

			$.ajax({
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				method : "POST",
				url : "/pageInfo.do",
				data : JSON.stringify(pageData),
				success : function(result) {
					$("#pageDiv").html("");
					var sPageNo = result.sPageNo;
					var ePageNo = result.ePageNo;
					var before = parseInt(sPageNo) - 1;
					var next = parseInt(ePageNo) + 1; 
					sPageNo = sPageNo == "6" ? 6 : sPageNo;
					if (sPageNo != "1") {
						$("#pageDiv").append(
								"<li ><a onclick=callList('" + before + "','"
										+ searchKey + "')>&laquo;</a></li>");
					}
					for (var j = sPageNo; j <= ePageNo; j++) {
						$("#pageDiv").append(
								"<li ><a onclick=callList('" + j + "','"
										+ searchKey + "')>" + j + "</a></li>");
					}
					if (ePageNo != result.totalPage) {
						$("#pageDiv").append(
								"<li><a onclick=callList('" + next + "','"
										+ searchKey + "')>&raquo;</a></li>");
					}
					$(".btn" + result.page).addClass("on");

				},
				error : function(result) {
					console.log("페이지 정보 error");
				}
			});

		}
	</script>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/template.js"></script>
</body>
</html>
