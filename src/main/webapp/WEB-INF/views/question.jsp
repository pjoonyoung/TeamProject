<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">질문 게시판</span>
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
								<form action="questionOk" method="post" name="board_frm">
									<tr>
										<td><span class="content_text01">MEMBER ID</span></td>
										<td><input class="input_type01" type="text" name="qid" value="${member.mid }" readonly="readonly"></td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME</span></td>
										<td><input class="input_type01" type="text" name="qname" value="${member.mname }"> &nbsp;&nbsp;&nbsp;&nbsp;
										<span class="content_text01">E-MAIL</span>&nbsp;
										<input class="input_type01" type="text" name="qemail" value="${member.memail }"></td>
									</tr>
									<tr>
										<td><span class="content_text01">TITLE</span></td>
										<td><input class="input_type02" type="text" name="qtitle"></td>
									</tr>
									<tr>
										<td><span class="content_text01">QUESTION</span></td>
										<td><textarea class="textarea_text01" rows="5" cols="30" name="qcontent"></textarea></td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<input class="button_type01" type="button" value="질문하기" onclick="boardCheck()">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
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