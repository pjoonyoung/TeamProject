<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>
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
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">전체 예약확인</span>
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
									<td colspan="6" align="left">▷ 총 ${reAllCount }개의 ${relistDto} 예약건이 있습니다.
											<form action="adsearch_list">
												<select name="searchOption">
													<option value="전체">전체</option>
									                <option value="진료">진료</option>
									                <option value="예방접종">예방접종</option>
									                <option value="미용">미용</option>
									            </select>
									            <input type="submit" value="검색">
											</form>
											
											<form action="day_search">
												<input type="date" name="startday" value="stday">&nbsp;~&nbsp;
												<input type="date" name="endday" value="enday">
												<input type="submit" value="검색">
											</form>
										</td>
									</tr>
								</tr>
								<tr>
									<th class="board_title">NO</th>
									<th class="board_title">ID</th>
									<th class="board_title">RECEIPT</th>
									<th class="board_title">NAME</th>
									<th class="board_title">DATE</th>
									<th class="board_title">STATE</th>
								</tr>
								<c:forEach items="${reAlldto }" var="list">	
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
									<fmt:parseDate value="${list.rday }" pattern="yyyy-mm-dd" var="rday" />
									<fmt:parseDate value="${list.rtime }" pattern="HH:mm" var="rtime" />
									<fmt:formatDate value="${rday}" pattern="yyyy-MM-dd" var="reday" />
									<fmt:formatDate value="${rtime}" pattern="HH:mm" var="retime" />
									<c:choose>
										<c:when test="${today lt reday}">
											<td class="board_content01">예약중</td>
										</c:when>
										<c:when test="${today le reday && todaytime le retime }">
											<td class="board_content01">예약중</td>
										</c:when>
										<c:when test="${today gt reday}">
											<td class="board_content01">처리완료</td>
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