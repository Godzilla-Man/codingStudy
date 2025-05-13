package kr.or.iei.member.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class AdminServlet
 */
@WebServlet("/member/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩 - 필터
		//2. 값 추출
		//3. 로직
		HttpSession session = request.getSession(false);
		if(session != null) {
			Member loginMember = (Member) session.getAttribute("loginMember");
			
			if(loginMember.getMemberLevel() != 1) {
				RequestDispatcher page = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				
				request.setAttribute("title", "알림");
				request.setAttribute("msg", "관리자만 접속 가능합니다.");
				request.setAttribute("icon", "error");
				request.setAttribute("loc", "/member/mypage");
				
				page.forward(request, response);
				return;				
			}
		}
		
		MemberService service = new MemberService();
		ArrayList<Member> list = service.selectAllMember();		
		
		//4. 결과 처리
		//4.1 이동할 페이지 경로 지정
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/adminPage.jsp");
		//4.2 화면 구현에 필요한 데이터 등록
		request.setAttribute("memberList", list);		
		//4.3 페이지 이동
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
