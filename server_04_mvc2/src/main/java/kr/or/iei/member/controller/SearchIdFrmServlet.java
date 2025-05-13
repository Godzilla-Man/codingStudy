package kr.or.iei.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchIdFrmServlet
 */
@WebServlet("/searchIdFrm")
public class SearchIdFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		//2. 값추출 -> pageGb
		String pageGb = request.getParameter("pageGb"); //페이지 구분
		
		//3. 로직 -> X
		
		//4. 결과 처리
		//4.1 이동할 JSP 페이지 경로 지정
		RequestDispatcher view = null; 
		
		if(pageGb.equals("srh")){
			view = request.getRequestDispatcher("/WEB-INF/views/member/searchIdFrm.jsp");
		}else if(pageGb.equals("upd")){
			view = request.getRequestDispatcher("/WEB-INF/views/member/updateIdFrm.jsp");
		}
		//4.2 화면 구현시 필요한 데이터 등록 -> X
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
