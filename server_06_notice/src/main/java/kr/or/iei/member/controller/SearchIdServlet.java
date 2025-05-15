package kr.or.iei.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;

/**
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/member/searchId")
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
		//2. 값추출
		String memberEmail = request.getParameter("memberEmail");
		//3. 로직
		MemberService service = new MemberService();
		String memberId = service.searchId(memberEmail);
		//4. 결과처리(비동기)	
		if(memberId != null) { //일치하는 회원 존재
			//ex) 조회된 아이디 : admin1234
			int idLength = memberId.length(); //아이디 길이 : 9
			String first = memberId.substring(0, 2); //ad
			String last = memberId.substring(idLength-2); // 34
			String marker = "*".repeat(idLength-4); // ***** (5개의 별표 생성)
			
			memberId = first + marker + last; //ad*****34
		}
		
		response.getWriter().print(memberId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
