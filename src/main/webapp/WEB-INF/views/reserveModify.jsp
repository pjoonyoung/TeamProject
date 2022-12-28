<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">예약 수정</span>
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
								<form action="reservModifyOk" method="post" name="reservation_frm">
								<input type="hidden" value="${view.qnum }" name="qnum">
									<tr>
										<td><span class="content_text01">MEMBER ID</span></td>
										<td><input class="input_type01" type="text" name="rid" value="${memberId}"></td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME</span></td>
										<td><input class="input_type01" type="text" name="rname" value="${member.mname}"></td>
									</tr>
									<tr>
										<td><span class="content_text01">PHONE</span></td>
										<td><input class="input_type01" type="text" name="rphone">&nbsp;- 제외 입력</td>
									</tr>
									<tr>
										<td><span class="content_text01">DATE</span></td>
										<td>
											<input class="input_type01" type="date" name="rday">&nbsp;
											<select class="select_type01" name="selectOption">
								                <option value="09:30">09:30</option>
								                <option value="10:20">10:20</option>
								                <option value="11:10">11:10</option>
								                <option value="12:00">12:00</option>
								                <option value="14:10">14:10</option>
								                <option value="15:00">15:00</option>
								                <option value="15:50">15:50</option>
								                <option value="16:40">16:40</option>
								                <option value="17:30">17:30</option>
							            	</select>
							            </td>
									</tr>
									<tr>
										<td><span class="content_text01">ANIMAL</span></td>
										<td><input class="input_type01" type="text" name="ranimal"></td>
									</tr>
									<tr>
										<td><span class="content_text01">LIST</span></td>
										<td><input class="input_type01" type="text" name="rlist" value="${check }"></td>
									</tr>
									<tr>
										<td><span class="content_text01">CONTENT</span></td>
										<td colspan="2"><textarea class="textarea_text01" rows="5" cols="30" name="rcontent"></textarea></td>
									</tr>
									<tr>
										<td colspan="3" align="center">
											<input class="button_type01" type="button" value="수정완료" onclick="reservationCheck()">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="수정취소" onclick="script:window.location='index'">
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