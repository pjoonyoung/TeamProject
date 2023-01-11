<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
	
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
		<!--  login 폼 영역을 : loginBox -->
		<div class="rounded-2 loginBox" id="member">
		
		<!-- 로그인 페이지 타이틀 -->
		<div id="loginBoxTitle">비밀번호 확인</div>
		
	    <!-- 아이디, 비번, 버튼 박스 -->
	    <div id="inputBox">
	    	<form action="pwCheckOk" method="post">
		       	<div class="input-form-box">
		       		<span class="content_text01">아이디 </span>
		   			<input type="text" class="form-control" value="${memberId }" name="mid">
				</div>
				<div class="input-form-box">
					<span class="content_text01">비밀번호 </span>
					<input type="password" name="mpw" class="form-control">
				</div>
				<div class="button-login-box" >
					<input type="submit" class="btn btn-dark btn-xs" 
					style="width:40%" value="확인">
					
					<input type="button" class="btn btn-dark btn-xs" 
					style="width:40%" value="돌아가기" onclick="script:window.location='mypage'">
				</div>
	        </form>
        </div>
		</div>
		    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	    	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/idfind.js"></script>
		</div>
	</div>	
</div>	
<%@ include file="include/footer.jsp" %>
</body>
</html>