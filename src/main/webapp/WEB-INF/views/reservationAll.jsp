<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<title>** 병원예약관리 프로젝트 **</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<fmt:formatDate value="${now}" pattern="HH:mm" var="todaytime" />
	
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
		
		<!-- 나의예약확인폼 전체영역 -->
		<div class="listBox rounded-2">
			<div>
				<span align="left" class="title">
					▷ 총 ${reAllCount }개의 ${relistDto } 예약건이 있습니다.
				</span>
				<span align="left">
					<form action="reservationAll">
						<select name="searchOption" >
							<option value="전체">전체</option>
			                <option value="진료">진료</option>
			                <option value="예방접종">예방접종</option>
			                <option value="미용">미용</option>
			            </select>
			            <input type="submit" class="btn btn-dark btnselect" value="검색">
					</form>
				
					<form action="day_search">
						<input type="date" name="startday" value="stday">&nbsp;~&nbsp;
						<input type="date" name="endday" value="enday">
						<input type="submit" class="btn btn-dark btnselect" value="검색">
					</form>
				</span>
			</div>
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th scope="col" class="board_title">NO</th>
						<th scope="col" class="board_title">ID</th>
						<th scope="col" class="board_title">RECEIPT</th>
						<th scope="col" class="board_title">NAME</th>
						<th scope="col" class="board_title">DATE</th>
						<th scope="col" class="board_title">STATE</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
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
						<fmt:parseDate value="${list.rday }" pattern="yyyy-MM-dd" var="rday" />
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
				</tbody>
			</table>
			
			<tr>
				<td colspan="5" align="center">
					<c:if test="${pageMaker.prev }">
						<a href="reservationAll?pageNum=${pageMaker.startPage-5 }">Prev</a>&nbsp;&nbsp;&nbsp;
					</c:if>										
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
						<c:choose>
						<c:when test="${currPage == num}">
						<u>${num}</u>&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
						<a href="reservationAll?pageNum=${num}&searchOption=${searchOption}">${num}</a>&nbsp;&nbsp;&nbsp;
						</c:otherwise>
						</c:choose>																					
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<a href="reservationAll?pageNum=${pageMaker.startPage+5 }">Next</a>
					</c:if>	
				</td>
			</tr>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>