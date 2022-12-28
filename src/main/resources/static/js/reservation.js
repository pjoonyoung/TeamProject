/**
 * 
 */
 
 function reservationCheck() {
	
	if(document.reservation_frm.rphone.value.length == 0){
		alert("전화번호는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.reservation_frm.ranimal.value.length == 0){
		alert("동물종류는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.reservation_frm.rcontent.value.length == 0){
		alert("요청사항은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	document.reservation_frm.submit();
}