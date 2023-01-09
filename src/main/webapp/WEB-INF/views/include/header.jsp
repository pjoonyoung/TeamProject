<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hyperlink.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="d-flex flex-column h-100">
	<%
		String sessionId = (String) session.getAttribute("memberId");
	%>
	
	 <nav class="navbar navbar-expand-md bg-dark fixed-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="index"><img src="${pageContext.request.contextPath}/resources/img/hospitalLogo.png" alt="Logo" width="30" height="34" class="d-inline-block align-text-top"></a>
        <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
          <ul class="nav justify-content-end">
          	<%
				if(sessionId == null){
			%>
			<%
				} else if ((sessionId != null) && (sessionId.equals("ADMIN"))){
			%>
			<span class="navbar-text border rounded-2 text-light">관리자님 로그인중...</span>
			<%
				} else {
			%>
			<span class="navbar-text border rounded-2 text-light">${memberId }님 로그인중...</span>
			<%
				}
			%>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index">Home</a>
            </li>
            <li class="nav-item">
            <%
				if(sessionId == null){
					
			%>
				<a class="nav-link" href="login">Login</a>
			<%
				} else {
			%>
				<a class="nav-link" href="logout">LogOut</a>
			<%
				}
			%>
            </li>
            <li class="nav-item">
            <%
				if(sessionId == null){
					
			%>
				<a class="nav-link" href="join">Join</a>
			<%
				} else if (sessionId.equals("ADMIN")){
			%>
				<a class="nav-link" href="adminpage">AdminPage</a>
			<%
				} else {
			%>
				<a class="nav-link" href="mypage">MyPage</a>
			<%
				}
			%>
            </li>
            <%
				if (sessionId == null){
			%>
				<li class="nav-item">
					<a class="nav-link" href="list">Question</a>
	            </li>
			<%
				} else if (sessionId.equals("ADMIN")){
			%>
			<%
				} else {
			%>
				<li class="nav-item">
					<a class="nav-link" href="list">Question</a>
	            </li>
			<%
				}
			%>
			<%
				if(sessionId == null){
			%>
			<%
				} else if (sessionId.equals("ADMIN")){
			%>
			<%
				} else if (sessionId != null){
			%>
				<li class="nav-item">
					<a class="nav-link" href="reservationlist">Reservaion</a>
				</li>
			<%
				}
			%>
			<%
				if(sessionId == null){
			%>
				<li class="nav-item">
              		<a class="nav-link" href="contact">Contact</a>
            	</li>
			<%
				} else if (sessionId.equals("ADMIN")){
			%>
			<%
				} else if (sessionId != null){
			%>
				<li class="nav-item">
              		<a class="nav-link" href="contact">Contact</a>
            	</li>
			<%
				}
			%>
            
          </ul>
        </div>
      </div>
    </nav>
</body>
</html>