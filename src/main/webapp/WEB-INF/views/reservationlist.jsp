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
				<span class="title01">예약 페이지</span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="100">
					<form action="reservation" method="get">
					<tr>
						<td rowspan="3" class="picbox1">
							<img src="${pageContext.request.contextPath}/resources/img/clinicLogo.png">
						<br><br>
						<input type="submit" value="진료" name="check"></td>
					</tr>
					<tr> 
						<td rowspan="3" class="picbox1">
							<img src="${pageContext.request.contextPath}/resources/img/inoculationLogo.png">
						<br><br>
						<input type="submit" value="예방접종" name="check"></td>
					</tr>
					<tr>
						<td rowspan="3" class="picbox1">
							<img src="${pageContext.request.contextPath}/resources/img/beautyLogo.png">
						<br><br>
						<input type="submit" value="미용" name="check"></td>
					</tr>
					</form>
				</table>
				</center>
			</td>
		</tr>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>