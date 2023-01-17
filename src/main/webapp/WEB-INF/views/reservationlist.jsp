<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/page.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
	
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
	
		<!-- 예약 선택폼 전체영역 -->
		<div class="pageBox rounded-2">
		<form action="reservation" method="get">
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<div class="col">
					<div class="h-100">
					<img src="${pageContext.request.contextPath}/resources/img/clinicLogo.png">
						<div class="button_box">
							<input type="submit" class="btn btn-dark" class="button" value="진료" name="check">
						</div>
					</div>
				</div>
				<div class="col">
					<div class="h-100">
					<img src="${pageContext.request.contextPath}/resources/img/inoculationLogo.png">
						<div class="button_box">
							<input type="submit" class="btn btn-dark" value="예방접종" name="check">
						</div>
					</div>
				</div>
				<div class="col">
					<div class="h-100">
					<img src="${pageContext.request.contextPath}/resources/img/beautyLogo.png">
						<div class="button_box">
							<input type="submit" class="btn btn-dark" value="미용" name="check">
						</div>
					</div>
				</div>
			</div>
			<tr>
				<%
					//String boardId = (String) request.getAttribute("qid");
					
					if(sessionId == null) {
				%>
				<script type="text/javascript">
					alert("로그인이 필요한 기능입니다. 로그인 여부를 확인하여주세요.");
					history.go(-1);
				</script>
				<%
					} 
				%>
			</tr>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>