<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>** 병원예약관리 프로젝트 **</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/join.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
	
		<!-- 회원가입폼 전체영역 -->
		<div class="joinBox rounded-2">
			
			<!-- 회원가입 페이지 타이틀 -->
			<div id="joinBoxTitle">JoonHospital</div>
			
			<!-- 회원가입 내용 박스 -->
		    <div id="inputBox">
		    	<form action="joinOk" method="post" name="join_frm">
		    		
		    		<div class="row mb-3">
						<label for="formGroupExampleInput" class="form-label content_text01">아이디</label>
						<div class="col-sm-15">
							<input type="text" class="form-control" name="mid">
						</div>
					</div>
					
		    		<div class="row mb-3">
						<label for="inputPassword3" class="form-label content_text01">비밀번호</label>
						<div class="col-sm-15">
							<input type="password" class="form-control" name="mpw">
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="inputPassword3" class="form-label content_text01">비밀번호체크</label>
						<div class="col-sm-15">
							<input type="password" class="form-control" name="mpw_check">
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="formGroupExampleInput" class="form-label content_text01">이름</label>
						<div class="col-sm-15">
							<input type="text" class="form-control" name="mname">
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="formGroupExampleInput" class="form-label content_text01">성별</label>
				    	<div class="col-sm-15">
							<select class="form-control multiple" name="mgender" value="선택">
							    <option selected disabled>선택</option>
							    <option value="남자">남자</option>
							    <option value="여자">여자</option>
						  	</select>
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="formGroupExampleInput" class="form-label content_text01">번호</label>
						<div class="col-sm-15">
							<input type="text" class="form-control" placeholder="-제외 입력해주세요" name="mphone">
						</div>
					</div>
		    		
		    		<div class="row mb-3">
						<label for="exampleFormControlInput1" class="form-label content_text01">이메일</label>
						<div class="col-sm-15">
							<input type="email" class="form-control" name="memail">
						</div>
					</div>
					
					<div class="button-join-box">
		    			<input type="button" class="btn btn-dark" style="width:100%" value="가입완료" onclick="joinCheck()"></input>
					</div>
		    	</form>
		    </div>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>