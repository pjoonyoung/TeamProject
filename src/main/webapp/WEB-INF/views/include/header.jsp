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
			<td width="65%" class="menu01">&nbsp;</td>
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
				} else {
			%>
				<a href="memberModify">MODIFY</a>
			<%
				}
			%>
			</td>
			<td width="7%" class="menu01"><a href="list">QUESTION</a></td>
			<td width="7%" class="menu01"><a href="reservation">RESERVATION</a></td>
			<td width="6%" class="menu01"><a href="contact">CONTACT</a></td>
			<td width="2%">&nbsp;</td>
		</tr>
		<tr class="headline02">
			<td>&nbsp;</td>
		</tr>
	</table>
</body>
</html>