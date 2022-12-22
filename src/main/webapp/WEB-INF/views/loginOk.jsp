<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Joonyoung Profile **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">로그인 완료</span>
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
						<%
							int checkIdFlag = Integer.parseInt(request.getAttribute("checkIdFlag").toString());
							int checkIdPwFlag = Integer.parseInt(request.getAttribute("checkIdPwFlag").toString());	
							if(checkIdFlag == 0) {
						%>
						<script type="text/javascript">
							alert("입력하신 아이디는 존재하지 않습니다. 다시 확인해주세요.");
							history.go(-1);
						</script>
						<%
							} else if(checkIdPwFlag == 0) {
						%>
						<script type="text/javascript">
							alert("입력하신 아이디와 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
							history.go(-1);
						</script>
						<%
							}
						%>
						
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