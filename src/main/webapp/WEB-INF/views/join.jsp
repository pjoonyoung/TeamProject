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
				<span class="title01">회원 가입</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
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
								<form action="joinOk" method="post" name="join_frm">
									<tr>
										<td><span class="content_text01">MEMBER ID</span></td>
										<td><input class="input_type01" type="text" name="mid"></td>
									</tr>
									<tr>
										<td><span class="content_text01">PASSWORD</span></td>
										<td><input class="input_type01" type="password" name="mpw"></td>
									</tr>
									<tr>
										<td><span class="content_text01">PW CHECK</span></td>
										<td><input class="input_type01" type="password" name="mpw_check"></td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME</span></td>
										<td><input class="input_type01" type="text" name="mname"></td>
									</tr>
									<tr>
										<td><span class="content_text01">GENDER</span></td>
										<td>
											MAN <input type="checkbox" name="mgender" value="male">&nbsp;
											WOMAN <input type="checkbox" name="mgender" value="female">
										</td>
									</tr>
									<tr>
										<td><span class="content_text01">PHONE</span></td>
										<td><input class="input_type01" type="text" name="mphone" value="- 제외 입력"></td>
									</tr>
									<tr>
										<td><span class="content_text01">E-MAIL</span></td>
										<td><input class="input_type01" type="text" name="memail"></td>
									</tr>
									<tr>
										<td colspan="2">
											<input class="button_type01" type="button" value="가입완료" onclick="joinCheck()">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="로그인" onclick="script:window.location='login'">
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