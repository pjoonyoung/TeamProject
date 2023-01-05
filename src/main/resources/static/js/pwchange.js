/**
 * 
 */
 
 function pwchangeCheck(){
	
	if(document.pwchange_frm.mpw.value.length == 0){
		alert("비밀번호는 필수 입력 사항입니다.");
		return;
	}
	
	if(document.pwchange_frm.mpwck.value.length == 0){
		alert("비밀번호 체크는 필수 입력 사항입니다.");
		return;
	}
	
	if(document.pwchange_frm.mpw.value != document.pwchange_frm.mpwck.value){
		alert("비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요!");
		return;
	}
	
	document.pwchange_frm.submit();
}