<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<title>** 병원예약관리 프로젝트 **</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
	
		<!-- 문의폼 전체영역 -->
		<div class="qBox rounded-2">
		
			<!-- 문의하기 페이지 타이틀 -->
			<div id="joinBoxTitle">JoonHospital</div>
			
			<!-- 문의하기 내용 박스 -->
			<form class="row g-3" action="questionOk" method="post" name="board_frm">
			<input type="hidden" value="${member.mid }" name="qid">
				<div class="col-md-3">
					<label for="inputName4" class="form-label content_text01">이름</label>
					<input type="text" class="form-control" id="inputName4" value="${member.mname }" name="qname">
				</div>
				<div class="col-md-3">
					<label for="inputEmail4" class="form-label content_text01">이메일</label>
					<input type="text" class="form-control" id="inputEmail4" value="${member.memail }" name="qemail">
				</div>
				<div class="col-12">
					<label for="inputTitle" class="form-label content_text01">제목</label>
					<input type="text" class="form-control" id="inputTitle" placeholder="제목을 입력하세요" name="qtitle">
				</div>
				<div class="form-floating">
					<textarea class="form-control" placeholder="문의내용을 입력하세요" id="floatingTextarea2" style="height: 200px" name="qcontent"></textarea>
					<label for="floatingTextarea2">문의내용을 입력하세요</label>
				</div>
				
				<div class="col-12 btn1">
				  <input type="button" class="btn btn-dark" style="width:10%" value="등록하기" onclick="boardCheck()">
				  <input type="button" class="btn btn-dark" style="width:10%" value="글목록" onclick="script:window.location='list'">
				</div>
			</form>
		</div>	
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>