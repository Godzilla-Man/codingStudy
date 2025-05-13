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
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		//2. 갑 추출 - 아이디, 비밀번호, 이름, 전화번호, 주소
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String memberPhone = request.getParameter("memberPhone");
		String memberAddr = request.getParameter("memberAddr");
		
		//3. 로직 - 회원 가입
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPw(memberPw);
		m.setMemberName(memberName);
		m.setMemberPhone(memberPhone);
		m.setMemberAddr(memberAddr);
		
		MemberService service = new MemberService();
		int result = service.joinMember(m);
		
		//4. 결과 처리
		//4.1 이동할 JSP 페이지 경로 지정
		RequestDispatcher view = null;
		if(result > 0) {
			/*
			아래 주석 처리된 코드 주석 해제 후 실행하면
			회원가입 정상 처리 -> 전체 회원 조회하여 allMember.jsp로 이동 -> allMember.jsp 전체회원출력.
			처음 1번은 정상 전체 조회가 된다. 그 상태로 F5를 누르면 상단 주소창에 작성된 url로 재요청을 보냄(/join).
			이때, 기존 회원 가입 시 작성한 정보가 전송되어 중복 체크 결과에 따라 "회원 가입 실패" 메시지 출력됨.
			 
			view = request.getRequestDispatcher("/WEB-INF/views/member/allMember.jsp");
			
			//4.2 화면 구현에 필요한 데이터 등록
			ArrayList<Member> list = service.selectAllMember();
			request.setAttribute("memberList", list); // list 등록 시, key를 allMember.jsp 상단에 작성한 명칭과 동일하게 작성해야 한다.
			view.forward(request, response);
			*/
			
			//브라우저에, http 상태 코드 302와 재요청할 url 정보를 응답해주면,
			//브라우저에 302를 해석하고, 응답 받은 url로 재요청을 보냄.
			response.sendRedirect("/allMember?pageGb=sel");
		}else {
			System.out.println("result :" + result);
			//가입 실패 or 중복 회원 존재
			view = request.getRequestDispatcher("/WEB-INF/views/member/insertFail.jsp");
			//4.3 페이지 이동
			view.forward(request, response);
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
