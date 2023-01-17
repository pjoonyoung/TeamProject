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
		<div class="row">
        	<div class="col rounded-2 room">
				<ul class="nav nav-tabs">
					<li class="nav-item w-50">
						<a class="nav-link active" data-toggle="tab" href="#member">회원로그인</a>
					</li>
					<li class="nav-item w-50">
						<a class="nav-link" data-toggle="tab" href="#admin">관리자로그인</a>
					</li>
				</ul>
	
				<div class="tab-content">
					<!--  login 폼 영역을 : loginBox -->
					<div class="tab-pane fade show active loginBox" id="member">
					<p>
					<!-- 로그인 페이지 타이틀 -->
					<div id="loginBoxTitle">Login</div>
					
				    <!-- 아이디, 비번, 버튼 박스 -->
				    <div id="inputBox">
				    	<form action="loginOk" method="post" name="login_frm">
					       	<div class="input-form-box">
					       		<span class="content_text01">아이디 </span>
					   			<input type="text" name="mid" class="form-control">
							</div>
							<div class="input-form-box">
								<span class="content_text01">비밀번호 </span>
								<input type="password" name="mpw" class="form-control">
							</div>
							<div class="button-login-box" >
								<input type="button" class="btn btn-dark btn-xs" 
								style="width:100%" value="로그인" onclick="loginCheck()">
							</div>
				        </form>
			        </div>
		        	<div class="find_wrap font-monospace">
						<a target="_blank" href="idFind"
						       class="find_text">아이디 찾기</a> | 
						<a target="_blank" href="pwFind"
						       class="find_text">비밀번호 찾기</a> | 
						<a href="join" class="find_text">회원가입</a>
					</div>
			    	</p>
					</div>
				    <!--  login 폼 영역을 : loginBox -->
					<div class="tab-pane fade loginBox" id="admin">
					<p>
					<!-- 로그인 페이지 타이틀 -->
					<div id="loginBoxTitle">AdminLogin</div>
					
				    <!-- 아이디, 비번, 버튼 박스 -->
				    <div id="inputBox">
				    	<form action="loginOk" method="post">
					       	<div class="input-form-box">
					       		<span class="content_text01">아이디 </span>
					   			<input type="text" name="mid" class="form-control" value="ADMIN" readonly="readonly">
							</div>
							<div class="input-form-box">
								<span class="content_text01">비밀번호 </span>
								<input type="password" name="mpw" class="form-control">
							</div>
							<div class="button-login-box" >
								<input type="submit" class="btn btn-dark btn-xs" style="width:100%" value="로그인">
							</div>
				        </form>
			        </div>
			        </p>
				</div>
				    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
			    	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
			    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
				    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
					<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>
				</div>
			</div>
		</div>	
	</div>			
<%@ include file="include/footer.jsp" %>	
</body>
</html>