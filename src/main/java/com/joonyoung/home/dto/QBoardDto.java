package com.joonyoung.home.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QBoardDto {
	private int qnum;//게시판 글 번호
	private String qid;//글쓴이 아이디
	private String qname;//글쓴이 이름
	private String qtitle;//질문 제목
	private String qcontent;//질문 내용
	private String qemail;//글쓴이 이메일
	private int qhit;//조회수
	private int qanswercount;//첨부된 댓글 개수
	private String qdate;//글 등록 일시
}
