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
				<span class="title01">질문 수정</span>
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
								<form action="questionModifyOk" method="post" name="board_frm">
									<input type="hidden" value="${view.qnum }" name="qnum">
									<tr>
										<td><span class="content_text01">MEMBER ID</span></td>
										<td><input class="input_type01" type="text" name="qid" value="${view.qid }" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;
										<span class="content_text01">E-MAIL</span>&nbsp;
										<input class="input_type01" type="text" name="qemail" value="${view.qemail }"></td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME</span></td>
										<td><input class="input_type01" type="text" name="qname" value="${view.qname }">&nbsp;&nbsp;&nbsp;&nbsp;
										<span class="content_text01">DATE</span>&nbsp;&nbsp;&nbsp;&nbsp;
										<input class="input_type01" type="text" name="qdate" value="${view.qdate }" readonly="readonly"></td>
									</tr>
									<tr>
										<td><span class="content_text01">QUESTION</span></td>
										<td><textarea class="textarea_text01" rows="5" cols="30" name="qcontent">${view.qcontent }</textarea></td>
									</tr>
									<tr>
										<td colspan="2" align="center">
										<input class="button_type01" type="submit" value="수정완료">&nbsp;&nbsp;
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