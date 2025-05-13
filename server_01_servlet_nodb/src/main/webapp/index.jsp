<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello JSP!!!</h1>
	
	<pre>
	클라이언트 : 데이터나 자원을 요청하는 사용자
	서버 : 클라이언트의 요청을 받아, 데이터나 자원을 공유해주는 컴퓨터
	--------------------------------------------------
	웹 애플리케이션 서비스에서 사용되는 서버의 종류
	- WebServer : 이미 만들어져 있는 정적인 데이터(HTML, JPG, PNG)를 클라이언트에 응답해주는 역할
	- WAS(Web Application Server) : 동적인 데이터 (서버에 저장된 파일, DataBase에 존재하는 데이터)를 클라이언트에 응답해주기 위한 역할
	
	웹 서비스 통신 흐름
	(1) 사용자가 클라이언트 프로그램인 크롬을 이용하여, 페이지(HTML) 요청.
	(2) 클라이언트 요청을 WebServer가 수신.
		- 이 때, 동적인 데이터 필요없이 WebServer에 배포된 HTML 파일을 응답해줘도 된다면, 클라이언트에게 HTML 파일 응답.
		- 이 때, 동적인 데이터 (서버 or DB)를 가지고 HTML 파일을 만들어서 클라이언트에게 응답해야 한다면 (3)
	(3) WebServer는 WAS(Web Application Server)에게 클라이언트 요청을 위임.
	(4)	WAS는 서버 데이터를 WebServer에게 응답. 만약 DB 데이터가 필요하다면 DB와 연결 - 요청 - 응답받음.
	(5) WAS는 필요한 데이터를 WebServer에 응답.
	(6) WebServer는 응답받은 데이터를 가지고 HTML 생성하여, 클라이언트(크롬)에게 응답.
	(7) 응답받은 HTML 파일을 크롬에서 사용자가 눈으로 확인
	
	- 실제 HTML, JPG, PNG와 같은 정적 파일들은 WebServer의 특정 경로에 배포되어 실행됨.
	- JSP, .JAVA와 같은 동적 처리를 담당하는 파일은 WAS의 특정 경로에 배포되어 실행됨.
	-------------------------------------------------
	금융권, 대기업과 같은 대규모 회사에서는 보통 WebServer와 WAS를 1대씩 설치하지 않음. (서버 다운 시, 리스크 감수해야 함..)
	WebServer 여러개, WAS 여러개 설치하고 사용자 요청을 수행하는 서버의 과부하를 막기위해서 사용되는 기술 == 로드밸런싱
	Apache WebServer 기준으로, 로드밸런싱 설정은 workers.properties 파일에 설정함.
	
	정상적으로 로그인이 되면, 세션(Session)이라는 특정 공간에 회원 정보를 등록해놓음. ==> 얘는 수업 때 할거임.
	정상 로그인 이후, 다른 HTML 페이지에서 로그인 회원 정보를 가져다가 쓸 수 있음. ==> 얘도 할거임.
	
	위에서 여러대의 WAS를 설치한다고 했는데, 내가 세션 정보를 WAS 1번기에 저장해놨다면? 그리고 WAS 1호기가 다운됐다면?
	그래도 사용자는 WAS 2번기, WAS 3번기에 요청 및 응답을 처리할 수 있음.. 이 때 WAS간의 세션 정보를 클러스터링 하는데, 이 기술을 == 세션 클러스터링이라고 함.
	
	-------------------------------------------------
	Servlet(서블릿) : Java 언어를 이용하여, 클라이언트의 요청을 받아서 처리하고, 결과를 다시 클라이언트에게 전송하는 Class 파일
		- 클라이언트 요청을 받아서 처리하기 위해, 요청 url을 상단 WebServlet의 urlPatterns 속성에 작성.
		- doGet() : 클라이언트가 GET 요청을 했을 때, 호출되는 메소드
		- doPost() : 클라이언트가 POST 요청을 했을 때, 호출되는 메소드
		* doPost() 메소드 내부에, doGet 메소드를 호출하는 코드가 기본적으로 작성되어 있는 이유.
		  GET과 POST는 단순히 데이터를 전송하는 방식의 차이다. 서버에서 클라이언트 전송 데이터를 받아서 처리하는 로직은
		  한군데에서 처리할 수 있또록, doPost 내부에 doGet 메소드를 호출하는 코드가 작성되어 있는 것.
		  
	 	- 우리가 Java 시간 때, 순수 'Java Project'를 만들고 해당 프로젝트를 실행할 때에는 단순히 실행 클래스 안에 있는 public static void main(String [] args){} 를 실행시키면 되었음.
	 	  이때, 다른 파일에 존재하는 메소드를 호출하기 위해 3가지 단계를 거쳤다. (1. import, 2. 객체 생성, 3. 객체명.호출메소드명();)
	 	  서블릿 파일의 doGet() 또는 doPost()를 호출하기 위해서는 서블릿 파일내 클래스의 객체 생성이 사전에 되어야 함. ==> 누가 해주나? ==> WAS 내부에 있는 서블릿 컨테이너가 해줌.
	 	  
	 	- 서블릿 컨테이너 : WAS 내부에 상주하며, 서블릿들의 생명주기를 담당한다. (생명주기 : 생성 ~ 소멸까지 전체의 처리를 의미.)  
	
	--------------------------------------------------
	EX) form 태그를 만들어서 서블릿에 요청하기.
	
	xxxx.jsp OR xxxx.html
	<!-- 
	
	<form action='/test' method='get'>
		입력 : <input type='text' name='param'> <br>
		<input type='submit' value='요청하기'>		
	</form>
	
	 -->
	 
	 xxxx.java (서블릿파일)
	 
	 @WebServlet("/test")	==> action 속성 값과 동일.
	 public class xxxx ~~{
	 	
	 	do Get 메소드{	==> method 속성에 'get'으로 작성되어 doGet 메소드가 호출됨.
	 		String data = request.getParameter("param") ==> 사용자가 입력한 값 추출. input의 name 속성 값을 매개변수로 전달하면, 값을 문자열 형태로 반환.	 	
	 	}
 	}
 		
	----------------------------------------------------
	
	- 아래 작성되어 있는 GET과 POST는 단순히 데이터를 서버로 전송하는 방식의 차이일 뿐이다.
	  보안에 대한 특징을 읽어보면, GET보다 POST방식이 상대적으로 보안성이 우수하다라고 작성되어 있는데
	  POST로 데이터를 전송한다고 해서, 전송 데이터가 안전하게 암호화되어 전송되는 것은 아니다!!!!!!!
	  
	  만약, 전송되는 데이터를 안전하게 암호화하여 해커의 공격을 피하고 싶다면, SSL이라는 인증서를 설치해야 한다.
	  SSL 인증서는 발급 업체로부터 돈을 내고, 인증서 파일을 받아볼 수 있으며 WAS의 서버 설정 파일에
	  해당 SSL 인증서의 경로를 작성하여 등록할 수 있다.
	  
  	-----------------------------------------------------
  	
  	- Dynamic Web Project 생성 시, 마지막 단계에서 "Generate web.xml 뭐시기~~" 체크박스를 체크하면
  	  WEB-INF 폴더 하위에 web.xml 파일이 생성된다 이 파일을 "배포 서술자"라고 얘기하며,
  	  현재 프로젝트에 대한 설정 정보를 작성하는데 이용된다.
  	  설치한 WAS(아파치톰캣)에 등록된 프로젝트를 실행하면, 가장 먼저 읽어들이는 파일이다.
  	  이 web.xml 파일에는 필터, 리스너, 서블릿 매핑정보 등을 작성할 수 있다.
	</pre>
	
	<hr>
	
	<h3>GET과 POST</h3>
	
	<pre>
		GET : 서버에 데이터 전송 시, URL 뒤에 붙여 전송하는 방식
			- URL 길이에 제약이 있다.
			- URL에 데이터가 노출되므로, 상대적으로 보안에 취약하다.
		POST : 서버에 데이터 전송 시, Http Body에 데이터를 실어서 전송하는 방식
			- 데이터 길이에 제약이 없다.
			- GET 방식보다 상대적으로 보안성이 우수하다.
	</pre>
	
	<form action="/index" method="get">
		<input type="submit" value="Servelet에 GET 방식으로 요청">
	</form>
	
	<form action="/index" method="post">
		<input type="submit" value="Servelet에 POST 방식으로 요청">
	</form>
	<form action="/index">
		<input type="submit" value="Servlet에 method 속성 작성 안하고 요청">
	</form>
	
	<hr>
	
	<h3>HttpServletRequest, HttpServeltResponse</h3>
	<pre>
		HttpServletRequest : 클라이언트가 Http 요청 시, 요청 정보를 담고 있는 객체
			- 요청 데이터(파라미터), 요청 방식(get, post)....
		HttpServletResponse : 클라이언트 요청에 대한 처리 결과를 작성하기 위하여 사용되는 객체
			- 응답 데이터 작성, 응답 Http 상태 코드, 다른 서블릿(URL)로 리다이렉트....		
	</pre>
	
	<form action="/method" mehtod="get">
		텍스트 입력 : <input type="text" name="test"> <br>
		아이디 : <input type="text" name="loginId"> <br>
		비밀번호 : <input type="password" name="loginPw"> <br>		
		숫자입력1 : <input type="number" name="number"> <br>
		숫자입력2 : <input type="number" name="number2"> <br>
		히든데이터 : <input type="hidden" name="hiddenData" value="Hello"> <br>
		readOnly : <input type="text" name="readData" value="readData" readonly> <br>
		disable : <input type="text" name="disableData" value="disableData" disabled> <br>		
		
		제일 좋아하는 음식은?
		<select name="food">>
			<option value="pizza">피자</option>
			<option value="chieken">치킨</option>
			<option value="potato">감튀</option>			
		</select>		
		
		<br>
		성별 선택 :
		<input type="radio" name="gender" value="M"> 남자
		<input type="radio" name="gender" value="W"> 여자 
		
		<br>
		
		당신의 취미는?
		<input type="checkbox" name="hobby" value="basketball"> 농구
		<input type="checkbox" name="hobby" value="baseball"> 야구 
		<input type="checkbox" name="hobby" value="health"> 헬스 
		<input type="checkbox" name="hobby" value="crossfit"> 크로스핏  
				
		<input type="submit" value="요청">
	</form>
	
	<hr><br>
	
	<form action="/print" method="post">
		이름 : <input type="text" name="name"> <br>
		나이 : <input type="text" name="age"> <br>
		주소 : <input type="text" name="addr"> <br>
		<input type="submit" value="요청">		
	</form>
	
	<br><hr>
	
	<!-- 
	실습)
	
	사용자에게 이름을 입력받아 서블릿으로 요청(post).
	서블릿에서는 입력한 이름과 일치하는 회원 정보를 보여줄 html을 생성하여 응답.
	단, DB 연결없이 진행하므로, 서블릿 생성자를 통해 회원 정보 5명을 저장한 ArrayList<User>를 생성해 놓기
	 
	서블릿 메소드에서는 입력받은 이름과 일치하는 회원이 존재하는지 찾고, 
	존재하면 회원 정보(이름, 나이, 주소)를 보여줄 html을 생성하여 응답하고,
	존재하지 않으면, 존재하지 않습니다라는 문구를 보여줄 html을 생성하여 응답	
	--> 
	
	<form action="/exam" method="post">
		<h3>실습문제</h3>
		조회할 이름 입력 : <input type="text" name="name"> <br>	
		<input type="submit" value="조회">
	</form>
	
	<br><br>
	
</body>
</html>