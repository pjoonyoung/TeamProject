<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
		<!-- 문의수정폼 전체영역 -->
		<div class="qBox rounded-2">
		
			<!-- 문의수정폼 페이지 타이틀 -->
			<div id="joinBoxTitle">JoonHospital</div>
			
			<!-- 문의수정폼 내용 박스 -->
			<form class="row g-3" action="questionModifyOk" method="post" name="board_frm">
			<input type="hidden" value="${view.qnum }" name="qnum">
				<div class="col-md-3" align="left">
					<label for="inputId4" class="form-label content_text01">아이디</label>
					<input type="text" class="form-control" id="inputId4" value="${view.qid }" readonly="readonly" name="qid">
				</div>
				<div class="col-md-3 ms-auto" >
					<span align="right" name="qdate">
						<p class="content_text01">작성일자: ${view.qdate }</p>
					</span>
				</div>
				<div class="w-100"></div>
				<div class="col-md-3">
					<label for="inputName4" class="form-label content_text01">이름</label>
					<input type="text" class="form-control" id="inputName4" value="${view.qname }" readonly="readonly" name="qname">
				</div>
				<div class="col-md-3">
					<label for="inputEmail4" class="form-label content_text01">이메일</label>
					<input type="text" class="form-control" id="inputEmail4" value="${view.qemail }" readonly="readonly" name="qemail">
				</div>
				<div class="col-12">
					<label for="inputTitle" class="form-label content_text01">제목</label>
					<input type="text" class="form-control" id="inputTitle" value="${view.qtitle }" name="qtitle">
				</div>
				<div class="form-floating">
					<textarea class="form-control" placeholder="수정하실 내용을 입력하세요" id="floatingTextarea2" style="height: 200px" name="qcontent">${view.qcontent }</textarea>
					<label for="floatingTextarea2">수정하실 내용을 입력하세요</label>
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