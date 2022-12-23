package com.joonyoung.home.dao;

import java.util.ArrayList;
import java.util.List;

import com.joonyoung.home.dto.AnswerDto;
import com.joonyoung.home.dto.MemberDto;
import com.joonyoung.home.dto.QBoardDto;

public interface IDao {
	//회원관리
	public int memberJoin(String mid, String mpw, String mname, String mgender, String mphone, String memail);//회원가입 insert
	public int checkId(String mid);//아이디 존재여부 확인 select
	public int checkIdAndPw(String mid, String mpw);//아이디와 비밀번호의 존재 및 일치 여부 select
	public MemberDto getMemberInfo(String mid);//아이디로 조회하여 회원정보 가져오기 select
	public void memberModify(String mid, String mpw, String mname, String mgender, String mphone, String memail, String mdate);//회원정보 수정 update
	
	//질문 게시판
	public void writeQuestion(String qid, String qname, String qcontent, String qemail);//질문하기 insert
	public MemberDto question(String mid);//질문작성시 아이디, 이름, 이메일 정보 가져오기 select
	public List<QBoardDto> questionList();//질문게시판 리스트 가져오기 select
	public QBoardDto questionView(String qnum);//선택한 글 번호의 정보 가져오기 select
	public void questionModify(String qnum, String qname, String qcontent, String qemail);//해당 글 번호로 조회하여 질문수정 update
	public void questionDelete(String qnum);//해당 글 번호로 조회하여 글 삭제 delete
	
	//댓글
	public void writeAnswer(String acontent, String aid, String aqid);//댓글작성 insert
	public ArrayList<AnswerDto> answerlist(String aqid);//해당글의 댓글 리스트 select
	public void answerDelete(String anum);
	
}
