package com.joonyoung.home.paging;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class PageDto2 {
	
	private int startPage;//현재 화면에서 보여질 시작 페이지 번호
	private int endPage;//현재 화면에서 보여질 마지막 페이지 번호
	private boolean prev;
	private boolean next;
	private int total;//전체 페이지 개수
	
	private Criteria2 cri2;
	
	public PageDto2(Criteria2 cri2, int total) {
		
		this.cri2 = cri2;
		this.total = total;
		
		this.endPage = (int) Math.ceil((cri2.getPageNum()/5.0)) * 5;//Math.ceil->올림
		// 총 57개의 글이 존재(total=57)
		// 1 2 3 4 5 next
		// prev 6 7 8 9 10 next 
		// prev 11 12 
		this.startPage = this.endPage - 4;
		
		int realEnd = (int) Math.ceil((total*1.0)/cri2.getAmount());
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		//이전, 다음 페이지 버튼 출력 여부 결정
	}
}
