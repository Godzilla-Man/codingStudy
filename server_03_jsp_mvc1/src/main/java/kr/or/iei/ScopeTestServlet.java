package kr.or.iei;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ScopeTestServlet
 */
@WebServlet("/scopeTest")
public class ScopeTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScopeTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 이 서블릿 파일은 클라이언트 요청에 의한 비지니스 로직 처리를 위해 생성한 것이 아니고,
		 * 아래 코드에서 request, session, application에 등록한 데이터의 범위를 확인하기 위한 테스트 용도 파일임.
		 * 
		 */
		
		// (1) HttpServletRequest 참조 변수에 데이터 등록
		request.setAttribute("reqData", "reqTestData"); //reqData라는 이름으로, String 데이터 등록
		
		// (2) HttpSession 참조 변수에 데이터 등록
		HttpSession session = request.getSession(); //세션 정보 획득
		session.setAttribute("sesData", "sesTestData"); //sesData라는 이름으로 String 데이터 등록		
		
		// (3)ServletContext 참조 변수에 데이터 등록 
		ServletContext application = request.getServletContext();
		application.setAttribute("appData", "appTestData"); //appData라는 이름으로, String 데이터 등록
		
		//페이지 이동 (아직 다뤄보지 않았지만, jsp 페이지로 이동하는 코드)
		request.getRequestDispatcher("/views/scopeTest1.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
