package com.joonyoung.home.paging;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria3 {
	
	private int pageNum=1;//현재 페이지 번호
	private int amount=5;//한 페이지에 출력표시될 글의 수
	private int startNum;//현재 선택된 페이지에서 시작할 글 번호
	private String startday;//검색된 시작일자값 가져와 저장
	private String endday;//검색된 마지막일자값 가져와 저장
	
	public String getQueryString() { //페이지 파라미터 값을 넘김
		return String.format("page=%d&pageSize=%d", pageNum, amount);		
	}
}