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

<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<title>로그인</title>

<link rel="shortcut icon" href="${path}/resources/images/gt_favicon.png">

<link rel="stylesheet" href="${path}/resources/css/login.css">

</head>
<body class="home">

	<div class="login-page">
		<div class="form" id="userList">
			<div style="display: flex;">
				<input type="text" placeholder="username" name="id" value="asd" disabled="disabled" style="margin:0;"/>
				<button type="submit">삭제</button>
			</div>
		</div>
	</div>

<script>
	
	$(function() {
		callUserList();
	})
	
	const callUserList = function(){
		$.ajax({
			dataType   :"json",
			contentType : "application/json; charset=utf-8",
			method : "GET",
			url : "/getUserList",
			success : function(result) {
				writeList(result) 				
			},
			error : function(result) {
				console.log("error");
			}
		});
	}
	
	const writeList = function(result){
		$("#userList").html("");
		for (var i = 0; i < result.userList.length; i++) {
			$("#userList").append(
				'<div style="display: flex; margin-bottom:4px;">'
					+'<input type="text" value="'+result.userList[i].id+'" disabled="disabled" style="margin:0;"/>'
					+'<button onclick="deleteUser('+result.userList[i].id+')">삭제</button>'
				+'</div>'
			)
		}
	}
	
	const deleteUser = function(id){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="deleteUser?id="+id;
		}
		
		
	}
	
	</script>	
</body>

</html>
