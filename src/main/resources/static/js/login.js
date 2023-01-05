/**
 * 
 */
 
 function loginCheck(){
	
	if(document.login_frm.mid.value.length == 0){
		alert("아이디는 필수 입력 사항입니다.");
		return;
	}
	
	
	if(document.login_frm.mpw.value.length == 0){
		alert("비밀번호는 필수 입력 사항입니다.");
		return;
	}
	
	document.login_frm.submit();
}