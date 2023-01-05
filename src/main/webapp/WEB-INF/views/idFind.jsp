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
<body class="d-flex flex-column min-vh-100 text-center">
<%@ include file="include/header.jsp" %>
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
		<!--  login 폼 영역을 : loginBox -->
		<div class="rounded-2 loginBox" id="member">
		
		<!-- 로그인 페이지 타이틀 -->
		<div id="loginBoxTitle">아이디찾기</div>
		
	    <!-- 아이디, 비번, 버튼 박스 -->
	    <div id="inputBox">
	    	<form action="idFindOk" method="post" name="idfind_frm">
		       	<div class="input-form-box">
		       		<span class="content_text01">이름 </span>
		   			<input type="text" name="mname" class="form-control">
				</div>
				<div class="input-form-box">
					<span class="content_text01">이메일 </span>
					<input type="text" name="memail" class="form-control">
				</div>
				<div class="input-form-box">
					<span class="content_text01">전화번호 </span>
					<input type="text" name="mphone" class="form-control">
				</div>
				<div class="button-login-box" >
					<input type="button" class="btn btn-primary btn-xs" 
					style="width:100%" value="찾기" onclick="idfindCheck()">
				</div>
	        </form>
        </div>
       	<div class="find_wrap font-monospace">
			<a target="_blank" href="pwFind"
			       class="find_text">비밀번호 찾기</a> | 
			<a href="login" class="find_text">로그인</a> | 
			<a href="join" class="find_text">회원가입</a>
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
<!-- 하단 시작 -->
<footer class="footer mt-auto py-3 bg-info">
	<div class="sticky-lg-bottom">
   		<p class="text-center text-white">
   			보시고 계신 페이지는 Spring Boot Framework으로 개발되었습니다.<br>
   			웹 어플리케이션 개발 관련하여 궁금하신 점은 jypjoon@gmail.com으로 연락부탁드립니다.
   		</p>
 		</div>
</footer>
<!-- 하단 끝 -->
</body>
</html>