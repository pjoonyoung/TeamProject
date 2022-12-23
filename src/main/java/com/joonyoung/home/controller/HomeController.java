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
		String qcontent = request.getParameter("qcontent");//글쓴 내용
		String qemail = request.getParameter("qemail");//글쓴 유저 이메일
		
		dao.writeQuestion(qid, qname, qcontent, qemail);
		
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
		
		model.addAttribute("qdtos", qboardDto);
		
		return "questionlist";
	}
	
	@RequestMapping("/questionView")
	public String questionView(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String qnum = request.getParameter("qnum");
		
		QBoardDto qBoardDtos = dao.questionView(qnum);
		
		model.addAttribute("view", qBoardDtos);
		model.addAttribute("qid", qBoardDtos.getQid());//글쓴 유저의 아이디값 전송
		
		ArrayList<AnswerDto> answerDtos = dao.answerlist(qnum);
		
		if(answerDtos == null) {
			model.addAttribute("answer","댓글이 없습니다.");
		} else {
			model.addAttribute("answer",answerDtos);
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
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		dao.questionModify(qnum, qname, qcontent, qemail);
		
		return "redirect:list";
	}
	
	@RequestMapping ("/questionAnswerOk")
	public String answer(HttpServletRequest request, HttpSession session, Model model) {
		//댓글 insert 시키기
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String aqid = request.getParameter("qnum");
		String acontent = request.getParameter("acontent");
		
		String sessionId = (String) session.getAttribute("memberId");//현재 로그인한 유저의 아이디
		
		dao.writeAnswer(acontent, sessionId, aqid);//댓글 쓰기
		
		//원글 및 댓글 불러오기
		QBoardDto qBoardDtos = dao.questionView(aqid);
		
		model.addAttribute("view", qBoardDtos);
		model.addAttribute("qid", qBoardDtos.getQid());//글쓴 유저의 아이디값 전송
		
		ArrayList<AnswerDto> answerDtos = dao.answerlist(aqid);
		
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
		
		System.out.println(anum);
		System.out.println(aqid);
		
		dao.answerDelete(anum);
		
		QBoardDto qBoardDtos = dao.questionView(aqid);
		ArrayList<AnswerDto> answerDtos = dao.answerlist(aqid);
		
		model.addAttribute("view", qBoardDtos);
		model.addAttribute("qid", qBoardDtos.getQid());//글쓴 유저의 아이디값 전송
		
		model.addAttribute("answer",answerDtos);
		
		return "questionView";
	}
	
}
