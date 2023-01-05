/**
 * 
 */
 
 function idfindCheck(){
	
	if(document.idfind_frm.mname.value.length == 0){
		alert("이름은 필수 입력 사항입니다.");
		return;
	}
	
	if(document.idfind_frm.memail.value.length == 0){
		alert("이메일은 필수 입력 사항입니다.");
		return;
	}
	
	if(document.idfind_frm.mphone.value.length == 0){
		alert("전화번호는 필수 입력 사항입니다.");
		return;
	}
	
	if(document.idfind_frm.mphone.value.length != 11){
		alert("전화번호는 11자리 입니다.");
		return;
	}
	
	document.idfind_frm.submit();
}