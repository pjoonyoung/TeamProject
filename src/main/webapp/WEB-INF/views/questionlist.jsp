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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">질문 리스트</span>
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
							<br><br>
							<center>
							<table width="80%" border="0" cellspacing="0" cellpadding="10">
								<tr>
									<th class="board_title">NO</th>
									<th class="board_title">ID</th>
									<th class="board_title" width="50%">QUESTION</th>
									<th class="board_title">NAME</th>
									<th class="board_title">DATE</th>
								</tr>
								<c:forEach items="${qdtos }" var="list">	
								<tr>
									<td class="board_content01">${list.qnum }</td>
									<td class="board_content01">${list.qid }</td>
									<td class="board_content02">
									<a href="questionView?qnum=${list.qnum }">
									<c:choose>
										<c:when test="${fn:length(list.qcontent) > 23 }">
											<c:out value="${fn:substring(list.qcontent,0,22) }"></c:out>...
										</c:when>
										<c:otherwise>
											<c:out value="${list.qcontent }"></c:out>
										</c:otherwise>
									</c:choose>
									</a>
									</td>
									<td class="board_content01">${list.qname }</td>
									<td class="board_content01">
										<c:out value="${fn:substring(list.qdate ,0,10) }"></c:out>
									</td>
								</tr>
								</c:forEach>
								<tr>
								<%
									String boardId = (String) request.getAttribute("qid");
									
									if(sessionId == null) {
								%>
								<script type="text/javascript">
									alert("로그인이 필요한 기능입니다. 로그인 여부를 확인하여주세요.");
									history.go(-1);
								</script>
								<%
									} else if (sessionId.equals("ADMIN")) {
								%>
								
								<%
									} else {
								%>
									<td colspan="5" align="right">
										<input type="button" value="질문하기" class="button_type01" onclick="script:window.location='question'">
									</td>
								<%
									}
								%>
								</tr>
							</table>
							</center>
							<br>
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