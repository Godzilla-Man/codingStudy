package kr.or.iei.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PrintServlet
 */
@WebServlet("/print")
public class PrintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//(1)인코딩
		request.setCharacterEncoding("utf-8");	
	
		
		String name = request.getParameter("name");
		System.out.println("name : " + name);
		
		String age = request.getParameter("age");
		System.out.println("name : " + age);
		
		String addr = request.getParameter("addr");
		System.out.println("name : " + addr);
		
		//name, age, addr을 DB에서 조회한 값이라고 가정하고, HTML을 만들어서 브라우저에 응답
		
		/* 순서)
		 * (1) 페이지 형식 및 인코딩 설정
		 * (2) 요청한 Client와의 연결 통로(스트림) 생성
		 * (3) 응답할 html 구문 작성
		 * */
		
		//(1) 페이지 형식 및 인코딩 설정
		response.setContentType("text/html; charset=UTF-8");
		
		//(2) 요청한 Client와의 연결 통로(스트림) 생성		
		PrintWriter out = response.getWriter();	
		
		//(3) 응답할 HTML 구문 작성
		out.println("<html>");
			out.println("<head>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h1>회원정보</h1>");
				out.println("<hr>");
				out.println("<span>회원 이름 : " + name + "</span><br>");
				out.println("<span>회원 이름 : " + age + "</span><br>");
				out.println("<span>회원 이름 : " + addr + "</span><br>");
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
