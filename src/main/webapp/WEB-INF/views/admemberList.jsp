<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									<td colspan="4" align="left">▷ 총 ${mAllcount }명의 회원이 가입되어 있습니다.
											<form action="adMsearch_list">
												<select name="searchOption">
													<option value="전체">전체</option>
									                <option value="이름">이름</option>
									            </select>
									            <input class="input_type03" type="text" name="searchKey">
									            <input type="submit" value="검색">
											</form>
											
										</td>
									</tr>
								</tr>
								<tr>
									<th class="board_title">ID</th>
									<th class="board_title">NAME</th>
									<th class="board_title">EMAIL</th>
									<th class="board_title">DATE</th>
								</tr>
									<c:forEach items="${mAlldtos }" var="list">	
									<c:choose>
									<c:when test="${list.mid eq 'ADMIN' }">
										<tr>
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