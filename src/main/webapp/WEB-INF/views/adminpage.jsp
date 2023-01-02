<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
		<tr>
			<td class="titlebox">
				<span class="title01">관리자 페이지</span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="100">
					<tr>
						<td rowspan="3" class="picbox1">
							<img src="${pageContext.request.contextPath}/resources/img/reservationLogo.png">
						<br><br>
						<input type="button" value="전체예약확인" onclick="script:window.location='reservationAll'"></td>
					</tr>
					<tr>
						<td rowspan="3" class="picbox1">
							<img src="${pageContext.request.contextPath}/resources/img/modifyLogo.png">
						<br><br>
						<input type="button" value="회원관리" onclick="script:window.location='admemberList'"></td>
					</tr>
					<tr>
						<td rowspan="3" class="picbox1">
							<img src="${pageContext.request.contextPath}/resources/img/questionLogo.png">
						<br><br>
						<input type="button" value="전체문의확인" onclick="script:window.location='list'"></td>
					</tr>
				</table>
				</center>
			</td>
		</tr>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>