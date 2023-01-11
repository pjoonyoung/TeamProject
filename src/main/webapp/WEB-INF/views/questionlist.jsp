<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<title>** 병원예약관리 프로젝트 **</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
	
		<!-- 문의리스트폼 전체영역 -->
		<div class="listBox">
			<div>
				<span align="left" class="title">
					▷ 총 ${qproboardCount }개의 문의글이 있습니다.<br>
				</span>
				<span align="left">
					<form action="search_list" method="post">
						<select name="searchOption" >
			                <option value="title">제목</option>
			                <option value="content">내용</option>
			                <option value="writer">글쓴이</option>
			            </select>
			            <input class="input_type03" type="text" name="searchKey">
			            <input type="submit" class="btn btn-dark btnselect" value="검색">
					</form>
				</span>
			</div>
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th scope="col" class="board_title">NO</th>
						<th scope="col" class="board_title">ID</th>
						<th scope="col" class="board_title" width="50%">TITLE</th>
						<th scope="col" class="board_title">NAME</th>
						<th scope="col" class="board_title">DATE</th>
						<th scope="col" class="board_title">HIT</th>
						<th scope="col" class="board_title">RESULT</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
				  	<c:forEach items="${qdtos }" var="list">	
					<tr>
						<td class="board_content01">${list.qnum }</td>
						<td class="board_content01">${list.qid }</td>
						<td class="board_content02">
						<a href="questionView?qnum=${list.qnum }">
						<c:choose>
							<c:when test="${fn:length(list.qtitle) > 23 }">
								<c:out value="${fn:substring(list.qtitle,0,22) }"></c:out>...
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
				</tbody>
			</table>
			<tr>
				<%
					//String boardId = (String) request.getAttribute("qid");
					
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
					<div class="btn1">
						<input type="button" value="문의하기" class="btn btn-dark" style="width:15%" onclick="script:window.location='question'">
					</div>
				<%
					}
				%>
			</tr>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>