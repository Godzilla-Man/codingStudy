package kr.or.iei.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class AllMemberServlet
 */
@WebServlet("/allMember")
public class AllMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		//2. 값 추출 -> pageGb
		String pageGb = request.getParameter("pageGb"); //페이지 구분 값		
		
		//3. 로직 -> 전체 회원 조회
		MemberService service = new MemberService();
		ArrayList<Member> list = service.selectAllMember();
		
		//4. 결과 처리
		//4.1 결과를 처리할 JSP 페이지를 지정
		RequestDispatcher view = null;
		
		if(pageGb.equals("sel")){
			view = request.getRequestDispatcher("/WEB-INF/views/member/allMember.jsp");			
		}else if(pageGb.equals("del")) {
			view = request.getRequestDispatcher("/WEB-INF/views/member/deleteFrm.jsp");			
		}
		
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
