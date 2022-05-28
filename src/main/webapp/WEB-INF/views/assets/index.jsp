<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% session = request.getSession(); %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<title >의라차차</title>

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
			<h1 id="logo" class="text-center" style=" height: 200px; ">
				<!-- <a onclick="callList();" style="color:black; text-decoration: none; font-weight:900; ">의라차차</a> -->
				<img alt="logo" src="${path}/resources/images/logo.svg" onclick="callList();" style="position: relative; top: -100px; left: -300px;"/>
			</h1>
		</div>
		<nav class="navbar navbar-default navbar-sticky">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="#" onclick="callList('1','','');" style="font-weight:700;" >전체</a></li>
						<li><a href="#" onclick="callList('1','','medical');" style="font-weight:700;" >의료·학술</a></li>
						<li><a href="#" onclick="callList('1','','bio');" style="font-weight:700;">제약·바이오</a></li>
						<li><a href="#" onclick="callList('1','','tech');" style="font-weight:700;">의료기기·IT</a></li> 
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
	</header>
	<main id="main" style="min-height:62vh;">

		<div class="container">
			<div class="row section featured topspace">
				<div id="dataList" class="row">
				
				</div>
			</div> 
			<center class="" >
				<ul class="pagination" id="pageDiv">
				</ul>
			</center>
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
				<span ><a href="/eurachacha">About BEENPICTURES</a></span>
				<span><a href="/teenProtect"> 청소년보호정책</a></span>
			</div>	
		</div>
	</footer>
	
	<script>
	$(function() {	
		callList();
		$(document).on("click",".data-item",function(){
			var id = $(this).attr("data-id");
			location.href="/moveDetailPage/"+id; 
		});
	})
	
	var callList = function(page,searchKey, category){
		if(searchKey === undefined){
			searchKey = ""; 
		}
		if(category === undefined){
			category = ""; 
		}		
		
		var data = {
			"page" : page,
			"searchKey" : searchKey,
			"category" : category
		}		
		
		$.ajax({
			contentType : "application/json; charset=utf-8",
			dataType   :"json",
			method : "POST",
			url : "/getMainList",
			data : JSON.stringify(data),
			success : function(result) {
				//기존에 생성된 동적화면 삭제
				$("#dataList").html("");

				//받은 데이터를 태그로만들어서 append
				/* for (var i = result.mainList.length - 1; i >= 0; i--) { */
				for (var i = 0; i < result.mainList.length; i++) {
					$("#dataList")
						.append(
							"<div class='data-item col-sm-6 col-md-3' data-id="+result.mainList[i].id+" style='border: 1px solid; min-height: 20rem; max-height: 20rem; overflow: hidden; display:table-cell;'>"
								+ "<h3 class='text-center' >"+result.mainList[i].title+"</h3>"
								+ "<p>"+result.mainList[i].subTitle+"</p>"
								+ "</div>")
				} 
			},
			error : function(result) {
				console.log("error");
			}
		});
		
		callPage(page,searchKey,category);
	}
	
	
	
	var callPage = function(page, searchKey, category){
		
		var pageData = {
		   "page" : page,
		   "searchKey": searchKey,
		   "category": category,
	    }
		
		$.ajax({
			contentType: "application/json; charset=utf-8",
  	    	dataType   :"json",
  	    	method     :"POST",
			url:"/pageInfo.do",
			data: JSON.stringify(pageData),
			success:function(result){
				//기존 동적생성된 페이징 삭제
				$("#pageDiv").html("");
				//이전, 다음버튼에 쓰기위한 숫자
				var sPageNo = result.sPageNo;
				var ePageNo = result.ePageNo;					
				var before = parseInt(sPageNo)-1;
				var next = parseInt(ePageNo)+1;
				
				// 6~10 페이지가 안나오는 버그해결용 
				sPageNo = sPageNo == "6" ? 6 : sPageNo;
				
				//이전버튼 표시 조건걸기
				if(sPageNo != "1"){
					$("#pageDiv").append("<li ><a onclick=callList('"+before+"','"+searchKey+"')>&laquo;</a></li>");	
				}
				//페이징					
				for(var j = sPageNo; j <= ePageNo; j++){
					//$("#pageDiv").append("<li ><a><button class='btn"+j+"' onclick=callList("+j+",'"+searchKey+"')>"+j+"</button></a></li>");
					$("#pageDiv").append("<li ><a onclick=callList('"+j+"','"+searchKey+"')>"+j+"</a></li>");
				}
				//다음버튼 표시 조건걸기
				if(ePageNo != result.totalPage){
					$("#pageDiv").append("<li><a onclick=callList('"+next+"','"+searchKey+"')>&raquo;</a></li>");
				}
				$(".btn"+result.page).addClass("on");
				
			},
			error:function(result){
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
