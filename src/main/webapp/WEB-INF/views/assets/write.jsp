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
	<script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js" charset="utf-8"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<title>글작성</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/write.css">
</head>
<body class="home">
<jsp:include page="./header.jsp"></jsp:include>	
<main>
	<div>
		<input type="text" id="title" class="titles" placeholder="title" maxlength="30"> 
		<select id ="category" style="text-align: center;">
			<option value="medical" selected="selected">의료·학술</option>
			<option value="bio">제약·바이오 </option>
			<option value="tech">의료기기·IT</option>
		</select>
		<div id="editorDiv">
			<textarea id="bookIntro_textarea" ></textarea>
		</div>	
		
		<button id="testBtn" onclick="writeContent()">글쓰기</button>
	</div>
</main>	
	
	
	
<jsp:include page="./footer.jsp"></jsp:include>

<script>
	var ckeditor_config = {
			resize_enable : false,
			enterMode : CKEDITOR.ENTER_BR,
			width:'100%',
            height:'400px',
			filebrowserImageUploadUrl : "/fileUpload.do"

	};
	CKEDITOR.replace("bookIntro_textarea",ckeditor_config);
	
	
	//이미지업로드 관련 불필요한 탭 삭제
	CKEDITOR.on('dialogDefinition', function( ev ){
         var dialogName = ev.data.name;
         var dialogDefinition = ev.data.definition;
       
         switch (dialogName) {
             case 'image': //Image Properties dialog
                 //dialogDefinition.removeContents('info');
                 dialogDefinition.removeContents('Link');
                 dialogDefinition.removeContents('advanced');
                 break;
         }
    });
		
	
var writeContent = function(){ 
	var title = $("#title").val();
	var subTitle = $("#subTitle").val();
	var content = CKEDITOR.instances.bookIntro_textarea.getData();
	var category = $("#category").val();
	
	var formData = new FormData();
	formData.append("title",title);
	formData.append("subTitle",subTitle);
	formData.append("content",content);
	formData.append("category",category);	
	
	$.ajax({
		type : "POST",
		enctype : 'multipart/form-data', // 필수
		url : '/write',
		data : formData, // 필수
		processData : false, // 필수 
		contentType : false, // 필수 
		cache : false,
		success : function(result) {
		 	alert("작성되었습니다.");
		 	location.href="/";
		},
		error : function(e) {
			alert("글 작성 실패 관리자에게 문의하세요.");
		}
	}); 	
}

</script>

</body>
</html>
