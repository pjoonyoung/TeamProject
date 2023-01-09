<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 병원예약관리 프로젝트 **</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/page.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
		<!-- 관리자페이지폼 전체영역 -->
		<div class="pageBox rounded-2">
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<div class="col">
					<div class="h-100">
					<img src="${pageContext.request.contextPath}/resources/img/reservationLogo.png">
						<div class="button_box">
						<input type="button" class="btn btn-dark" class="button" value="전체예약확인" onclick="script:window.location='reservationAll'">
						</div>
					</div>
				</div>
				<div class="col">
					<div class="h-100">
					<img src="${pageContext.request.contextPath}/resources/img/modifyLogo.png">
						<div class="button_box">
						<input type="button" class="btn btn-dark" value="회원 관리" onclick="script:window.location='admemberList'">
						</div>
					</div>
				</div>
				<div class="col">
					<div class="h-100">
					<img src="${pageContext.request.contextPath}/resources/img/questionLogo.png">
						<div class="button_box">
						<input type="button" class="btn btn-dark" value="전체문의확인" onclick="script:window.location='list'">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>