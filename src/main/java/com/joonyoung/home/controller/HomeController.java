package com.joonyoung.home.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joonyoung.home.dao.IDao;
import com.joonyoung.home.dto.AnswerDto;
import com.joonyoung.home.dto.MemberDto;
import com.joonyoung.home.dto.QBoardDto;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/profile")
	public String profile() {
		return "profile";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/adminlogin")
	public String adminlogin() {
		return "adminlogin";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "join";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
	
	@RequestMapping("/reservationlist")
	public String reservation() {
		return "reservationlist";
	}
	
	@RequestMapping("/question")
	public String question(HttpSession session, HttpServletResponse response, Model model) throws IOException {
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String sessionId = (String) session.getAttribute("memberId");
		
		if(sessionId == null) {
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('로그인이 필요한 기능입니다. 로그인 여부를 확인하여주세요'); history.go(-1);</script>");
	        out.flush(); 
		} else {
			
			MemberDto mdto = dao.question(sessionId);
			
			model.addAttribute("member", mdto);
		}
		
		return "question";
	}
	
	@RequestMapping("/questionOk")
	public String questionOk(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String qid = request.getParameter("qid");//글쓴 유저 아이디
		String qname = request.getParameter("qname");//글쓴 유저 이름
		String qtitle = request.getParameter("qtitle");//글쓴 제목
		String qcontent = request.getParameter("qcontent");//글쓴 내용
		String qemail = request.getParameter("qemail");//글쓴 유저 이메일
		
		dao.writeQuestion(qid, qname, qtitle, qcontent, qemail);
		
		return "redirect:list";
	}
	
	@RequestMapping("joinOk")
	public String joinOk(HttpServletRequest request, HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mgender = request.getParameter("mgender");
		String mphone = request.getParameter("mphone");
		String memail = request.getParameter("memail");
		
		int joinFlag = dao.memberJoin(mid, mpw, mname, mgender, mphone, memail);
		//joinFlag값이 1이면 회원가입 성공, 아니면 실패
		
		if(joinFlag == 1) {//회원가입성공시 바로 로그인 진행
			session.setAttribute("memberId", mid);
			session.setAttribute("memberName", mname);
			
			model.addAttribute("mname", mname);
			model.addAttribute("mid", mid);
			
			return "joinOk";
		
		} else { //회원가입 실패
			return "joinFail";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "login";
	}
	
	@RequestMapping("/loginOk")
	public String loginOk(HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		int checkIdFlag = dao.checkId(mid);
		//로그인 하려는 아이디가 존재시 1, 로그인 아이디가 존재하지않으면 0 
		
		int checkIdPwFlag = dao.checkIdAndPw(mid, mpw);
		//로그인 하려는 아이디와 비밀번호가 모두 일치하면 1 아니면 0
		
		model.addAttribute("checkIdFlag", checkIdFlag);
		
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if (checkIdFlag == 0){
		
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('입력하신 아이디는 존재하지 않습니다. 다시 확인해주세요..'); history.go(-1);</script>");
	        out.flush(); 
	        
	        return "login";
			
		} else if (checkIdPwFlag == 0){
		
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('입력하신 아이디와 비밀번호가 일치하지 않습니다. 다시 확인해주세요.'); history.go(-1);</script>");
	        out.flush(); 
			
	        return "login";
		} else {//로그인 실행
			session.setAttribute("memberId", mid);
			
			MemberDto memberDto = dao.getMemberInfo(mid);
			
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("mid", mid);
			
			return "redirect:index";
			
		}
	}
	
	@RequestMapping("memberModify")
	public String memberModify(HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String sessionid = (String) session.getAttribute("memberId");
		
		MemberDto memberdto = dao.getMemberInfo(sessionid);
		
		model.addAttribute("memberdto", memberdto);
		
		return "memberModify";
	}
	
	@RequestMapping("memberModifyOk")
	public String memberModifyOk(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mgender = request.getParameter("mgender");
		String mphone = request.getParameter("mphone");
		String memail = request.getParameter("memail");
		String mdate = request.getParameter("mdate");
		
		dao.memberModify(mid, mpw, mname, mgender, mphone, memail, mdate);
		
		MemberDto memberdto = dao.getMemberInfo(mid);//수정된 회원정보 다시 가져오기 
		
		model.addAttribute("memberDto", memberdto);
		
		return "memberModifyOk";
	}
	
	@RequestMapping ("/list")
	public String list(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		
		List<QBoardDto> qboardDto = dao.questionList();
		int qproboardCount = dao.proboardAllCount();
		
		model.addAttribute("qdtos", qboardDto);
		model.addAttribute("qproboardCount", qproboardCount);
		
		return "questionlist";
	}
	
	@RequestMapping("/questionView")
	public String questionView(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String qnum = request.getParameter("qnum");
		
		dao.qhit(qnum);//조회수 증가
		
		QBoardDto qBoardDtos = dao.questionView(qnum);
		ArrayList<AnswerDto> answerDtos = dao.answerlist(qnum);
		
		model.addAttribute("view", qBoardDtos);
		model.addAttribute("qid", qBoardDtos.getQid());//글쓴 유저의 아이디값 전송
		
		if(answerDtos == null) {
			model.addAttribute("answer","댓글이 없습니다.");
		} else {
		model.addAttribute("answer",answerDtos);//해당 글에 달린 댓글 리스트
		}
		
		return "questionView";
	}
	
	@RequestMapping("/questionModify")
	public String questionModify(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String qnum = request.getParameter("qnum");
		
		QBoardDto qBoardDtos = dao.questionView(qnum);
		
		model.addAttribute("view", qBoardDtos);
		
		return "questionModify";
	}
	
	@RequestMapping("/questionModifyOk")
	public String questionModifyOk(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String qnum = request.getParameter("qnum");
		String qname = request.getParameter("qname");
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		dao.questionModify(qnum, qname, qtitle, qcontent, qemail);
		
		return "redirect:list";
	}
	
	@RequestMapping ("/questionAnswerOk")
	public String answer(HttpServletRequest request, HttpSession session, Model model) {
		//댓글 insert 시키기
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String aqid = request.getParameter("qnum");//댓글의 원글번호
		String acontent = request.getParameter("acontent");//댓글 내용
		
		String sessionId = (String) session.getAttribute("memberId");//현재 로그인한 유저의 아이디
		
		dao.writeAnswer(acontent, sessionId, aqid);//댓글 쓰기
		dao.answercountPlus(aqid);//해당글의 댓글 총 개수 증가
		
		//원글 및 댓글 불러오기
		QBoardDto qBoardDtos = dao.questionView(aqid);
		ArrayList<AnswerDto> answerDtos = dao.answerlist(aqid);
		
		model.addAttribute("view", qBoardDtos);
		model.addAttribute("qid", qBoardDtos.getQid());//글쓴 유저의 아이디값 전송
		
		model.addAttribute("answer",answerDtos);
		
		return "questionView";
	}
	
	@RequestMapping ("/questionDelete")
	public String delete(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String qnum = request.getParameter("qnum");
		
		dao.questionDelete(qnum);
		
		return "redirect:list";
	}
	
	@RequestMapping ("/answerDelete")
	public String answerDelete(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String anum = request.getParameter("anum");// 댓글의 고유번호
		String aqid = request.getParameter("qnum");// 게시글의 고유번호
		
		dao.answerDelete(anum);
		dao.answercountMinus(aqid);//댓글개수 -1
		
		QBoardDto qBoardDtos = dao.questionView(aqid);
		ArrayList<AnswerDto> answerDtos = dao.answerlist(aqid);
		
		model.addAttribute("view", qBoardDtos);//게시판 전체내용 전송
		model.addAttribute("qid", qBoardDtos.getQid());//글쓴 유저의 아이디값 전송
		
		model.addAttribute("answer",answerDtos);//댓글 전체리스트 전송
		
		return "questionView";
	}
	
	@RequestMapping(value = "search_list")
	public String search_list(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		ArrayList<QBoardDto> qboardDto = null;
		
		String searchOption = request.getParameter("searchOption");
		String searchKey = request.getParameter("searchKey");
		
		if(searchOption.equals("title")) {
			qboardDto = dao.proSearchTitleList(searchKey);
		} else if(searchOption.equals("content")) {
			qboardDto = dao.proSearchContentList(searchKey);
		} else if(searchOption.equals("writer")) {
			qboardDto = dao.proSearchWriterList(searchKey);
		}
		
		model.addAttribute("qdtos", qboardDto);
		model.addAttribute("qproboardCount", qboardDto.size());//검색 결과 게시물의 개수 반환
		
		return "questionlist";
	}
	
	@RequestMapping(value = "mysearch_list")
	public String mysearch_list(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		ArrayList<QBoardDto> qboardDto = null;
		
		String searchOption = request.getParameter("searchOption");
		String searchKey = request.getParameter("searchKey");
		String qid = request.getParameter("qid");
		
		if(searchOption.equals("title")) {
			qboardDto = dao.mySearchTitleList(qid, searchKey);
		} else if(searchOption.equals("content")) {
			qboardDto = dao.mySearchContentList(qid, searchKey);
		} else if(searchOption.equals("writer")) {
			qboardDto = dao.mySearchWriterList(qid, searchKey);
		}
		
		model.addAttribute("qdtos", qboardDto);
		model.addAttribute("qproboardCount", qboardDto.size());//검색 결과 게시물의 개수 반환
		
		return "myquestionlist";
	}
	
	@RequestMapping("/myquestionlist")
	public String myquestionView(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String qid = request.getParameter("qid");
		
		List<QBoardDto> qboardDto = dao.myquestionList(qid);
		int qproboardMyCount = dao.proboardMyCount(qid);
		
		model.addAttribute("qdtos", qboardDto);
		model.addAttribute("qproboardMyCount", qproboardMyCount);
		
		return "myquestionlist";
	}
	
	@RequestMapping("/reservation")
	public String reservationOk(HttpSession session, HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String sessionId = (String) session.getAttribute("memberId");

		MemberDto mdto = dao.question(sessionId);
			
		model.addAttribute("member", mdto);
		
		//rlist값 빼오기
		
		String check = request.getParameter("check");
		
		model.addAttribute("check",check);
		
		return "reservation";
	}
}
