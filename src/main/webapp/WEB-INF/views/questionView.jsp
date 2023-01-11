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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<title>** 병원예약관리 프로젝트 **</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
	<!-- 문의확인폼 전체영역 -->
	<div class="qBox rounded-2">
	
		<!-- 문의확인 페이지 타이틀 -->
		<div id="joinBoxTitle">JoonHospital</div>
		
		<!-- 문의확인 내용 박스 -->
		<form class="row g-3" action="questionModify" method="post">
		<input type="hidden" value="${view.qnum }" name="qnum">
			<div class="col-md-3" align="left">
				<label for="inputId4" class="form-label content_text01">아이디</label>
				<input type="text" class="form-control" id="inputId4" value="${view.qid }" readonly="readonly" name="qid">
			</div>
			<div class="col-md-3 ms-auto" >
				<span align="right" name="qdate">
					<p class="content_text01">작성일자: ${view.qdate }</p>
				</span>
			</div>
			<div class="w-100"></div>
			<div class="col-md-3" align="left">
				<label for="inputName4" class="form-label content_text01">이름</label>
				<input type="text" class="form-control" id="inputName4" value="${view.qname }" readonly="readonly" name="qname">
			</div>
			<div class="col-md-3" align="left">
				<label for="inputEmail4" class="form-label content_text01">이메일</label>
				<input type="text" class="form-control" id="inputEmail4" value="${view.qemail }" readonly="readonly" name="qemail">
			</div>
			<div class="col-12" align="left">
				<label for="inputTitle" class="form-label content_text01">제목</label>
				<input type="text" class="form-control" id="inputTitle" value="${view.qtitle }" readonly="readonly" name="qtitle">
			</div>
			<div class="form-floating">
				<textarea class="form-control" id="floatingTextarea2" style="height: 200px"  readonly="readonly" name="qcontent">${view.qcontent }</textarea>
				<label for="floatingTextarea2"></label>
			</div>
			
			<tr>
				<td><hr class="line"></td>
				<span class="achart" align="left"> &nbsp;댓글 (${view.qanswercount })</span>
			</tr>
			<table class="table">
				<thead>
				<tr>
					<th scope="col" class="aboard_title">NO</th>
					<th scope="col" class="aboard_title">ID</th>
					<th scope="col" class="aboard_title" width="50%">ANSWER</th>
					<th scope="col" class="aboard_title">DATE</th>
				</tr>
				</thead>
				<tbody class="table-group-divider border-dark">
					<c:forEach items="${answer }" var="answer">	
					<tr>
						<td align="center">${answer.anum }</td>
						<td align="center">${answer.aid }</td>
						<td >${answer.acontent }</td>
						<td align="center">
							<c:out value="${fn:substring(answer.adate ,0,16) }"></c:out>
						</td>
						<%
							String boardId = (String) request.getAttribute("qid");
				
							if (sessionId.equals("ADMIN")) {//관리자 로그인시
						%>
						<td>
							<input type="button" value="삭제" class="btn btn-dark" onclick="script:window.location='answerDelete?anum=${answer.anum}&qnum=${view.qnum}'">
						</td>
						<%
							}
						%>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<tr>
				<td><hr class="line"></td>
			</tr>
				<%
					String boardId = (String) request.getAttribute("qid");
					
					if (sessionId == null) {
				%>
				<script type="text/javascript">
					alert("로그인이 필요한 기능입니다. 로그인 여부를 확인하여주세요.");
					history.go(-1);
				</script>
				<%
					} else if((sessionId.equals(boardId))) {//회원본인이 작성한 글 확인 시
				%>
				<div class="col-12 btn1">
					<input class="btn btn-dark" type="submit" value="수정">&nbsp;&nbsp;
					<input class="btn btn-dark" type="button" value="삭제" onclick="script:window.location='questionDelete?qnum=${view.qnum}'">&nbsp;&nbsp;
					<input class="btn btn-dark" type="button" value="문의목록" onclick="script:window.location='list'">
				</div>
				<%
					} else if((!sessionId.equals(boardId)) && (!sessionId.equals("ADMIN"))){
				%>
				<div class="col-12 btn1">
					<input class="btn btn-dark" type="button" value="문의목록" onclick="script:window.location='list'">
				</div>
				<%
					}
				%>
			</tr>
		</form>
		<form action="questionAnswerOk" method="post" name="board_frm">
			<input type="hidden" value="${view.qnum }" name="qnum">
			
			<%
				boardId = (String) request.getAttribute("qid");
				
				if (sessionId == null) {
			%>
			<script type="text/javascript">
				alert("로그인이 필요한 기능입니다. 로그인 여부를 확인하여주세요.");
				history.go(-1);
			</script>
			<%
				} else if(sessionId.equals("ADMIN")) {//관리자 로그인시
			%>
				<div class="form-floating">
					<textarea class="form-control" id="floatingTextarea3" placeholder="답변을 남겨주세요" style="height: 200px" name="acontent"></textarea>
					<label for="floatingTextarea3">답변을 남겨주세요</label>
				</div>
				<div class="col-12 btn1">
					<input class="btn btn-dark" type="submit" value="답변하기">&nbsp;&nbsp;
					<input class="btn btn-dark" type="button" value="삭제" onclick="script:window.location='questionDelete?qnum=${view.qnum}'">&nbsp;&nbsp;
					<input class="btn btn-dark" type="button" value="글목록" onclick="script:window.location='list'">										
				</div>
			<%
				}
			%>
		</form>
	</div>
	</center>	
<!-- 하단 시작 -->
	<footer class="footer mt-auto py-3 bg-dark">
		<div class="sticky-lg-bottom">
    		<p class="text-center text-white">
    			보시고 계신 페이지는 Spring Boot Framework으로 개발되었습니다.<br>
    			백 엔드 개발 관련하여 궁금하신 점은 jypjoon@gmail.com으로 연락부탁드립니다.
    		</p>
  		</div>
	</footer>
<!-- 하단 끝 -->
</body>
</html>