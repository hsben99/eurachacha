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
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<title >의라차차</title>

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

<link rel="stylesheet" type="text/css" href="${path}/resources/css/index.css">


</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	<jsp:include page="./navbar.jsp"></jsp:include>
	<main>
		<div id="dataList" class="row" style="min-height: 62vh; padding: 40px;">
		
		</div>
	</main>
	
	<div class="" style="display: flex; justify-content: center;">
		<ul id="pageDiv" class="pagination">
		</ul>
	</div>

<jsp:include page="./footer.jsp"></jsp:include>
	
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
				for (var i = 0; i < result.mainList.length; i++) {
					var mainListDate =result.mainList[i].regDate.substr(0,10);
					var removeContentsHtml = result.mainList[i].content.replace(/<[^>]*>?/g, '');
					
					$("#dataList").append(
							"<div class='data-item col-xs-12 col-sm-6 col-md-4 col-lg-3 ' data-id="+result.mainList[i].id+" style='border: 1px solid gray; height:300px; max-width:30rem;'>"
								+ "<p style='font-size:18px; font-weight:800; height:3.2rem; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;'>"+result.mainList[i].title+"</p>"
								+ "<p style='height:3rem; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;'>"+removeContentsHtml+"</p>"
								+ "<p style='margin-top:5rem; margin-bottom:0;'>"+mainListDate+"</p>" 
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
				$("#pageDiv").html("");
				
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
