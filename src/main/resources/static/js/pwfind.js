/**
 * 
 */
 
 function pwfindCheck(){
	
	if(document.pwfind_frm.mid.value.length == 0){
		alert("아이디는 필수 입력 사항입니다.");
		return;
	}
	
	if(document.pwfind_frm.mname.value.length == 0){
		alert("이름은 필수 입력 사항입니다.");
		return;
	}
	
	if(document.pwfind_frm.memail.value.length == 0){
		alert("이메일은 필수 입력 사항입니다.");
		return;
	}
	
	document.pwfind_frm.submit();
}