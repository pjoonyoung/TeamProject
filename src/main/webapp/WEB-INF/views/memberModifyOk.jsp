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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
	
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
	
		<!-- 정보수정 확인폼 전체영역 -->
		<div class="rViewBox rounded-2">
		
			<!-- 정보수정 확인 페이지 타이틀 -->
			<div id="rBoxTitle">JoonHospital</div>
			
			<!-- 정보수정 확인 내용 박스 -->
			<table class="table border-dark">
				<tbody>
					<tr>
						<td><span class="content_text01">회원 아이디 : </span></td>
						<td class="reserve_content01">${memberDto.mid }</td>
					</tr>
				</tbody>
				<tobody>
					<tr>
						<td><span class="content_text01">비밀번호 : </span></td>
						<td class="reserve_content01">${memberDto.mpw }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">이름 : </span></td>
						<td class="reserve_content01">${memberDto.mname }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">성별 : </span></td>
						<td class="reserve_content01">${memberDto.mgender }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">전화번호 : </span></td>
						<td class="reserve_content01">${memberDto.mphone }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">E-MAIL : </span></td>
						<td class="reserve_content01">${memberDto.memail }</td>
					</tr>
				</tobody>
				<tobody>
					<tr>
						<td><span class="content_text01">가입 일자 : </span></td>
						<td class="reserve_content01">${memberDto.mdate }</td>
					</tr>
				</tobody>
				</table>
					<tr>
						<%
							if(sessionId == null) {
						%>
						<%
							} else if(sessionId.equals("ADMIN")) {
						%>
							<div class="btn1">
								<input class="btn btn-dark" type="button" value="돌아가기" onclick="script:window.location='admemberList'">
							</div>
						<%
							} else if(sessionId != null) {
						%>
						<div class="btn1">
							<input class="btn btn-dark" type="button" value="정보수정" onclick="script:window.location='memberModify'">
							<input class="btn btn-dark" type="button" value="돌아가기" onclick="script:window.location='mypage'">
						</div>
						<%
							}
						%>		
					</tr>
			</table>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>