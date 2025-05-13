package kr.or.iei.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class SearchNameServlet
 */
@WebServlet("/searchName")
public class SearchNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchNameServlet() {
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
		String memberName = request.getParameter("memberName"); // 조회하고자 하는 이름
		System.out.println("memberNAme : " + memberName);
		
		//3. 비지니스 로직 -> 입력받은 이름과 일치하는 회원을 조회
		MemberService service = new MemberService();
		ArrayList<Member> list = service.selectOneMemberName(memberName); // DB 작업에 필요한, 입력값 전달
		
		// Member [] members = new Member [] 길이 지정이 필요 없는 -> ArrayList로 전달 필요
		
		//4. 결과 처리
		//4.1 페이지 형식 및 인코딩 지정
		response.setContentType("text/html; charset=utf-8");
		
		//4.2 클라이언트 요청 응답할 스트림 생성
		PrintWriter out = response.getWriter();
		
		//4.3 응답 HTML 구문 작성
		out.println("<html>");
		out.println("<head>");
			out.println("<title>전체 회원 조회</title>");
		out.println("</head>");
		out.println("<body>");
			out.println("<h1>전체 회원 조회 결과</h1>");
			out.println("<hr>");
							
			out.println("<table border='1'>");
				out.println("<tr>");
					out.println("<th>회원번호</th>");
					out.println("<th>회원아이디</th>");
					out.println("<th>회원비밀번호</th>");
					out.println("<th>회원이름</th>");
					out.println("<th>회원전화번호</th>");
					out.println("<th>회원주소</th>");
					out.println("<th>회원등급</th>");
					out.println("<th>회원가입일</th>");						
				out.println("</tr>");
				for(int i=0; i<list.size(); i++) {
					Member m  = list.get(i);
					out.println("<tr>");
						out.println("<td>" + m.getMemberNo() + "</td>");
						out.println("<td>" + m.getMemberId() + "</td>");
						out.println("<td>" + m.getMemberPw() + "</td>");
						out.println("<td>" + m.getMemberName() + "</td>");
						out.println("<td>" + m.getMemberPhone() + "</td>");
						out.println("<td>" + m.getMemberAddr() + "</td>");							
						switch (m.getMemberLevel()) {
							case 1 : out.println("<td>관리자</td>");
								break;
							case 2 : out.println("<td>정회원</td>");
								break;
							case 3 : out.println("<td>준회원</td>");
								break;		
						}						
						out.println("<td>" + m.getEnrollDate() + "</td>");						
					out.println("</tr>");
				}
			out.println("</table>");
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
