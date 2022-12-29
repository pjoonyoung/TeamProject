<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/join.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">예약 완료</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02"></span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>
							<table border="0" cellspacing="0" cellpadding="10">
							<form action="reserveModify" method="get">
							<input type="hidden" value="${reservationDto.rnum }" name="rnum">
								<tr>
									<td colspan="2" align="center">예약 확인</td>
								</tr>
								<tr>
									<td><span class="content_text01">MEMBER ID</span></td>
									<td>${reservationDto.rid }</td>
								</tr>
								<tr>
									<td><span class="content_text01">NAME</span></td>
									<td>${reservationDto.rname }</td>
								</tr>
								<tr>
									<td><span class="content_text01">PHONE</span></td>
									<td>${reservationDto.rphone }</td>
								</tr>
								<tr>
									<td><span class="content_text01">ANIMAL</span></td>
									<td>${reservationDto.ranimal }</td>
								</tr>
								<tr>
									<td><span class="content_text01">ITEM</span></td>
									<td>${reservationDto.rlist }</td>
								</tr>
								<tr>
									<td><span class="content_text01">CONTENT</span></td>
									<td>${reservationDto.rcontent }</td>
								</tr>
								<tr>
									<td><span class="content_text01">RESERVE-DATE</span></td>
									<td>${reservationDto.rday }&nbsp;${reservationDto.rtime }</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input class="button_type01" type="submit" value="예약수정">
										<input class="button_type01" type="button" value="확인" onclick="script:window.location='myreservation?rid=${memberId}'">
									</td>
								</tr>
							</table>
							</center>
						</td>
					</tr>
					</form>
				</table>
				</center>
			</td>
		</tr>
	</table>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>