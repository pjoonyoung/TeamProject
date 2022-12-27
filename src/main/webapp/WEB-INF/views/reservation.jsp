<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
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
				<span class="title01">예약 페이지</span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>
							<table border="1" cellspacing="0" cellpadding="10">
								<form action="reservationOk" method="post" name="reservation_frm">
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
										<td><input class="input_type01" type="text" name="rphone" value="- 제외 입력"></td>
									</tr>
									<tr>
										<td><span class="content_text01">DATE</span></td>
										<td>
											<input class="input_type01" type="text" name="rdate" value="<%= sf.format(nowTime) %>">&nbsp;
											<select class="select_type01" name="selectOption">
								                <option value="time1">09:30</option>
								                <option value="time2">10:20</option>
								                <option value="time3">11:10</option>
								                <option value="time4">12:00</option>
								                <option value="time5">14:10</option>
								                <option value="time6">15:00</option>
								                <option value="time7">15:50</option>
								                <option value="time8">16:40</option>
								                <option value="time9">17:30</option>
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
											<input class="button_type01" type="button" value="예약하기" onclick="joinCheck()">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="예약취소" onclick="script:window.location='index'">
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