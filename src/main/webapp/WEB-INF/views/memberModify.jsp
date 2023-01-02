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
				<span class="title01">회원 정보수정</span>
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
								<form action="memberModifyOk" method="post" name="join_frm">
									<tr>
										<td><span class="content_text01">MEMBER ID</span></td>
										<td><input class="input_type01" type="text" name="mid" value="${memberdto.mid }" readonly="readonly"></td>
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
										<td><input class="input_type01" type="text" name="mname" value="${memberdto.mname }"></td>
									</tr>
									<tr>
										<td><span class="content_text01">GENDER</span></td>
										<td><input class="input_type01" type="text" name="mgender" value="${memberdto.mgender }" readonly="readonly"></td>
									</tr>
									<tr>
										<td><span class="content_text01">PHONE</span></td>
										<td><input class="input_type01" type="text" name="mphone" value="${memberdto.mphone }"></td>
									</tr>
									<tr>
										<td><span class="content_text01">E-MAIL</span></td>
										<td><input class="input_type01" type="text" name="memail" value="${memberdto.memail }"></td>
									</tr>
									<tr>
										<td colspan="2">
											<input class="button_type01" type="button" value="수정완료" onclick="joinCheck()">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="수정취소" onclick="script:window.location='mypage'">
											<input class="button_type02" type="button" value="탈퇴" onclick="script:window.location='mPwCheck'">
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