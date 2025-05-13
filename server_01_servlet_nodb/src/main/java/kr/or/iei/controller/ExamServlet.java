package kr.or.iei.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.model.vo.User;

/**
 * Servlet implementation class User
 */
@WebServlet("/exam")
public class ExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ArrayList<User> userList; // User 배열 추가!!
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExamServlet() {
        super();
        userList = new ArrayList<User>();
        userList.add(new User("배재현", 10, "경기 부천"));
        userList.add(new User("카리나", 20, "서울 동작"));
        userList.add(new User("윈터", 10, "부산 연수"));
        userList.add(new User("닝닝", 10, "강원 춘천"));
        userList.add(new User("디젤", 10, "충청 아산"));        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		//2. 값 추출
		String name = request.getParameter("name");
		
		//3. 비지니스 로직
		User findUser = null;
		for(int i=0; i<userList.size(); i++) {
			User equalUser = userList.get(i); //비교 대상 User 객체
			String equalUserName = equalUser.getName(); //비교 대상 User 객체의 이름(배재현, 카리나, 윈터, 닝닝, 디젤)
			
			//사용자가 입력한 이름과, 객체에서 추출한 이름이 같은지 다른지 비교
			if(name.equals(equalUserName)) {
				//위 equals()의 결과로 true가 반환되었다라는 의미를 가짐 == 일치하는 회원 찾음.
				findUser = equalUser;
				break;
			}
		}
		
		//4. 결과 처리
		//4.1 페이지 형식 지정 및 인코딩 설정
		response.setContentType("text/html; charset=UTF-8");
		
		//4.2 요청한 Client와의 연결 통로(스트림) 생성
		PrintWriter out = response.getWriter();
		
		//4.3 응답할 html 구문 작성
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
			out.println("<h1>회원정보 조회 결과</h1>");
			out.println("<hr>");
			if(findUser == null) {
				out.println("<h3>입력한 이름과 일치하는 회원이 존재하지 않습니다.</h3>");
			}else {
				out.println("<h3>이름 : " + findUser.getName() + "</h3><br>");
				out.println("<h3>나이 : " + findUser.getAge() + "</h3><br>");
				out.println("<h3>주소 : " + findUser.getAddr() + "</h3><br>");				
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
