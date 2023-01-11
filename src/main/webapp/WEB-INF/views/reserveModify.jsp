<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />


<script type="text/javascript">


      <!--      달력 추가 js 시작       -->
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#pickDate" ).datepicker({
            	 showOn: "button",
                 buttonImage:"${pageContext.request.contextPath }/resources/img/cal.png",
                 buttonImageOnly: true,
            	 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 minDate: 0,
                 maxDate: "+10Y",                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( rday ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", rday );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 
                 maxDate: "+2Y",                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( rday ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", rday );
                 }    
 
            });    
    });
    
   
    <!--      달력 추가 js 끝       -->

</script>


</head>
<body>
<%@ include file="include/header.jsp" %>
   
   <!--  html 전체 영역을 지정하는 container -->
	<div id="container">
	
		<!-- 예약폼 전체영역 -->
		<div class="rBox rounded-2">
			
			<!-- 예약하기 페이지 타이틀 -->
			<div id="rBoxTitle">JoonHospital</div>
			
			<!-- 예약하기 내용 박스 -->
			<form class="row g-3" action="reserveModifyOk" method="post" name="reservation_frm">
			<input type="hidden" value="${view.rnum }" name="rnum">
				<div class="col-md-4">
					<label for="inputId4" class="form-label content_text01">아이디</label>
					<input type="text" class="form-control" id="inputId4" value="${view.rid }" readonly="readonly" name="rid">
				</div>
				<div class="w-100"></div>
				<div class="col-md-4">
					<label for="inputName4" class="form-label content_text01">이름</label>
					<input type="text" class="form-control" id="inputName4" value="${view.rname }" readonly="readonly" name="rname">
				</div>
				<div class="col-md-4">
					<label for="inputPhone4" class="form-label content_text01">전화번호</label>
					<input type="text" class="form-control" id="inputPhone4" value="${view.rphone }" placeholder="-제외 입력해주세요" name="rphone">
				</div>
				<div class="w-100"></div>
				<div class="row g-3">
					<div class="col-md-4">
						<label for="inputDay4" class="form-label content_text01">예약일자</label>
						<input type="text" style="display:inline-block" class="form-control" id="pickDate" id="inputDay4" value="${view.rday }" name="rday">
					</div>
					<div class="col-md-2">
						<label class="form-label">&nbsp;</label>
						<select class="form-select" name="selectOption">
						    <option value="${view.rtime }">${view.rtime }</option>
							<option disabled>---------</option>
							<option value="09:30">09:30</option>
							<option value="10:20">10:20</option>
							<option value="11:10">11:10</option>
							<option value="12:00">12:00</option>
							<option value="14:10">14:10</option>
							<option value="15:00">15:00</option>
							<option value="15:50">15:50</option>
							<option value="16:40">16:40</option>
							<option value="17:30">17:30</option>
						</select>
					</div>
				</div>
				<div class="w-100"></div>
				<div class="col-md-4">
					<label for="inputAnimal4" class="form-label content_text01">동물종류</label>
					<input type="text" class="form-control" id="inputAnimal4" value="${view.ranimal }" name="ranimal">
				</div>
				<div class="col-md-4">
					<label for="inputList4" class="form-label content_text01">희망접수</label>
					<input type="text" class="form-control" id="inputList4" value="${view.rlist }" name="rlist" readonly="readonly">
				</div>
				<div class="form-floating">
					<textarea class="form-control" placeholder="수정하실 증상을 입력하세요" id="floatingTextarea2" style="height: 200px" name="rcontent">${view.rcontent }</textarea>
					<label for="floatingTextarea2">수정하실 증상을 입력하세요</label>
				</div>
				<div class="col-12 btn1">
				<%
					if(sessionId.equals("ADMIN")) {
				%>
                   	<input class="btn btn-dark" type="button" value="수정완료" onclick="reservationCheck()">&nbsp;&nbsp;
                   	<input class="btn btn-dark" type="button" value="예약삭제" onclick="script:window.location='adrDelete?rnum=${view.rnum }'">
                   	<input class="btn btn-dark" type="button" value="돌아가기" onclick="script:window.location='reservationAll'">
                <%
					} else if (sessionId != null) {    
                 %>
               	    <input class="btn btn-dark" type="button" value="수정완료" onclick="reservationCheck()">&nbsp;&nbsp;
               	    <input class="btn btn-dark" type="button" value="돌아가기" onclick="script:window.location='myreservation?rid=${memberId}'">
              	<%
					} else {
				%>
				<%
					}
				%>
                </div>
			</form>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>