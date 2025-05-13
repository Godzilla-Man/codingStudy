package kr.or.iei.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MethodServlet
 */
@WebServlet("/method")
public class MethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MethodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String test = request.getParameter("test");
		System.out.println("test : " + test);
		
		String loginId = request.getParameter("loginId");
		System.out.println("loginId : " + loginId);
		
		String loginPw = request.getParameter("loginPw");
		System.out.println("loginPw : " + loginPw);
		
		int number = Integer.parseInt(request.getParameter("number"));		
		int number2 = Integer.parseInt(request.getParameter("number2"));
		System.out.println("더한 결과 : " + (number + number2));
		
		String hiddenData = request.getParameter("hiddenData");
		System.out.println("hiddenData : " + hiddenData);
		
		String readData = request.getParameter("readData");
		System.out.println("readData : " + readData);
		
		String disableData = request.getParameter("disableData");
		System.out.println("disableData : " + disableData);
		
		String food = request.getParameter("food");
		System.out.println("food : " + food);
		
		String gender = request.getParameter("gender");
		System.out.println("gender : " + gender);
		
		String [] hobbys = request.getParameterValues("hobby");
		for(int i=0; i<hobbys.length; i++) { 
			System.out.println("hobbys : " + hobbys[i]);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
