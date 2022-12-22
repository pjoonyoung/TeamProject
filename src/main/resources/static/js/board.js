/**
 * 
 */
 
 function boardCheck(){
	
	if(document.board_frm.qname.value.length == 0){
		alert("이름은 필수 입력 사항입니다.");
		return;
	}
	
	if(document.board_frm.qname.value.length < 2){
		alert("이름은 두글자 이상이어야 입니다.");
		return;
	}
	
	if(document.board_frm.qname.value.length > 10){
		alert("이름은 열글자 미만이어야 합니다.");
		return;
	}
	
	if(document.board_frm.qcontent.value.length < 10){
		alert("질문은 10글자 이상이어야 합니다.");
		return;
	}
	
	if(document.board_frm.qemail.value.length == 0){
		alert("이메일은 필수입력 사항입니다.");
		return;
	}
	
	document.board_frm.submit();
}