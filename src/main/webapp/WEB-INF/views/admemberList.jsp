<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
		<!-- 전체 회원리스트 폼 전체영역 -->
		<div class="listBox">
			<div>
				<span class="title">
					▷ 총 ${mAllcount }명의 회원이 가입되어 있습니다.
				</span>
				<span align="left">
					<form action="adMsearch_list" method="post">
						<select name="searchOption" >
			                <option value="전체">전체</option>
			                <option value="이름">이름</option>
			            </select>
			            <input class="input_type03" type="text" name="searchKey">
			            <input type="submit" class="btn btn-dark btnselect" value="검색">
					</form>
				</span>
			</div>
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th scope="col" class="board_title">ID</th>
						<th scope="col" class="board_title">NAME</th>
						<th scope="col" class="board_title">EMAIL</th>
						<th scope="col" class="board_title">DATE</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
				  	<c:forEach items="${mAlldtos }" var="list">	
					  	<c:choose>
							<c:when test="${list.mid eq 'ADMIN' }">
								<tr class="table-danger">
									<td class="board_content03">${list.mid }</td>
									<td class="board_content03">
									<a href="memberSelectOk?mid=${list.mid }">
									${list.mname }
									</a>
									</td>
									<td class="board_content03">${list.memail }</td>
									<td class="board_content03">
										${list.mdate }
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="board_content01">${list.mid }</td>
									<td class="board_content01">
									<a href="memberSelectOk?mid=${list.mid }">
									${list.mname }
									</a>
									</td>
									<td class="board_content01">${list.memail }</td>
									<td class="board_content01">
										${list.mdate }
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>