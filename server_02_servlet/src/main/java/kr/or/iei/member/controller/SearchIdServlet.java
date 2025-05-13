package kr.or.iei.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/searchId") // jsp 파일에 있는 액션이름과 똑같이 맞춰 주기
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		//2. 값 추출
		String memberId = request.getParameter("memberId"); //(조회하고자 하는 아이디)
		
		//3. 비지니스 로직 -> 입력받은 아이디와 일치하는 회원을 조회
		MemberService service = new MemberService();
		Member m = service.selectOneMember(memberId); //DB 작업에 필요한, 입력값 전달
		
		//4. 결과 처리
		//4.1 페이지 형식 및 인코딩 지정
		response.setContentType("text/html; charset=utf-8");
		
		//4.2 클라이언트 요청 응답할 스트림 생성
		PrintWriter out = response.getWriter();
		
		//4.3 응답 HTML 구문 작성
		out.println("<html>");
			out.println("<head>");
				out.println("<title>아이디로 회원 조회</title>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h1>아이디로 회원 조회 결과");
				out.println("<hr>");
				
				if(m == null) {
					out.println("<h3>일치하는 회원이 존재하지 않습니다.");
				}else {
					out.println("<ul>");
						out.println("<li>회원 번호 : " + m.getMemberNo() + "</li>");
						out.println("<li>회원 아이디 : " + m.getMemberId() + "</li>");
						out.println("<li>회원 비밀번호 : " + m.getMemberPw() + "</li>");
						out.println("<li>회원 이름 : " + m.getMemberName() + "</li>");
						out.println("<li>회원 전화번호 : " + m.getMemberPhone() + "</li>");
						out.println("<li>회원 주소 : " + m.getMemberAddr() + "</li>");
						if(m.getMemberLevel() == 1) {
							out.println("<li>회원등급 : 관리자</li>");
						}else if(m.getMemberLevel() == 2) {
							out.println("<li>회원등급 : 정회원</li>");
						}else {
							out.println("<li>회원등급 : 준회원</li>");
						}
						out.println("<li>회원가입일 : " + m.getEnrollDate() + "</li>");			
					out.println("<ul>");
				}				
			out.println("</body>");
		out.println("</html>");		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
