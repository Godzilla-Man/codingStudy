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
 * Servlet implementation class InsertMemServlet
 */
@WebServlet("/insertMem")
public class InsertMemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		//2. 값추출
		String insertId = request.getParameter("insertId"); //등록하고자 하는 정보
		String insertPw = request.getParameter("insertPw");
		String insertName = request.getParameter("insertName");
		String insertPhone = request.getParameter("insertPhone");
		String insertAddr = request.getParameter("insertAddr");		
		
		//3. 비지니스 로직 -> 입력받은 정보를 DB에 INSERT
		MemberService service = new MemberService();
		
		Member insMember = new Member();
		insMember.setMemberId(insertId);
		insMember.setMemberPw(insertPw);
		insMember.setMemberName(insertName);
		insMember.setMemberPhone(insertPhone);
		insMember.setMemberAddr(insertAddr);
		
		int result = service.joinMember(insMember);
		
		//4. 결과 처리
			//4.1 페이지 형식 및 인코딩 지정
			response.setContentType("text/html; charset=utf-8");
			//4.2 클라이언트 요청 응답할 스트림 생성
			PrintWriter out = response.getWriter();			
			//4.3 응답 html 구문 작성
			out.println("<html>");
				out.println("<head><title>회원 가입 결과</title></head>");
				out.println("<body>");
					out.println("<h1>회원 가입 결과</h1>");
					out.println("<hr>");
					if(result == -1) {
						out.println("<h3>입력하신 아이디와 중복되는 회원이 이미 존재합니다.</h3>");
					}else if(result == 0) {
						out.println("<h3>회원 가입 중, 오류가 발생하였습니다..</h3>");
					}else {
						out.println("<h3>회원가입이 완료되었습니다.</h3>");
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
