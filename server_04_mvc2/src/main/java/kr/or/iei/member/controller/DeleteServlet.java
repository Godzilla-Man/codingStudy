package kr.or.iei.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
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
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		//3. 로직 - 회원 삭제
		MemberService service = new MemberService();
		int result = service.deleteMember(memberNo);
		
		
		//4. 결과 처리
			//4.1 이동할 jsp 페이지 경로 설정
		RequestDispatcher view = null;
		
		if(result > 0) {
			view = request.getRequestDispatcher("/WEB-INF/views/member/deleteSuccess.jsp");
		}else {
			view = request.getRequestDispatcher("/WEB-INF/views/member/deleteFail.jsp");
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
