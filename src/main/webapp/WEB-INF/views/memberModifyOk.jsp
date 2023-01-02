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
				<span class="title01">회원정보 수정완료</span>
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
									<tr>
										<td colspan="2" align="center">회원 정보 수정 완료</td>
									</tr>
									<tr>
										<td><span class="content_text01">MEMBER ID</span></td>
										<td>${memberDto.mid }</td>
									</tr>
									<tr>
										<td><span class="content_text01">PASSWORD</span></td>
										<td>${memberDto.mpw }</td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME</span></td>
										<td>${memberDto.mname }</td>
									</tr>
									<tr>
										<td><span class="content_text01">GENDER</span></td>
										<td>${memberDto.mgender }</td>
									</tr>
									<tr>
										<td><span class="content_text01">PHONE</span></td>
										<td>${memberDto.mphone }</td>
									</tr>
									<tr>
										<td><span class="content_text01">E-MAIL</span></td>
										<td>${memberDto.memail }</td>
									</tr>
									<tr>
										<td><span class="content_text01">JOIN-DATE</span></td>
										<td>${memberDto.mdate }</td>
									</tr>
									<tr>
									<%
										if(sessionId == null) {
									%>
									<%
										} else if(sessionId.equals("ADMIN")) {
									%>
										<td colspan="2">
											<input class="button_type01" type="button" value="정보수정" onclick="script:window.location='memberModify'">
											<input class="button_type01" type="button" value="돌아가기" onclick="script:window.location='admemberList'">
										</td>
									<%
										} else if(sessionId != null) {
									%>
									<td colspan="2">
										<input class="button_type01" type="button" value="정보수정" onclick="script:window.location='memberModify'">
										<input class="button_type01" type="button" value="돌아가기" onclick="script:window.location='mypage'">
									</td>
									<%
										}
									%>
									</tr>
							</table>
							</center>
						</td>
					</tr>
					
				</table>
				</center>
			</td>
		</tr>
	</table>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>