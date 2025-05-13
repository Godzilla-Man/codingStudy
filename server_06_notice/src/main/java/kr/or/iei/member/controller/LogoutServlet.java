package kr.or.iei.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/member/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩 - 필터
		//2. 값 추출
		//3. 로직 - 로그아웃
			/* 로그인 시, 서블릿 코드
			 * (1) 사용자가 입력한 아이디와 비밀번호 값 추출 
			 * (2) DB에 일치하는 회원 정보가 존재하는지 체크, 존재하면 모든 컬럼 정보 조회
			 * (3) Service에서 반환받은 회원 정보 객체(Member)를 HttpSession에 등록.
			 * 	- 세션에 등록한 이유 : 브라우저내의 모든 JSP에서 회원 정보를 공유하기 위해
			 *  -  
			 * 
			 */
		
		/*
		 * getSession() : 매개변수 전달하지 않으면 기본값 true
		 * 
		 * getSession(true) : 세션이 존재하면, 존재하는 세션 객체 반환. 존재하지 않으면 새로운 세션 생성하여 반환
		 * getSession(false) : 세션이 존재하면, 존재하는 세션 객체 반환. 존재하지 않으면 null을 반환
		 */ 
		
		HttpSession session = request.getSession(false); //세션 또는 null이 리턴됨.
		
		if(session != null) {
			//session.removeAttribute("loginMember"); ** 이 구문은 왜 못쓰는지 확인 필요!!!!
			session.invalidate(); // 세션에 저장된 모든 정보 파기
		}
		//4. 결과 처리
		response.sendRedirect("/");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
