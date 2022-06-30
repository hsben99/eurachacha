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
	<jsp:include page="./header.jsp"></jsp:include>
	
	<main id="main" style="min-height:60vh;"> 

		<div class="container" style="text-align: center;">
			<div>
				<h2>의료의 흥미로움 우리의 이야기로 열다.</h2><br>
			</div>
			
			<div>
				<h3>의료산업 발전의 중요함을 고민합니다.</h3><br>
			</div>
			<p></p>
		</div>

	</main>
	
	<jsp:include page="./footer.jsp"></jsp:include>

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
							
							/* for (var i = result.mainList.length - 1; i >= 0; i--) { */
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
					
				}
					$("#pageDiv").html("");
					
					var sPageNo = result.sPageNo;
					var ePageNo = result.ePageNo;
					var before = parseInt(sPageNo) - 1;
					var next = parseInt(ePageNo) + 1;

					// 6~10 페이지가 안나오는 버그해결용 
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
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/template.js"></script>
	
	<!-- 네이버 애널리틱스 -->	
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript">
		if(!wcs_add) var wcs_add = {};
			wcs_add["wa"] = "151391aa0e09220";
		if(window.wcs) {
			wcs_do();
		}
	</script>
</body>
</html>
