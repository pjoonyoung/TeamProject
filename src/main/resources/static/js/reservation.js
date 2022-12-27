/**
 * 
 */
 
 function reservationCheck() {
	
	if(document.reservation_frm.mid.value.length == 0){
		alert("아이디는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.reservation_frm.mid.value.length < 4){
		alert("아이디는 4자 이상이어야 합니다.");
		return;
	}
	
	if(document.reservation_frm.mpw.value.length == 0){
		alert("비밀번호는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.reservation_frm.mpw_check.value.length == 0){
		alert("비밀번호체크란은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.reservation_frm.mpw.value.length != document.join_frm.mpw_check.value.length){
		alert("비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요!");
		return;
	}
	
	if(document.reservation_frm.mname.value.length == 0){
		alert("이름은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.reservation_frm.memail.value.length == 0){
		alert("이메일은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	document.reservation_frm.submit();
}