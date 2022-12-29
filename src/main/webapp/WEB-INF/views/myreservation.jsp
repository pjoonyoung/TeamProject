<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<fmt:formatDate value="${now}" pattern="HH:mm" var="todaytime" />
<fmt:parseDate value="${rlistDto.rday.time }" pattern="yyyy-MM-dd" var="rday" />
<fmt:parseDate value="${rlistDto.rtime.time }" pattern="HH:mm" var="rtime" />
<fmt:formatDate value="${rday}" pattern="yyyy-MM-dd" var="reday" />
<fmt:formatDate value="${rtime}" pattern="HH:mm" var="retime" />


	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">나의 예약확인</span>
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
									<td colspan="7" align="left">▷ 총 ${reservationCount }개의 예약건이 있습니다.
										<form action="rsearch_list">
										<input type="hidden" value="${memberId }" name="rid">
											<select name="searchOption" >
								                <option value="진료">진료</option>
								                <option value="예방접종">예방접종</option>
								                <option value="미용">미용</option>
								            </select>
								            <input type="submit" value="검색">
										</form>
									</td>
								</tr>
								<tr>
									<th class="board_title">NO</th>
									<th class="board_title">ID</th>
									<th class="board_title">RECEIPT</th>
									<th class="board_title">NAME</th>
									<th class="board_title">DATE</th>
									<th class="board_title">STATE</th>
								</tr>
								<c:forEach items="${rlistDto }" var="list">	
								<tr>
									<td class="board_content01">${list.rnum }</td>
									<td class="board_content01">${list.rid }</td>
									<td class="board_content01">
									<a href="reservationView?rnum=${list.rnum }">
									${list.rlist }
									</a>
									</td>
									<td class="board_content01">${list.rname }</td>
									<td class="board_content01">
										${list.rday } ${list.rtime }
									</td>
									<c:choose>
										<c:when test="${today ge reday && todaytime lt retime }">
											<td class="board_content01">예약중</td>
										</c:when>
										<c:when test="${today ge reday && todaytime gt retime }">
											<td class="board_content01">처리완료</td>
										</c:when>
										
									</c:choose>
								</tr>
								</c:forEach>
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