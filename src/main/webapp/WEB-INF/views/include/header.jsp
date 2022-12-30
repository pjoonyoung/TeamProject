<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hyperlink.css">
</head>
<body>
	<%
		String sessionId = (String) session.getAttribute("memberId");
	%>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr class="headline01">
			<%
				if(sessionId == null){
			%>
			<%
				} else if ((sessionId != null) && (sessionId.equals("ADMIN"))){
			%>
			<td width="8%" class="menu02" >관리자님 로그인중...</td>
			<%
				} else {
			%>
			<td width="7%" class="menu02" >${memberId }님 로그인중...</td>
			<%
				}
			%>
			<td width="58%" class="menu01">&nbsp;</td>
			<td width="5%" class="menu01"><a href="index">HOME</a></td>
			<td width="5%" class="menu01">
			<%
				if(sessionId == null){
					
			%>
				<a href="login">LOGIN</a>
			<%
				} else {
			%>
				<a href="logout">LOGOUT</a>
			<%
				}
			%>
			</td>
			<td width="5%" class="menu01">
			<%
				if(sessionId == null){
					
			%>
				<a href="join">JOIN</a>
			<%
				} else if (sessionId.equals("ADMIN")){
			%>
				<a href="adminpage">ADMINPAGE</a>
			<%
				} else {
			%>
				<a href="mypage">MYPAGE</a>
			<%
				}
			%>
			</td>
			<%
				if (sessionId == null){
			%>
				<td width="7%" class="menu01"><a href="list">QUESTION</a></td>
			<%
				} else if (sessionId.equals("ADMIN")){
			%>
			<%
				} else {
			%>
				<td width="7%" class="menu01"><a href="list">QUESTION</a></td>
			<%
				}
			%>
			<%
				if(sessionId == null){
			%>
			<%
				} else if (sessionId.equals("ADMIN")){
			%>
			<%
				} else if (sessionId != null){
			%>
				<td width="7%" class="menu01"><a href="reservationlist">RESERVATION</a></td>
			<%
				}
			%>
			<%
				if(sessionId == null){
			%>
			<td width="6%" class="menu01"><a href="contact">CONTACT</a></td>
			<%
				} else if (sessionId.equals("ADMIN")){
			%>
			<%
				} else if (sessionId != null){
			%>
				<td width="6%" class="menu01"><a href="contact">CONTACT</a></td>
			<%
				}
			%>
			<td width="2%">&nbsp;</td>
		</tr>
		<tr class="headline02">
			<td>&nbsp;</td>
		</tr>
	</table>
</body>
</html>