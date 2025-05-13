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
 * Servlet implementation class UpdateForm
 */
@WebServlet("/UpdateServlet")
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
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값 추출
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String memberAddr = request.getParameter("memberAddr");
		
		/* Dao에 작성될 수정 SQL
		 * 
		 * update tbl_member set member_pw = ?, member_name = ?, member_addr = ?
		 * 					 where member_no = ?
		 * 
		 */
		
		String memberNo = request.getParameter("memberNo"); // SQL 상 전체 수정이 아닌 특정 데이터 1개를 수정하기 위한 키값.		
		//3. 비지니스 로직 - 회원 삭제
		Member m = new Member();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setMemberPw(memberPw);
		m.setMemberName(memberName);
		m.setMemberAddr(memberAddr);
		
		MemberService service = new MemberService();
		int result = service.updateMember(m);		
		
		//4. 결과처리
			//4.1 페이지 형식 및 인코딩 지정
		response.setContentType("text/html; charset=utf-8");
			//4.2 응답할 스트림 생성
		PrintWriter out = response.getWriter();
			//4.3 응답 HTML 작성
		out.println("<html>");
			out.println("<head><title>회원 정보 수정 결과</title></head>");
			out.println("<body>");
				out.println("<h1>회원 정보 수정 결과</h1>");
					out.println("<hr>");
					if(result > 0) {
						out.println("<h3>회원 수정 성공</h3>");
					}else {
						out.println("<h3>회원 수정 실패</h3>");
					}
			out.println("</body>");
		out.println("<html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
