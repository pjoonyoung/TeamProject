package com.joonyoung.home.dao;

import java.util.ArrayList;
import java.util.List;

import com.joonyoung.home.dto.AnswerDto;
import com.joonyoung.home.dto.MemberDto;
import com.joonyoung.home.dto.QBoardDto;
import com.joonyoung.home.dto.ReservationDto;
import com.joonyoung.home.paging.Criteria;
import com.joonyoung.home.paging.Criteria2;
import com.joonyoung.home.paging.Criteria3;

public interface IDao {
	//회원관리
	public int memberJoin(String mid, String mpw, String mname, String mgender, String mphone, String memail);//회원가입 insert
	public int checkId(String mid);//아이디 존재여부 확인 select
	public int checkIdAndPw(String mid, String mpw);//아이디와 비밀번호의 존재 및 일치 여부 select
	public MemberDto getMemberInfo(String mid);//아이디로 조회하여 회원정보 가져오기 select
	public ArrayList<MemberDto> memberAll(Criteria cri);//전체 회원정보 가져오기 select
	public ArrayList<MemberDto> adMsearchList(Criteria2 cri2);//전체 회원정보 이름으로 검색
	public ArrayList<MemberDto> adMsearchIdList(Criteria2 cri2);//전체 회원정보 아이디로 검색 
	public int memberAllcount();//등록된 회원 전체명수 가져오기 select
	public int memberNamecount(String mname);//등록된 회원중 이름으로 검색된 회원수 가져오기 select
	public int memberIdcount(String mid);//등록된 회원중 아이디로 검색된 회원수 가져오기 select
	public void memberModify(String mid, String mpw, String mname, String mphone, String memail);//회원정보 수정 update
	public void pwModify(String mid, String mpw);
	public void memberDelete(String mid, String mpw);//회원 탈퇴 delete
	public MemberDto memberIdFind(String mname, String memail, String mphone);//이름,이메일,전번으로 아이디 찾기 select
	public MemberDto memberPwFind(String mid, String mname, String memail);//아이디,비번,이메일으로 비번 찾기 select
	public int checkIdFind(String mname, String memail, String mphone);//이름,이메일,전번의 일치 여부 select
	public int checkPwFind(String mid, String mname, String memail);//아이디,비번,이메일의 일치 여부 select
	
	//질문 게시판
	public void writeQuestion(String qid, String qname, String qtitle, String qcontent, String qemail);//질문하기 insert
	public MemberDto question(String mid);//질문작성시 아이디, 이름, 이메일 정보 가져오기 select
	public List<QBoardDto> questionList(Criteria cri);//질문게시판 리스트 가져오기 select
	public int proboardAllCount();//게시글 전체개수 가져오기 select
	public int proboardMyCount(String qid);//게시글중 내가남긴 게시글의개수 가져오기 select
	public QBoardDto questionView(String qnum);//선택한 글 번호의 정보 가져오기 select
	public void questionModify(String qnum, String qname, String qtitle, String qcontent, String qemail);//해당 글 번호로 조회하여 질문수정 update
	public void questionDelete(String qnum);//해당 글 번호로 조회하여 글 삭제 delete
	public void qhit(String qnum);//조회수
	public List<QBoardDto> myquestionList(Criteria2 cri2);//질문게시판에서 나의문의 리스트 가져오기 select
	
	//댓글
	public void writeAnswer(String acontent, String aid, String aqid);//댓글작성 insert
	public ArrayList<AnswerDto> answerlist(String aqid);//해당글의 댓글 리스트 select
	public void answercountPlus(String aqid);//댓글 등록시 해당글의 댓글갯수 1증가
	public void answercountMinus(String aqid);//댓글 등록시 해당글의 댓글갯수 1감소
	public void answerDelete(String anum);//댓글삭제
	
	//게시판 검색 관련
	public ArrayList<QBoardDto> proSearchTitleList(Criteria2 cri2);//전체 게시글 제목으로검색
	public ArrayList<QBoardDto> proSearchContentList(Criteria2 cri2);//전체 게시글 내용으로검색
	public ArrayList<QBoardDto> proSearchWriterList(Criteria2 cri2);//전체 게시글 아이디(글쓴이)로검색
	
	public ArrayList<QBoardDto> mySearchTitleList(Criteria2 cri2);//나의 게시글 제목으로검색
	public ArrayList<QBoardDto> mySearchContentList(Criteria2 cri2);//나의 게시글 내용으로검색
	public ArrayList<QBoardDto> mySearchWriterList(Criteria2 cri2);//나의 게시글 아이디(글쓴이)로검색
	
    public int searchTitleListCount(String title);//제목으로 찾은 모든 개수
    public int searchContentListCount(String content);//내용로 찾은 모든 개수
    public int searchWriterListCount(String writer);//글쓴이으로 찾은 모든 개수
    
    public int mySearchTitleCount(String qid, String title);//회원 아이디와 제목으로 찾은 모든 개수
    public int mySearchContentCount(String qid, String content);//회원 아이디와 내용로 찾은 모든 개수
    public int mySearchWriterCount(String qid, String writer);//회원 아이디와 글쓴이으로 찾은 모든 개수
    
	//예약관련
	public void reservation(String rid, String rname, String rphone, String ranimal, String rlist, String rcontent, String rday, String rtime);//예약 insert
	public ArrayList<ReservationDto> reservationAll(Criteria cri);//모든 예약정보 가져오기 select
	public ReservationDto getReservation(String rnum);//예약정보가져오기 select
	public int checkTime(String rday, String rtime);//예약날짜, 시간 중복체크 select
	//public int checkList(String rid, String rlist);//동일예약자의 중복접수체크 select
	public ArrayList<ReservationDto> reservationList(Criteria2 cri2);//본인 예약정보 리스트 select
	public ReservationDto reservationView(String rnum);//선택한 예약 번호의 정보 가져오기 select
	public int reservationCount(String rid);//나의 예약 개수 가져오기 select
	public int reserveListCount(String rid, String rlist);//나의 리스트별 예약개수 가져오기 select
	public int reAllCount();//전체 예약 개수 가져오기 select
	public int reListAllCount(String rlist);//전체 예약건중 진료별 검색 개수 가져오기 select
	public void reserveModifyOk(String rnum, String rid, String rname, String rphone, String ranimal, String rlist, String rcontent, String rday, String rtime);//해당 예약 번호로 조회하여 예약수정 update
	public ArrayList<ReservationDto> rSearchList(Criteria2 cri2);//나의 예약 접수항목별 검색 select
	public ArrayList<ReservationDto> rAllSearchList(Criteria2 cri2);//나의 전체예약 검색 select
	public ArrayList<ReservationDto> adSearchList(Criteria2 cri2);//전체예약 리스트별 검색 select
	public ArrayList<ReservationDto> rAlldaySearch(Criteria3 cri3);//예약 날짜별 검색 select
	public int rAlldayCount(Criteria3 cri3);//예약 날짜별 검색된 개수 가져오기 select
	public void reserveDelete(String rnum);//해당 예약 번호로 조회하여 예약내역 삭제 delete
}
