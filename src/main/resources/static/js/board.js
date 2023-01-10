/**
 * 
 */
 
 function boardCheck(){
	
	if(document.board_frm.qtitle.value.length == 0){
		alert("제목은 필수 입력 사항입니다.");
		return;
	}
	
	if(document.board_frm.qtitle.value.length > 20){
		alert("제목은 20글자 미만이어야 합니다.");
		return;
	}
	
	if(document.board_frm.qcontent.value.length < 10){
		alert("질문은 10글자 이상이어야 합니다.");
		return;
	}
	
	document.board_frm.submit();
}