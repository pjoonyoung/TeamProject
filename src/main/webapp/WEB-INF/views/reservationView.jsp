<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>
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
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<fmt:formatDate value="${now}" pattern="HH:mm" var="todaytime" />
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">예약 확인</span>
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
									<td><span class="content_text01">STATE</span></td>
									<fmt:parseDate value="${reservationDto.rday }" pattern="yyyy-mm-dd" var="rday" />
									<fmt:parseDate value="${reservationDto.rtime }" pattern="HH:mm" var="rtime" />
									<fmt:formatDate value="${rday}" pattern="yyyy-MM-dd" var="reday" />
									<fmt:formatDate value="${rtime}" pattern="HH:mm" var="retime" />
									<c:choose>
										<c:when test="${today lt reday}">
											<td class="board_content01">예약중</td>
										<tr>
										<%
											if(sessionId.equals("ADMIN")) {
										%>
											<td colspan="2" align="center">
												<input class="button_type01" type="submit" value="예약수정">
												<input class="button_type01" type="button" value="확인" onclick="script:window.location='reservationAll'">
											</td>
										<%
											} else if(sessionId != null) {
										%>
											<td colspan="2" align="center">
												<input class="button_type01" type="submit" value="예약수정">
												<input class="button_type01" type="button" value="확인" onclick="script:window.location='myreservation?rid=${memberId}'">
											</td>
										<%
											} else {
										%>
										<%
											}
										%>
										</tr>
										</c:when>
										<c:when test="${today le reday && todaytime le retime }">
											<td class="board_content01">예약중</td>
										<tr>
										<%
											if(sessionId.equals("ADMIN")) {
										%>
											<td colspan="2" align="center">
												<input class="button_type01" type="submit" value="예약수정">
												<input class="button_type01" type="button" value="확인" onclick="script:window.location='reservationAll'">
											</td>
										<%
											} else if(sessionId != null) {
										%>
											<td colspan="2" align="center">
												<input class="button_type01" type="submit" value="예약수정">
												<input class="button_type01" type="button" value="확인" onclick="script:window.location='myreservation?rid=${memberId}'">
											</td>
										<%
											} else {
										%>
										<%
											}
										%>
										</tr>	
										</c:when>
										<c:when test="${today gt reday}">
											<td class="board_content01">처리완료</td>
										<tr>
										<%
											if(sessionId.equals("ADMIN")) {
										%>
											<td colspan="2" align="center">
												<input class="button_type01" type="button" value="예약삭제" onclick="script:window.location='adrDelete?rnum=${reservationDto.rnum }'">
												<input class="button_type01" type="button" value="확인" onclick="script:window.location='reservationAll'">
											</td>
										<%
											} else if(sessionId != null) {
										%>
											<td colspan="2" align="center">
												<input class="button_type01" type="button" value="예약삭제" onclick="script:window.location='reserveDelete?rnum=${reservationDto.rnum }'">
												<input class="button_type01" type="button" value="확인" onclick="script:window.location='myreservation?rid=${memberId}'">
											</td>
										<%
											} else {
										%>
										<%
											}
										%>
										</tr>	
										</c:when>
										<c:when test="${today ge reday && todaytime gt retime }">
											<td class="board_content01">처리완료</td>
										<tr>
										<%
											if(sessionId.equals("ADMIN")) {
										%>
											<td colspan="2" align="center">
												<input class="button_type01" type="button" value="예약삭제" onclick="script:window.location='adrDelete?rnum=${reservationDto.rnum }'">
												<input class="button_type01" type="button" value="확인" onclick="script:window.location='reservationAll'">
											</td>
										<%
											} else if(sessionId != null) {
										%>
											<td colspan="2" align="center">
												<input class="button_type01" type="button" value="예약삭제" onclick="script:window.location='reserveDelete?rnum=${reservationDto.rnum }'">
												<input class="button_type01" type="button" value="확인" onclick="script:window.location='myreservation?rid=${memberId}'">
											</td>
										<%
											} else {
										%>
										<%
											}
										%>
										</tr>
										</c:when>
									</c:choose>
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