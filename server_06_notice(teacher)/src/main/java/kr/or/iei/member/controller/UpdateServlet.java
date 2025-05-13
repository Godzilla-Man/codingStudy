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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/member/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩 - 필터
		
		//2. 값 추출 - 이름, 전화번호, 주소, 이메일
		/*
		 * 수행할 SQL
		 * 
		 * update tbl_member
		 *    set member_name = ?,
		 *        member_phone = ?,
		 *        member_addr = ?,
		 *        member_email = ?
		 *  where member_no = ?
		 * */
		String memberName = request.getParameter("memberName");
		String memberPhone = request.getParameter("memberPhone");
		String memberAddr = request.getParameter("memberAddr");
		String memberEmail = request.getParameter("memberEmail");
		String memberNo = request.getParameter("memberNo");
		
		
		//3. 로직 - 회원 정보 수정
		Member updMember = new Member();
		updMember.setMemberName(memberName);
		updMember.setMemberPhone(memberPhone);
		updMember.setMemberAddr(memberAddr);
		updMember.setMemberEmail(memberEmail);
		updMember.setMemberNo(memberNo);
		
		MemberService service = new MemberService();
		int result = service.updateMember(updMember);
		
		/*
		 * 문제점) 수정 후, 마이페이지로 이동했을 때 수정 이전의 정보가 화면에 보여짐.
		 *  - 원인은, myPape.jsp에서 세션에 저장된 회원 정보를 출력하는데 우리가 업데이트 해준건 DB에 있는 정보임! 세션은 업데이트되지 않았음.
		 *  
		 * 해결 방법1)
		 * 	- 수정이 잘 되었을 때, 세션에서 회원의 ID와, PW를 추출하여, service에 memberLogin()를 재사용한다.
		 *  - 반환된 Member 객체를 세션에 등록한다. 동일한 loginMember라는 key로
		 *  - 단, 이 방법은 서블릿에서 service에 메소드를 두 개 호출해야 함(updateMember, memberLogin) -> 디자인 패턴에 적절하지 않음.
		 *  
		 * 해결 방법2)
		 *  - 수정이 잘 되었을 때, 세션에 저장된 회원정보를, 사용자가 입력한 정보로 업데이트한다.
		 *  
		 * 해결 방법3)
		 * 	- 수정이 잘 되었을 때, 재 로그인 할 수 있도록 처리.
		 *  - 세션을 파기시키고, 재 로그인을 하면 DB에 있는 정보를 조회하여 세션에 등록하므로, 세션 회원 정보를 변경해주는 작업은 하지 않아도 됨.
		 *  	- 세션 파기 코드 == session.invalidate();
		 *      - 이 코드는 LogoutServlet에 작성되어 있음. 재사용 가능!
		 *        response.sendRedirect("/member/logout");
		 *      단, 재사용 시, 브라우저 상단 URL이 /member/logout로 변경됨.
		 * 
		 * */
		
		//4. 결과 처리
			//4.1 이동할 JSP 페이지 지정
		RequestDispatcher view  = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		
		if(result > 0) {
			
			request.setAttribute("title", "알림");
			request.setAttribute("msg", "회원정보가 수정되었습니다.");
			request.setAttribute("icon", "success");
			request.setAttribute("loc", "/member/myPage");
			
			HttpSession session = request.getSession(false); //세션 있으면 존재하는 세션. 없으면 null 반환
			if(session != null) {
				Member loginMember = (Member) session.getAttribute("loginMember"); //로그인 했을 때, 등록한 회원 정보
				
				//세션 정보 업데이트
				loginMember.setMemberName(memberName);
				loginMember.setMemberPhone(memberPhone);
				loginMember.setMemberAddr(memberAddr);
				loginMember.setMemberEmail(memberEmail);
				
			}
		}else {
			request.setAttribute("title", "알림");
			request.setAttribute("msg", "회원 정보 수정 중, 오류가 발생하였습니다.");
			request.setAttribute("icon", "error");
			request.setAttribute("loc", "/member/myPage");
		}
			//4.2 화면 구현에 필요한 데이터 등록
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
