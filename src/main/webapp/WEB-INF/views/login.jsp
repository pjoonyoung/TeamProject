<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">회원 로그인</span>
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
								<form action="loginOk" method="post">
									<tr>
										<td><span class="content_text01">MEMBER ID</span></td>
										<td><input class="input_type01" type="text" name="mid"></td>
									</tr>
									<tr>
										<td><span class="content_text01">PASSWORD</span></td>
										<td><input class="input_type01" type="password" name="mpw"></td>
									</tr>
									<tr>
										<td colspan="2">
											<input class="button_type01" type="submit" value="로그인">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="회원가입" onclick="script:window.location='join'">
											<input class="button_type02" type="button" value="관리자" onclick="script:window.location='adminlogin'">
										</td>
									</tr>
								</form>
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