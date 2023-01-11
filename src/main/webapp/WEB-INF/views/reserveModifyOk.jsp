<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<fmt:formatDate value="${now}" pattern="HH:mm" var="todaytime" />
	
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
	
		<!-- 예약 확인폼 전체영역 -->
		<div class="rViewBox rounded-2">
		
			<!-- 예약확인 페이지 타이틀 -->
			<div id="rBoxTitle">JoonHospital</div>
			
			<!-- 예약확인 내용 박스 -->
			<table class="table border-dark">
			<input type="hidden" value="${reserveview.rnum }" name="rnum">
				<tbody>
					<tr>
						<td><span class="content_text01">접수 아이디 : </span></td>
						<td class="reserve_content01">${reserveview.rid }</td>
					</tr>
				</tbody>
				<tobody>
					<tr>
						<td><span class="content_text01">이름 : </span></td>
						<td class="reserve_content01">${reserveview.rname }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">전화번호 : </span></td>
						<td class="reserve_content01">${reserveview.rphone }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">동물종류 : </span></td>
						<td class="reserve_content01">${reserveview.ranimal }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">희망접수 : </span></td>
						<td class="reserve_content01">${reserveview.rlist }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">접수증상 : </span></td>
						<td class="reserve_content01">${reserveview.rcontent }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">예약일자 : </span></td>
						<td class="reserve_content01">${reserveview.rday }&nbsp;${reserveview.rtime }</td>
					</tr>
				</tobody>
					<tr>
						<td><span class="content_text01">예약상태 : </span></td>
							<fmt:parseDate value="${reserveview.rday }" pattern="yyyy-MM-dd" var="rday" />
							<fmt:parseDate value="${reserveview.rtime }" pattern="HH:mm" var="rtime" />
							<fmt:formatDate value="${rday}" pattern="yyyy-MM-dd" var="reday" />
							<fmt:formatDate value="${rtime}" pattern="HH:mm" var="retime" />
						<c:choose>
							<c:when test="${today lt reday}">
								<td class="reserve_content01">예약중</td>
					</tr>
					</table>
					<tr>
						<%
							if(sessionId.equals("ADMIN")) {
						%>
							<div class="btn1">
								<input class="btn btn-dark" type="button" value="확인" onclick="script:window.location='reservationAll'">
							</div>
						<%
							} else if(sessionId != null) {
						%>
							<div class="btn1">
								<input class="btn btn-dark" type="button" value="확인" onclick="script:window.location='myreservation?rid=${memberId}'">
							</div>
						<%
							} else {
						%>
						<%
							}
						%>
					</tr>
					</c:when>
						<c:when test="${today le reday && todaytime le retime }">
							<td class="reserve_content01">예약중</td>
					</table>
					<tr>
						<%
							if(sessionId.equals("ADMIN")) {
						%>
							<div class="btn1">
								<input class="btn btn-dark" type="button" value="확인" onclick="script:window.location='reservationAll'">
							</div>
						<%
							} else if(sessionId != null) {
						%>
							<div class="btn1">
								<input class="btn btn-dark" type="button" value="확인" onclick="script:window.location='myreservation?rid=${memberId}'">
							</div>
						<%
							} else {
						%>
						<%
							}
						%>
					</tr>	
					</c:when>
				</c:choose>
			</table>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>