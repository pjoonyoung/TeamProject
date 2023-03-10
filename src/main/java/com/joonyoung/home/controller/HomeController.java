package com.joonyoung.home.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joonyoung.home.dao.IDao;
import com.joonyoung.home.dto.AnswerDto;
import com.joonyoung.home.dto.MemberDto;
import com.joonyoung.home.dto.QBoardDto;
import com.joonyoung.home.dto.ReservationDto;
import com.joonyoung.home.paging.Criteria;
import com.joonyoung.home.paging.Criteria2;
import com.joonyoung.home.paging.Criteria3;
import com.joonyoung.home.paging.PageDto;
import com.joonyoung.home.paging.PageDto2;
import com.joonyoung.home.paging.PageDto3;

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
	
	@RequestMapping("/adminpage")
	public String adminpage() {
		return "adminpage";
	}
	
	@RequestMapping("/reservationlist")
	public String reservation() {
		return "reservationlist";
	}
	
	@RequestMapping("/pwCheck")
	public String pwCheck() {
		return "pwCheck";
	}
	
	@RequestMapping("/mPwCheck")
	public String mPwCheck() {
		return "mPwCheck";
	}
	
	@RequestMapping("/secessionOk")
	public String secessionOk() {
		return "secessionOk";
	}
	
	@RequestMapping("/pwFind")
	public String pwFind() {
		return "pwFind";
	}
	
	@RequestMapping("/idFind")
	public String idFind() {
		return "idFind";
	}
	
	@RequestMapping("/question")
	public String question(HttpSession session, HttpServletResponse response, Model model) throws IOException {
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String sessionId = (String) session.getAttribute("memberId");
		
		if(sessionId == null) {
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('???????????? ????????? ???????????????. ????????? ????????? ?????????????????????'); history.go(-1);</script>");
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
		
		String qid = request.getParameter("qid");//?????? ?????? ?????????
		String qname = request.getParameter("qname");//?????? ?????? ??????
		String qtitle = request.getParameter("qtitle");//?????? ??????
		String qcontent = request.getParameter("qcontent");//?????? ??????
		String qemail = request.getParameter("qemail");//?????? ?????? ?????????
		
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
		//joinFlag?????? 1?????? ???????????? ??????, ????????? ??????
		
		if(joinFlag == 1) {//????????????????????? ?????? ????????? ??????
			session.setAttribute("memberId", mid);
			session.setAttribute("memberName", mname);
			
			model.addAttribute("mname", mname);
			model.addAttribute("mid", mid);
			
			return "joinOk";
		
		} else { //???????????? ??????
			return "joinFail";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "index";
	}
	
	@RequestMapping("/loginOk")
	public String loginOk(HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		int checkIdFlag = dao.checkId(mid);
		//????????? ????????? ???????????? ????????? 1, ????????? ???????????? ????????????????????? 0 
		
		int checkIdPwFlag = dao.checkIdAndPw(mid, mpw);
		//????????? ????????? ???????????? ??????????????? ?????? ???????????? 1 ????????? 0
		
		model.addAttribute("checkIdFlag", checkIdFlag);
		
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if (checkIdFlag == 0){
		
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('???????????? ???????????? ???????????? ????????????. ?????? ??????????????????..'); history.go(-1);</script>");
	        out.flush(); 
	        
	        return "login";
			
		} else if (checkIdPwFlag == 0){
		
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('???????????? ???????????? ??????????????? ???????????? ????????????. ?????? ??????????????????.'); history.go(-1);</script>");
	        out.flush(); 
			
	        return "login";
		} else {//????????? ??????
			session.setAttribute("memberId", mid);
			
			MemberDto memberDto = dao.getMemberInfo(mid);
			
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("mid", mid);
			
			return "redirect:index";
			
		}
	}
	
	@RequestMapping("/pwCheckOk")
	public String pwCheckOk(HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");

		int checkIdPwFlag = dao.checkIdAndPw(mid, mpw);
		//???????????? ??????????????? ?????? ???????????? 1 ????????? 0
		
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if (checkIdPwFlag == 0){
		
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('???????????? ???????????? ??????????????? ???????????? ????????????. ?????? ??????????????????.'); history.go(-1);</script>");
	        out.flush(); 
			
	        return "pwCheck";
	        
		} else {//????????????????????? ??????
			
			return "redirect:memberModify";
			
		}
	}
	
	@RequestMapping("/mPwCheckOk")
	public String mPwCheckOk(HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");

		int checkIdPwFlag = dao.checkIdAndPw(mid, mpw);
		//???????????? ??????????????? ?????? ???????????? 1 ????????? 0
		
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if (checkIdPwFlag == 0){
		
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('???????????? ???????????? ??????????????? ???????????? ????????????. ?????? ??????????????????.'); history.go(-1);</script>");
	        out.flush(); 
			
	        return "mPwCheck";
	        
		} else {//????????????????????? ??????
			
			return "mSecession";
			
		}
	}
	
	@RequestMapping("/idFindOk")
	public String idFindOk(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		String mphone = request.getParameter("mphone");
		
		int ckIdFindFlag = dao.checkIdFind(mname, memail, mphone);
		//????????? ????????? ?????? ???????????? ???????????? ????????? 1 ????????? 0
		
		if(ckIdFindFlag == 0) {
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('???????????? ????????? ???????????? ????????????. ?????? ??????????????????.'); history.go(-1);</script>");
	        out.flush(); 
	        
	        return "idFind";
	        
		} else {
		
			MemberDto mfindDto = dao.memberIdFind(mname, memail, mphone);
			model.addAttribute("find", mfindDto);
			
			return "idFindOk";
		}
		
	}
	
	@RequestMapping("/pwFindOk")
	public String pwFindOk(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		int ckPwFindFlag = dao.checkPwFind(mid, mname, memail);
		//????????? ????????? ?????? ???????????? ???????????? ????????? 1 ????????? 0
		
		if(ckPwFindFlag == 0) {
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('???????????? ????????? ???????????? ????????????. ?????? ??????????????????.'); history.go(-1);</script>");
	        out.flush(); 
	        
	        return "pwFind";
		} else {
		
			MemberDto mfindDto = dao.memberPwFind(mid, mname, memail);
			
			model.addAttribute("find", mfindDto);
			
			return "pwFindOk";
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
	
	@RequestMapping("pwchange")
	public String memberpwModify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		dao.pwModify(mid, mpw);
		
		response.setContentType("text/html; charset=UTF-8");      
        PrintWriter out = response.getWriter();
        out.println("<script>alert('??????????????? ??????????????? ?????????????????????.');</script>");
        out.println("<script>location.href = 'login';</script>");
        out.flush();
		
		return "login";
	}
	
	@RequestMapping("memberSelectOk")
	public String memberSelectOk(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		
		MemberDto memberdto = dao.getMemberInfo(mid);
		
		model.addAttribute("memberdto", memberdto);
		
		return "memberModify";
	}
	
	@RequestMapping("memberModifyOk")
	public String memberModifyOk(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mphone = request.getParameter("mphone");
		String memail = request.getParameter("memail");
		
		dao.memberModify(mid, mpw, mname, mphone, memail);
		
		MemberDto memberdto = dao.getMemberInfo(mid);//????????? ???????????? ?????? ???????????? 
		
		model.addAttribute("memberDto", memberdto);
		
		return "memberModifyOk";
	}
	
	@RequestMapping ("/mSecessionOk")
	public String mSecessionOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		int checkIdPwFlag = dao.checkIdAndPw(mid, mpw);
		//???????????? ??????????????? ?????? ???????????? 1 ????????? 0
		
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if (checkIdPwFlag == 0){
		
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('???????????? ???????????? ??????????????? ???????????? ????????????. ?????? ??????????????????.'); history.go(-1);</script>");
	        out.flush(); 
			
	        return "mSecession";
	        
		} else {//????????????????????? ??????
			
			dao.memberDelete(mid, mpw);//???????????? ??????
			
			session.invalidate();//????????? ??????
			
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('????????? ?????????????????????. ????????? ????????????.');</script>");
	        out.println("<script>location.href = 'index';</script>");
	        out.flush();
			
			return "index";
		}
		
	}
	
	@RequestMapping ("/list")
	public String list(HttpServletRequest request, Model model, Criteria cri, Criteria2 cri2) {
		
		String searchKey = request.getParameter("searchKey");
        
		if(searchKey != null && searchKey.length() != 0) {
		    
			cri2.setSearchKey(searchKey);
			    
			String searchOption = request.getParameter("searchOption");      
			
			IDao dao = sqlSession.getMapper(IDao.class);
			
			ArrayList<QBoardDto> qboardDtos = null;
			
			int pageNumInt=1;
			
			int qproboardCount = 0;
			
			PageDto2 pageDto = null;
			
			model.addAttribute("searchKey", searchKey);
            model.addAttribute("searchOption", searchOption);
            
            if(request.getParameter("pageNum") == null) {
                pageNumInt =1;//1??????????????? ??????
               cri2.setPageNum(pageNumInt);
            } else {
                pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
                cri2.setPageNum(pageNumInt);
            }

		if(searchOption.equals("title")) {
               
           cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
           
           qboardDtos = dao.proSearchTitleList(cri2);
           
           qproboardCount = dao.searchTitleListCount(searchKey);//??? ????????????
           
           pageDto = new PageDto2(cri2, qproboardCount); 
           
		} else if(searchOption.equals("content")) {
            
            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
            
            qboardDtos = dao.proSearchContentList(cri2);
            
            qproboardCount = dao.searchContentListCount(searchKey);
            
            pageDto = new PageDto2(cri2, qproboardCount);
		
		} else if(searchOption.equals("writer")) {
            
            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
            
            qboardDtos = dao.proSearchWriterList(cri2);
            
            qproboardCount = dao.searchWriterListCount(searchKey);
            
            pageDto = new PageDto2(cri2, qproboardCount);
        }
		
		model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
        model.addAttribute("qdtos", qboardDtos);
        model.addAttribute("qproboardCount", qproboardCount);      
        model.addAttribute("currPage", pageNumInt );

		} else {
	         
			int pageNumInt = 1;
			if(request.getParameter("pageNum") == null) {
				pageNumInt = 1;
				cri.setPageNum(pageNumInt);
				
			} else {
				pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
				cri.setPageNum(pageNumInt);
			}
			
			IDao dao = sqlSession.getMapper(IDao.class);
			
			int qproboardCount = dao.proboardAllCount();
			
			cri.setStartNum(cri.getPageNum()-1 * cri.getAmount());//?????? ???????????? ??????????????? ??????
			
			PageDto pageDto = new PageDto(cri, qproboardCount);
			
			List<QBoardDto> qboardDtos = dao.questionList(cri);
			
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("qdtos", qboardDtos);
			model.addAttribute("currPage", pageNumInt );
			model.addAttribute("qproboardCount", qproboardCount);
			
		}
		return "questionlist";
	}
	
	@RequestMapping("/questionView")
	public String questionView(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String qnum = request.getParameter("qnum");
		
		dao.qhit(qnum);//????????? ??????
		
		QBoardDto qBoardDtos = dao.questionView(qnum);
		ArrayList<AnswerDto> answerDtos = dao.answerlist(qnum);
		
		model.addAttribute("view", qBoardDtos);
		model.addAttribute("qid", qBoardDtos.getQid());//?????? ????????? ???????????? ??????
		
		if(answerDtos == null) {
			model.addAttribute("answer","????????? ????????????.");
		} else {
		model.addAttribute("answer",answerDtos);//?????? ?????? ?????? ?????? ?????????
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
		//?????? insert ?????????
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String aqid = request.getParameter("qnum");//????????? ????????????
		String acontent = request.getParameter("acontent");//?????? ??????
		
		String sessionId = (String) session.getAttribute("memberId");//?????? ???????????? ????????? ?????????
		
		dao.writeAnswer(acontent, sessionId, aqid);//?????? ??????
		dao.answercountPlus(aqid);//???????????? ?????? ??? ?????? ??????
		
		//?????? ??? ?????? ????????????
		QBoardDto qBoardDtos = dao.questionView(aqid);
		ArrayList<AnswerDto> answerDtos = dao.answerlist(aqid);
		
		model.addAttribute("view", qBoardDtos);
		model.addAttribute("qid", qBoardDtos.getQid());//?????? ????????? ???????????? ??????
		
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
		
		String anum = request.getParameter("anum");// ????????? ????????????
		String aqid = request.getParameter("qnum");// ???????????? ????????????
		
		dao.answerDelete(anum);
		dao.answercountMinus(aqid);//???????????? -1
		
		QBoardDto qBoardDtos = dao.questionView(aqid);
		ArrayList<AnswerDto> answerDtos = dao.answerlist(aqid);
		
		model.addAttribute("view", qBoardDtos);//????????? ???????????? ??????
		model.addAttribute("qid", qBoardDtos.getQid());//?????? ????????? ???????????? ??????
		
		model.addAttribute("answer",answerDtos);//?????? ??????????????? ??????
		
		return "questionView";
	}
	
	@RequestMapping("/myquestionlist")
	public String myquestionView(HttpServletRequest request, Model model, Criteria cri, Criteria2 cri2) {
		
		String searchKey = request.getParameter("searchKey");
		String searchid = request.getParameter("qid");
		cri2.setSearchid(searchid);
		
		if(searchKey != null && searchKey.length() != 0) {
		    
			cri2.setSearchKey(searchKey);
			
			String searchOption = request.getParameter("searchOption");      
			
			IDao dao = sqlSession.getMapper(IDao.class);
			
			ArrayList<QBoardDto> qboardDtos = null;
			
			int pageNumInt=1;
			
			int qproboardMyCount = 0;
			
			PageDto2 pageDto = null;
			
			model.addAttribute("searchid", searchid);
			model.addAttribute("searchKey", searchKey);
            model.addAttribute("searchOption", searchOption);
            
            if(request.getParameter("pageNum") == null) {
                pageNumInt =1;//1??????????????? ??????
               cri2.setPageNum(pageNumInt);
            } else {
                pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
                cri2.setPageNum(pageNumInt);
            }

		if(searchOption.equals("title")) {
               
           cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
           
           qboardDtos = dao.mySearchTitleList(cri2);
           
           qproboardMyCount = dao.mySearchTitleCount(searchid, searchKey);//??? ????????????
           
           pageDto = new PageDto2(cri2, qproboardMyCount); 
           
		} else if(searchOption.equals("content")) {
            
            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
            
            qboardDtos = dao.mySearchContentList(cri2);
            
            qproboardMyCount = dao.mySearchContentCount(searchid, searchKey);
            
            pageDto = new PageDto2(cri2, qproboardMyCount);
		
		} else if(searchOption.equals("writer")) {
            
            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
            
            qboardDtos = dao.mySearchWriterList(cri2);
            
            qproboardMyCount = dao.mySearchWriterCount(searchid, searchKey);
            
            pageDto = new PageDto2(cri2, qproboardMyCount);
        }
		
		model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
        model.addAttribute("qdtos", qboardDtos);
        model.addAttribute("qproboardMyCount", qproboardMyCount);      
        model.addAttribute("currPage", pageNumInt );

		} else {
	         
			int pageNumInt = 1;
			if(request.getParameter("pageNum") == null) {
				pageNumInt = 1;
				cri2.setPageNum(pageNumInt);
				
			} else {
				pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
				cri2.setPageNum(pageNumInt);
			}
			
			IDao dao = sqlSession.getMapper(IDao.class);
			
			int qproboardMyCount = dao.proboardMyCount(searchid);
			
			cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());//?????? ???????????? ??????????????? ??????
			
			PageDto2 pageDto2 = new PageDto2(cri2, qproboardMyCount);
			
			List<QBoardDto> qboardDtos = dao.myquestionList(cri2);
			
			model.addAttribute("pageMaker", pageDto2);
			model.addAttribute("qdtos", qboardDtos);
			model.addAttribute("currPage", pageNumInt );
			model.addAttribute("qproboardMyCount", qproboardMyCount);
			
		}
		
		return "myquestionlist";
	}
	
	@RequestMapping("/reservation")
	public String reservationOk(HttpSession session, HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String sessionId = (String) session.getAttribute("memberId");
		MemberDto mdto = dao.question(sessionId);
		model.addAttribute("member", mdto);
		
		//rlist??? ?????????
		String check = request.getParameter("check");
		model.addAttribute("check",check);
		
		return "reservation";
	}
	@RequestMapping("reservationOk")
	public String reservationOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String rid = request.getParameter("rid");//?????? ?????? ?????????
		String rname = request.getParameter("rname");//?????? ?????? ??????
		String rphone = request.getParameter("rphone");//?????? ????????????
		String ranimal = request.getParameter("ranimal");//????????? ????????????
		String rlist = request.getParameter("rlist");//?????? ????????????
		String rcontent = request.getParameter("rcontent");//?????? ?????? ????????????
		String rday = request.getParameter("rday");//?????? ??????
		String rtime = request.getParameter("selectOption");//?????? ??????
		
		//????????????
		int checktimeFlag = dao.checkTime(rday, rtime);
		//?????? ????????? ????????? ????????? ????????? 1, ????????????????????? 0 
		
		//int checkList = dao.checkList(rid, rlist);
		//?????? ????????? ???????????? ??????list??? ????????? 1, ????????????????????? 0 
		
		//model.addAttribute("checktimeFlag", checktimeFlag);
		//model.addAttribute("checkList", checkList);
		
		if (checktimeFlag != 0){
		
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('??????????????? ????????? ???????????????. ??????????????? ??????????????????'); history.go(-1);</script>");
	        out.flush(); 
	        
	        return "reservation";
			
//		} else if (checkList != 0){
//		
//			response.setContentType("text/html; charset=UTF-8");      
//	        PrintWriter out = response.getWriter();
//	        out.println("<script>alert('??????????????? ???????????? ???????????? ????????????. ?????? ??????????????????!'); history.go(-1);</script>");
//	        out.flush(); 
//			
//	        return "reservation";
	        
		} else {//?????? ??????
			
			dao.reservation(rid, rname, rphone, ranimal, rlist, rcontent, rday, rtime);//???????????? insert
			
			response.setContentType("text/html; charset=UTF-8");      
			PrintWriter out = response.getWriter();
	        out.println("<script>alert('????????? ?????????????????????.');</script>");
	        out.println("<script>location.href = 'mypage';</script>");
	        out.flush(); 
			
			return "redirect:mypage";
		}
	}
	
	@RequestMapping("/myreservation")
	public String myreservation(HttpServletRequest request, Model model, Criteria cri, Criteria2 cri2) {
		
		String searchOption = request.getParameter("searchOption");
		String searchid = request.getParameter("rid");
	    
		cri2.setSearchid(searchid);

	    if(searchOption != null && searchOption.length() != 0) {
	        
	        cri2.setSearchOption(searchOption);
	         
	        IDao dao = sqlSession.getMapper(IDao.class);
	         
	        ArrayList<ReservationDto> rlistDto = null;
	         
	        int pageNumInt=1;
	         
	        int reservationCount = 0;
	         
	        PageDto2 pageDto = null;
	         
	        model.addAttribute("searchid", searchid);
			model.addAttribute("searchOption", searchOption);
			
			if(request.getParameter("pageNum") == null) {
				pageNumInt =1;//1??????????????? ??????
			    cri2.setPageNum(pageNumInt);
			} else {
			    pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
			    cri2.setPageNum(pageNumInt);
			}
	    
			if(searchOption.equals("??????")) {
	               
		           cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
		           
		           rlistDto = dao.rAllSearchList(cri2);
		           
		           reservationCount = dao.reservationCount(searchid);//?????? ??? ????????????
		           
		           pageDto = new PageDto2(cri2, reservationCount); 
		           
		      } else if(searchOption.equals("??????")) {
		            
		            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
		            
		            rlistDto = dao.rSearchList(cri2);
		            
		            reservationCount = dao.reserveListCount(searchid, searchOption);
		            
		            pageDto = new PageDto2(cri2, reservationCount);
		      
		      } else if(searchOption.equals("????????????")) {
		            
		            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
		            
		            rlistDto = dao.rSearchList(cri2);
		            
		            reservationCount = dao.reserveListCount(searchid, searchOption);
		            
		            pageDto = new PageDto2(cri2, reservationCount);
		            
		       } else if(searchOption.equals("??????")) {
		            
		            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
		            
		            rlistDto = dao.rSearchList(cri2);
		            
		            reservationCount = dao.reserveListCount(searchid, searchOption);
		            
		            pageDto = new PageDto2(cri2, reservationCount);
		        }
		      
		      	model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
		        model.addAttribute("rlistDto", rlistDto);
		        model.addAttribute("relistDto",searchOption);//?????????????????? ??????
		        model.addAttribute("reservationCount", reservationCount);      
		        model.addAttribute("currPage", pageNumInt );
		        
		      } else {
		            
		         int pageNumInt = 1;
		         if(request.getParameter("pageNum") == null) {
		            pageNumInt = 1;
		            cri2.setPageNum(pageNumInt);
		            
		         } else {
		            pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
		            cri2.setPageNum(pageNumInt);
		         }
		         
		         IDao dao = sqlSession.getMapper(IDao.class);
		         
		         int reservationCount = dao.reservationCount(searchid);
		         
		         cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());//?????? ???????????? ??????????????? ??????
		         
		         PageDto2 pageDto2 = new PageDto2(cri2, reservationCount);
		         
		         List<ReservationDto> rlistDto = dao.rAllSearchList(cri2);
		         
		         model.addAttribute("pageMaker", pageDto2);
		         model.addAttribute("rlistDto", rlistDto);
		         model.addAttribute("relistDto",searchOption);//?????????????????? ??????
		         model.addAttribute("currPage", pageNumInt );
		         model.addAttribute("reservationCount", reservationCount);
		         
		      }
			
		return "myreservation";
	}
	
	@RequestMapping("/reservationView")
	public String reservationView(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String rnum = request.getParameter("rnum");
		
		ReservationDto rDto = dao.reservationView(rnum);
		
		ReservationDto reservationDto = dao.getReservation(rnum);//??????????????? ?????? ?????? ???????????? 
		model.addAttribute("reservationDto", reservationDto);
		
		return "reservationView";
	}
	
	@RequestMapping("/reserveModify")
	public String reserveModify(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String rnum = request.getParameter("rnum");
		
		ReservationDto reservationDto = dao.getReservation(rnum);//??????????????? ?????? ????????????
		
		model.addAttribute("view", reservationDto); 
		
		return "reserveModify";
	}
	
	@RequestMapping("/reserveModifyOk")
	public String reserveModifyOk(HttpServletRequest request,HttpServletResponse response, Model model) throws IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String rnum = request.getParameter("rnum");//?????? ??????
		String rid = request.getParameter("rid");//?????? ?????? ?????????
		String rname = request.getParameter("rname");//?????? ?????? ??????
		String rphone = request.getParameter("rphone");//?????? ????????????
		String ranimal = request.getParameter("ranimal");//????????? ????????????
		String rlist = request.getParameter("rlist");//?????? ????????????
		String rcontent = request.getParameter("rcontent");//?????? ?????? ????????????
		String rday = request.getParameter("rday");//?????? ??????
		String rtime = request.getParameter("selectOption");//?????? ??????
		
		ReservationDto reservecheckDto = dao.getReservation(rnum);//??????????????? ?????? ????????????
		
		//????????????
		int checktimeFlag = dao.checkTime(rday, rtime);
		//?????? ????????? ????????? ????????? ????????? 1, ????????????????????? 0 
	
		if (rtime.equals(reservecheckDto.getRtime()) && rday.equals(reservecheckDto.getRday())) {
			
			dao.reserveModifyOk(rnum, rid, rname, rphone, ranimal, rlist, rcontent, rday, rtime);//???????????? ??????
			
			ReservationDto reservationDto = dao.getReservation(rnum);//??????????????? ?????? ????????????
			model.addAttribute("reserveview", reservationDto);
			
			return "reserveModifyOk";
			
		} else if (checktimeFlag != 0){
				
			response.setContentType("text/html; charset=UTF-8");      
			PrintWriter out = response.getWriter();
	        out.println("<script>alert('??????????????? ????????? ???????????????. ??????????????? ??????????????????'); history.go(-1);</script>");
	        out.flush(); 
		        
	        return "reserveModify";
	
		} else {//?????? ??????
			
			dao.reserveModifyOk(rnum, rid, rname, rphone, ranimal, rlist, rcontent, rday, rtime);//???????????? ??????
					
			ReservationDto reservationDto = dao.getReservation(rnum);//??????????????? ?????? ????????????
			model.addAttribute("reserveview", reservationDto);
			
			return "reserveModifyOk";
		}
	}
	
	@RequestMapping("/reserveDelete")
	public String reserveDelete(HttpServletRequest request,HttpSession session, Model model, Criteria cri, Criteria2 cri2) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String rnum = request.getParameter("rnum");
		dao.reserveDelete(rnum);//?????? ????????????
		
		String sessionId = (String) session.getAttribute("memberId");//????????? ????????? ???????????? ????????????
		cri2.setSearchid(sessionId);
		
		int pageNumInt = 1;
		
        if(request.getParameter("pageNum") == null) {
           pageNumInt = 1;
           cri2.setPageNum(pageNumInt);
           
        } else {
           pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
           cri2.setPageNum(pageNumInt);
        }
        
        int reservationCount = dao.reservationCount(sessionId);
        
        cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());//?????? ???????????? ??????????????? ??????
        
        PageDto2 pageDto2 = new PageDto2(cri2, reservationCount);
        
        List<ReservationDto> rlistDto = dao.rAllSearchList(cri2);
        
        model.addAttribute("pageMaker", pageDto2);
        model.addAttribute("rlistDto", rlistDto);
        model.addAttribute("currPage", pageNumInt );
        model.addAttribute("reservationCount", reservationCount);
        
        return "myreservation";
		
	}
	
	@RequestMapping("/reservationAll")
	public String reservationAll(HttpServletRequest request, Model model, Criteria cri, Criteria2 cri2) {
		
		String searchOption = request.getParameter("searchOption");
	    
	    if(searchOption != null && searchOption.length() != 0) {
	        
	        cri2.setSearchOption(searchOption);
	         
	        IDao dao = sqlSession.getMapper(IDao.class);
	         
	        ArrayList<ReservationDto> reAlldto = null;
	         
	        int pageNumInt=1;
	         
	        int reAllCount = 0;
	         
	        PageDto2 pageDto = null;
	         
			model.addAttribute("searchOption", searchOption);
			
			if(request.getParameter("pageNum") == null) {
				pageNumInt =1;//1??????????????? ??????
			    cri2.setPageNum(pageNumInt);
			} else {
			    pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
			    cri2.setPageNum(pageNumInt);
			}
	    
			if(searchOption.equals("??????")) {
	               
		           cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
		           
		           reAlldto = dao.reservationAll(cri);
		           
		           reAllCount = dao.reAllCount();//?????? ??? ????????????
		           
		           pageDto = new PageDto2(cri2, reAllCount); 
		           
		      } else if(searchOption.equals("??????")) {
		            
		            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
		            
		            reAlldto = dao.adSearchList(cri2);
		            
		            reAllCount = dao.reListAllCount(searchOption);
		            
		            pageDto = new PageDto2(cri2, reAllCount);
		      
		      } else if(searchOption.equals("????????????")) {
		            
		            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
		            
		            reAlldto = dao.adSearchList(cri2);
		            
		            reAllCount = dao.reListAllCount(searchOption);
		            
		            pageDto = new PageDto2(cri2, reAllCount);
		            
		       } else if(searchOption.equals("??????")) {
		            
		            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
		            
		            reAlldto = dao.adSearchList(cri2);
		            
		            reAllCount = dao.reListAllCount(searchOption);
		            
		            pageDto = new PageDto2(cri2, reAllCount);
		        }
		      
		      	model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
		        model.addAttribute("reAlldto", reAlldto);
		        model.addAttribute("relistDto",searchOption);//?????????????????? ??????
		        model.addAttribute("reAllCount", reAllCount);      
		        model.addAttribute("currPage", pageNumInt );
		        
		      } else {
		            
		         int pageNumInt = 1;
		         if(request.getParameter("pageNum") == null) {
		            pageNumInt = 1;
		            cri2.setPageNum(pageNumInt);
		            
		         } else {
		            pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
		            cri2.setPageNum(pageNumInt);
		         }
		         
		         IDao dao = sqlSession.getMapper(IDao.class);
		         
		         int reAllCount = dao.reAllCount();
		         
		         cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());//?????? ???????????? ??????????????? ??????
		         
		         PageDto2 pageDto2 = new PageDto2(cri2, reAllCount);
		         
		         List<ReservationDto> reAlldto = dao.reservationAll(cri);
		         
		         model.addAttribute("pageMaker", pageDto2);
		         model.addAttribute("reAlldto", reAlldto);
		         model.addAttribute("relistDto",searchOption);//?????????????????? ??????
		         model.addAttribute("currPage", pageNumInt );
		         model.addAttribute("reAllCount", reAllCount);
		         
		      }
			
		return "reservationAll";
	}
	
	@RequestMapping("/adrDelete")
	public String adrDelete(HttpServletRequest request,HttpSession session, Model model, Criteria cri, Criteria2 cri2) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String rnum = request.getParameter("rnum");
		dao.reserveDelete(rnum);//?????? ????????????
		
		int pageNumInt = 1;
        if(request.getParameter("pageNum") == null) {
           pageNumInt = 1;
           cri2.setPageNum(pageNumInt);
           
        } else {
           pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
           cri2.setPageNum(pageNumInt);
        }
        
        int reAllCount = dao.reAllCount();// ?????? ???????????? ????????????
        
        cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());//?????? ???????????? ??????????????? ??????
        
        PageDto2 pageDto2 = new PageDto2(cri2, reAllCount);
        
        List<ReservationDto> reAlldto = dao.reservationAll(cri);
        
        model.addAttribute("pageMaker", pageDto2);
        model.addAttribute("reAlldto", reAlldto);
        model.addAttribute("currPage", pageNumInt );
        model.addAttribute("reAllCount", reAllCount);
        
        return "reservationAll";
		
	}
	
	@RequestMapping(value = "day_search")
	public String day_search(HttpServletRequest request, Model model , Criteria cri, Criteria3 cri3) {
		
		String startday = request.getParameter("startday");
		String endday = request.getParameter("endday");
		
		cri3.setStartday(startday);
		cri3.setEndday(endday);
		
		int pageNumInt = 0;
		if(request.getParameter("pageNum") == null) {
			pageNumInt = 1;
			cri.setPageNum(pageNumInt);
			
		} else {
			pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
			cri.setPageNum(pageNumInt);
		}
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		List<ReservationDto> reAlldto = dao.rAlldaySearch(cri3);
		
		int reAllCount = dao.rAlldayCount(cri3);
		
		cri3.setStartNum(cri.getPageNum()-1 * cri.getAmount());//?????? ???????????? ??????????????? ??????
		
		PageDto3 pageDto3 = new PageDto3(cri3, reAllCount);
		
		model.addAttribute("pageMaker", pageDto3);
        model.addAttribute("reAlldto", reAlldto);
        model.addAttribute("currPage", pageNumInt );
        model.addAttribute("reAllCount", reAllCount);
		
		return "reservationAll";
	}
	
	@RequestMapping(value = "/admemberList")
	public String admemberList(HttpServletRequest request, Model model, Criteria cri, Criteria2 cri2) {
		
		String searchKey = request.getParameter("searchKey");
        
		if(searchKey != null && searchKey.length() != 0) {
		    
			cri2.setSearchKey(searchKey);
			    
			String searchOption = request.getParameter("searchOption");      
			
			IDao dao = sqlSession.getMapper(IDao.class);
			
			ArrayList<MemberDto> mAlldtos = null;
			
			int pageNumInt=1;
			
			int mAllcount = 0;
			
			PageDto2 pageDto = null;
			
			model.addAttribute("searchKey", searchKey);
            model.addAttribute("searchOption", searchOption);
            
            if(request.getParameter("pageNum") == null) {
                pageNumInt =1;//1??????????????? ??????
               cri2.setPageNum(pageNumInt);
            } else {
                pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
                cri2.setPageNum(pageNumInt);
            }

		if(searchOption.equals("??????")) {
               
           cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
           
           mAlldtos = dao.adMsearchList(cri2);
           
           mAllcount = dao.memberNamecount(searchKey);
           
           pageDto = new PageDto2(cri2, mAllcount); 
           
		}  else if(searchOption.equals("?????????")) {
            
            cri2.setStartNum(cri.getPageNum()-1 * cri.getAmount());
            
            mAlldtos = dao.adMsearchIdList(cri2);
            
            mAllcount = dao.memberIdcount(searchKey);
            
            pageDto = new PageDto2(cri2, mAllcount);
        }
		
		model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
        model.addAttribute("mAlldtos", mAlldtos);
        model.addAttribute("mAllcount", mAllcount);      
        model.addAttribute("currPage", pageNumInt );

		} else {
	         
			int pageNumInt = 1;
			if(request.getParameter("pageNum") == null) {
				pageNumInt = 1;
				cri.setPageNum(pageNumInt);
				
			} else {
				pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
				cri.setPageNum(pageNumInt);
			}
			
			IDao dao = sqlSession.getMapper(IDao.class);
			
			int mAllcount = dao.memberAllcount();
			
			cri.setStartNum(cri.getPageNum()-1 * cri.getAmount());//?????? ???????????? ??????????????? ??????
			
			PageDto pageDto = new PageDto(cri, mAllcount);
			
			List<MemberDto> mAlldtos = dao.memberAll(cri);
			
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("mAlldtos", mAlldtos);
			model.addAttribute("currPage", pageNumInt );
			model.addAttribute("mAllcount", mAllcount);
			
		}
		return "admemberList";
	}
	
}
