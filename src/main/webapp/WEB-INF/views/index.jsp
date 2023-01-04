<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="d-flex flex-column min-vh-100">
<%@ include file="include/header.jsp" %>
	<div class="picbox">
		<img src="${pageContext.request.contextPath}/resources/img/animalLogo.jpg">
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