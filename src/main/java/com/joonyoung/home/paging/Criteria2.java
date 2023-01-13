package com.joonyoung.home.paging;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria2 {
	
	private int pageNum=1;//현재 페이지 번호
	private int amount=5;//한 페이지에 출력표시될 글의 수
	private int startNum;//현재 선택된 페이지에서 시작할 글 번호
	private String searchKey;//검색된 키워드 가져와 저장
	private String searchid;//회원아이디값 가져와 저장
	private String searchOption;//선택된 키워드값 가져와 저장
	
	public String getQueryString() { //페이지 파라미터 값을 넘김
		return String.format("page=%d&pageSize=%d", pageNum, amount);		
	}
}