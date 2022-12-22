package com.joonyoung.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AnswerDto {
	private int anum;//댓글번호
	private String acontent;//댓글내용
	private String aid;//댓글작성한 아이디
	private String aqid;//게시글의 원번호
	private String adate;//댓글 작성 날짜
}
