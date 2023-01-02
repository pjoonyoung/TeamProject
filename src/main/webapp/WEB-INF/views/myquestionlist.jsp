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
				<span class="title01">나의 문의내역</span>
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
							<table width="80%" border="0" cellspacing="0" cellpadding="10">
								<tr>
									<td colspan="7" align="left">▷ ${memberId } 님 총 ${qproboardMyCount }개의 문의가 있습니다.
										<form action="mysearch_list">
										<input type="hidden" value="${memberId }" name="qid">
											<select name="searchOption" >
								                <option value="title">제목</option>
								                <option value="content">내용</option>
								                <option value="writer">글쓴이</option>
								            </select>
								            <input class="input_type03" type="text" name="searchKey">
								            <input type="submit" value="검색">
										</form>
									</td>
								</tr>
								<tr>
									<th class="board_title">NO</th>
									<th class="board_title">ID</th>
									<th class="board_title" width="50%">TITLE</th>
									<th class="board_title">NAME</th>
									<th class="board_title">DATE</th>
									<th class="board_title">HIT</th>
									<th class="board_title">RESULT</th>
								</tr>
								<c:forEach items="${qdtos }" var="list">	
								<tr>
									<td class="board_content01">${list.qnum }</td>
									<td class="board_content01">${list.qid }</td>
									<td class="board_content02">
									<a href="questionView?qnum=${list.qnum }">
									<c:choose>
										<c:when test="${fn:length(list.qtitle) > 23 }">
											<c:out value="${fn:substring(list.qtitle,0,22) }">sss</c:out>...
										</c:when>
										<c:otherwise>
											<c:out value="${list.qtitle }"></c:out>
										</c:otherwise>
									</c:choose>
									<c:if test="${list.qanswercount != 0 }">              
             		 				&nbsp;&nbsp;[${list.qanswercount }]
              						</c:if>
									</a>
									</td>
									<td class="board_content01">${list.qname }</td>
									<td class="board_content01">
										<c:out value="${fn:substring(list.qdate ,0,10) }"></c:out>
									</td>
									<td class="board_content01">${list.qhit }</td>
									<c:choose>
										<c:when test="${list.qanswercount != 0 }">
											<td class="board_content01">답변완료</td>
										</c:when>
										<c:otherwise>
											<td class="board_content01">준비중</td>
										</c:otherwise>
									</c:choose>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="7" align="right">
										<input type="button" value="문의하기" class="button_type01" onclick="script:window.location='question'">
									</td>
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