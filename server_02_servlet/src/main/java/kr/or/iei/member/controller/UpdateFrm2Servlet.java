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
 * Servlet implementation class UpdateFrm2
 */
@WebServlet("/updateFrm2")
public class UpdateFrm2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFrm2Servlet() {
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
		Member m = service.selectOneMember(memberId); //service에 있는 selectOneMember의 DB 작업에 필요한, 입력값 전달
		
		//4. 결과 처리
		//4.1 페이지 형식 및 인코딩 지정
		response.setContentType("text/html; charset=utf-8");
		
		//4.2 클라이언트 요청 응답할 스트림 생성
		PrintWriter out = response.getWriter();
		
		//4.3 응답 HTML 구문 작성
		out.println("<html>");
			out.println("<head>");
				out.println("<title>수정 대상 회원 조회</title>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h1>수정할 회원 정보</h1>");
				out.println("<hr>");
				
				if(m == null) {
					out.println("<h3>일치하는 회원이 존재하지 않습니다.</h3>");
				}else {
					out.println("<form action='/UpdateServlet' method='post'>");
					out.println("<input type='hidden' name='memberNo' value='" + m.getMemberNo() + "'>"); // SQL 상에서 특정 데이터 1개만 수정하기 위한 키값 전달
					out.println("<table border=1");
						out.println("<tr><td>아이디(수정X)</td><td>" + m.getMemberId() + "</td></tr>");
						out.println("<tr><td>비밀번호</td><td><input type='password' name='memberPw' value='" + m.getMemberPw() + "'</td></tr>");
						out.println("<tr><td>이름</td><td><input type='text' name='memberName' value='" + m.getMemberName() + "'</td></tr>");
						out.println("<tr><td>주소</td><td><input type='text' name='memberAddr' value='" + m.getMemberAddr() + "'</td></tr>");	
						out.println("<tr><td colspan=2 align='center'><input type='submit' value='수정하기' style='width:300px'></td></tr>");
					out.println("</table>");
					out.println("</form>");
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
