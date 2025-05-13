package kr.or.iei;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class ELTestServlet
 */
@WebServlet("/elTest")
public class ELTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ELTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request, session, application에 각각 데이터 등록
		request.setAttribute("reqData", "reqTestData");
		
		HttpSession session = request.getSession();
		session.setAttribute("sesData",  "sesTestData");
		
		ServletContext application = request.getServletContext();
		application.setAttribute("appData", "appTestData");
		
		//동일한 명칭으로 서로 다른 스코프에 데이터 등록.
		request.setAttribute("sameKey", "requestData");
		session.setAttribute("sameKey",  "sessionData");
		
		//스코프에 객체 데이터 등록
		Member m = new Member();
		m.setMemberId("qowo0420");
		m.setMemberPw("1234");
		m.setMemberName("배재현");
		
		request.setAttribute("member", m);
		
		
		
		//페이지 이동
		request.getRequestDispatcher("/views/elTest.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
