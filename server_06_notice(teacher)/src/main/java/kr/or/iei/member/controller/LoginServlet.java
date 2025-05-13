package kr.or.iei.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/member/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩 - 필터
		//2. 값 추출
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		
		
		//3. 로직 - 로그인
		//3.1 입력한 아이디와 비밀번호랑 일치하는 회원이 DB에 존재하는지
		//3.2 일치하는 회원의 컬럼 정보를 조회 (사용자가 입력한건 id와 pw 두개지만, 정상 로그인 이후 마이페이지 들어갔을 때 부가적인 정보들이 보여짐)
		//3.3 3.2에서 조회한 정보들은, 로그인 이후에 어느 JSP로 이동하든 회원 정보를 사용할 수 있음.
		MemberService service = new MemberService();
		Member loginMember = service.memberLogin(loginId, loginPw);
		
		
		//4. 결과처리
		RequestDispatcher view = null;
		
		if(loginMember == null) {
			view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			
			request.setAttribute("title", "알림");
			request.setAttribute("msg", "아이디 또는 비밀번호를 확인하세요");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/member/loginFrm");
			
		}else {
			if(loginMember.getMemberLevel() == 3) { //준회원은 로그인 불가.
				//4.1 이동할 페이지 경로 지정
				view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				
				//4.2 화면 구현에 필요한 데이터 등록
				request.setAttribute("title", "알림");
				request.setAttribute("msg", "로그인 권한이 없습니다. 관리자에게 문의하세요.");
				request.setAttribute("icon", "error");
				request.setAttribute("loc", "/member/loginFrm");
				
				//4.3 페이지 이동
				view.forward(request, response);
				return;
			}
			view = request.getRequestDispatcher("/index.jsp");
			
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			session.setMaxInactiveInterval(600); //세션 만료시간(초) 600초 == 10분
		}
		
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
