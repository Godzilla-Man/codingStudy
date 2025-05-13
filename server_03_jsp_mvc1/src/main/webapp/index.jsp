<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP (Java Server Page)</h1>
	<pre>
	JSP란, HTML 코드 내에서 자바 언어를 사용할 수 있는 서버측 언어.
	기존 server_02_servlet 프로젝트의 Servlet 파일에서 자바코드로, 응답화면(HTML)을 구현했던 복잡함을 보다 간단하게 해결할 수 있다.
	또한, 자바 언어를 사용할 수 있으므로 동적인 요소 생성이 가능하다.
	
	부가 정보)
	- JSP 파일은 WAS에 상주한다.
	- JSP 파일은 실행 시, 서블릿으로 변환되어 실행된다.	
	</pre>
	
	<hr>
	
	<h2>JSP에서 자바 코드를 기술</h2>
	<pre>
		선언문 : &lt;%! 자바코드 %&gt;
		- 변수와 메소드를 선언하기 위해 사용 => 잘 사용되지는 않음.
		
		스크립틀릿 : &lt;% 자바코드 %&gt;
		- JSP에서 자바 코드를 기술하기 위한, 제일 기본적이 표현법.
		
		표현식(출력식) : &lt;%= 자바코드 %&gt;
		- 자바에서의 값(변수 또는 메소드 반환값)을 화면상에 출력하기 위해 사용. 
	</pre>
	
	<h3><a href='/views/jspTest.jsp'>JSP 테스트 페이지로 이동</a></h3>	
	
	<h2>MVC1 패턴</h2>
	<pre>
		디자인 패턴 : 소프트웨어 개발 시, 자주 발생하는 문제들을 효율적으로 해결하기 위한 '재사용 가능한 설계 템플릿'
		
		- MVC 패턴 : 애플리케이션을 3가지 역할로 분리해서, 역할마다 책임을 나누는 아키텍처 패턴.
			* M : Modle : 데이터, 비지니스 로직
			* V : View  : 사용자 인터네이스(UI) 
			* C : Controller : 클라이언트 요청 및 응답 처리, 흐름 제어
			
		- MVC1 : 기존 servlet_02 프로젝트에서 작성했던 것처럼, servlet에서 비즈니스 로직과 페이지 작업을 같이하니 복잡한 부분을
			     JSP에서 처리하는 패턴. (MVC1 패턴에서는 JSP가 View역할과, Controller 역할을 모두 수행함.)
			     MVC1 패턴은 소규모 프로젝트에 유리.		     		
	</pre>
	
	<!-- 
		전체 회원 조회
		1. DB 작업이 필요한지? -> O
		2. 쿼리 : select * from tbl_member;
		3. 쿼리에 사용자 입력값 필요한지? -> X
		   입력값 필요 시 -> 입력 양식이 있는 JSP로 이동
		   입력값 필요 없다면 -> Controller 요청. (MVC1 패턴에서는 JSP가 View 역할과  Controller 모두 역할을 수행)
   		
	 -->	
	<h3><a href='/views/allMember.jsp'>전체 회원 조회</a></h3>
	
	<!-- 
		아이디로 회원 조회
		1. DB 작업이 필요한지? -> O
		2. 쿼리 : select * from tbl_member where member_id = ?;
		3. 쿼리에 사용자 입력값 필요한지? -> O
			입력값 필요 -> 입력 양식이 있는 JSP로 이동.
			입력값 필요 없다면 -> Controller 요청(JSP)
	 -->
	 <h3><a href='/views/searchIdFrm.jsp'>아이디로 회원 조회 페이지 이동</a></h3>
	 
	 <!-- 
	 	회원 가입
	 	1. DB 작업이 필요한지? -> O
	 	2. 쿼리 : insert into tbl_member values (seq_member.nextval, ?, ?, ?, ?, ?, 3, sysdate);
	 	3. 쿼리에 사용자 입력값 필요한지? -> O
	 	   입력값 필요 -> 입력 양식이 있는 JSP로 이동.
	 	   입력값 필요 없다면 -> Controller 요청(JSP)
	  -->
	  <h3><a href='/views/joinFrm.jsp'>회원가입 페이지 이동</a></h3>
	  
	  <!-- 
	  	회원 삭제
	  	1. DB 작업이 필요한지? -> O
	  	2. 쿼리 : delete from tbl_member where member_no = ?
	  	3. 쿼리에 사용자 입력이 필요한가? -> X (입력이 아니라, 단순 선택!!)
	  	   입력값 필요  -> 입력 양식이 있는 JSP로 이동.
	  	   입력값 필요 없다면 -> Controller 요청(JSP)
	   -->
	   <h3><a href='/views/deleteFrm.jsp'>회원 삭제 페이지 이동</a></h3>
	   
	   
	   <hr>
	   
	   <h2>JSP 내장 객체 종류 및 범위</h2>
	   <pre>
	   	JSP 내장 객체란, 별도의 선언 없이 바로 사용할 수 있는! JSP에서 기본적으로 제공하는 객체.
	   	ex) delete.jsp 최상단에, request는 import 없이 사용이 가능했음!! JSP 내장 객체이기 때문에. 반면에 service는 import 진행 후 사용
	   	
	   	request : HttpServletRequest 참조 변수 (클라이언트 요청 정보를 갖고 있는 객체)
	   	response : HttpServletResponse 참조 변수(요청에 때한 결과를 처리하기 위해 사용)
	   	out : JSPWriter 참조 변수(브라우저에 자바 변수 값 또는 메소드 호출 반환값을 출력하기 위해 사용)
	   	session : HttpSession 참조 변수
	   	application : ServletContext 참조 변수
	   	
	   	-----------------------------------------------------------------
	   	
	   	위 내장 객체 중, 영향을 미치는 범위에 따라 구분이 가능.
	   	page : 1개의 JSP 페이지
	   	request : 1개의 요청. 요청 받은 Servlet or JSP ~ 요청 위힘한 Servlet or JSP
	   	session : 1개의 브라우저. 동일한 브라우저내에서 공유. 브라우저 종료 또는 세션 만료 시 소멸됨.
	   	application : 1개의 애플리케이션. 서버 중지 이전까지 등록된 데이터가 유지됨.
	   </pre>
	   
	   <h3>
	   	<a href='/scopeTest'>스코프 테스트</a>
	   </h3>
	   
	   <hr>
	   
	   <h2>EL</h2>
	   <pre>
	   	EL(Expression Language)의 약자로, JSP 2.0에서 추가된 기술.
	   	
	   	JSP 내장 객체에 등록된 데이터를 화면에 출력할 때, 코드를 간결하게 작성하기 위해 사용된다.
	   	
	   	ex) request에 등록된 데이터를 화면에 출력하고자 할 때 
	   	
	   	* 기존 스크립틀릿과 출력 표현식을 이용하는 방법
	   	
	   	1) &lt;%= request.getAttribute("등록name") %&gt;
	   	2-1) &lt;%
	   		 	String str = (String) request.getAttribute("등록name");
   		 	%&gt;
   		2-2) &lt;%=str%&gt;
   		
   		* EL을 이용하는 방법
   		
   		${등록네임}
   		- 스크립틀릿 & 출력 표현식과 다르게, 추출할 데이터의 key만 작성.
   		- key와 작성하게 되면 범위가 좁은 순서부터 순차적으로 탐색(page -> request -> session -> application)
   		- request, session, application에 등록된 데이터의 자료형이 객체라면!(Member와 같은!)
   		  ${등록name.변수명}과 같이 객체의 변수에 저장된 값을 출력할 수 있음.
   		  
   		  
	   </pre>
	   <h3>	   
	   	<a href='/elTest'>EL 테스트</a>
	   </h3>
	   
	   <!-- ---------------------------------------------------------- -->
	   <!-- 20250424 목 -->
	   
	   <hr>
	   
	   <h2>JSTL</h2>
	   <pre>
	   	JSP에서 자주 사용되거나 공통적으로 사용되는 Java 코드를 쉽고,
	   	간결하게 작성할 수 있도록 태그화 하여 제공하는 라이브러리
	   	
	   	[사용 절차]
	   	1. 다운로드 및 설치
	   		- https://tomcat.apache.org/download-taglibs.cgi 접속
	   		- 하단 jar files에 impl, EL, Spec 다운로드
	   		- webapp/WEB-INF/lib/ 여기에 복사 및 붙여넣기
   		2. 사용 선언 (사용하고자 하는 JSP 마다 상단에 아래 주석에 작성된 코드를 작성해야 함!)
   		<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
   		
   		3. 사용
   		<%-- <c:if test="조건식"> </c:if> --%>   		
	   </pre>
	   
	   <h3>
	   	<a href='/views/jstlTest.jsp'>JSTL 테스트</a>
	   </h3>
	   
	   <hr>
	   
	   <h2>지시어</h2>
	   <pre>
	   	지시어란, JSP 페이지 전체에 영향을 미치는 정보를 작성할 때 사용한다.
	   	
	   	&lt;%@ page|include|taglib 속성="값" 속성="값" %&gt;	   	
	   </pre>
	   
	   <h3>page 지시어</h3>
	   <pre>
	   	page 지시어 : 현재 jsp를 처리하는데 필요한 각종 속성들을 기술하는 부분
	   		- language : 사용할 언어 유형을 지정
	   		- contentType : 클라이언트(브라우저)에 보내는 응답 페이지의 형식, 문자 인코딩 지정.
	   		- pageEncoding : 서버에서 JSP를 읽고 처리할 때의 인코딩 지정 방식
	   		- import : 자바의 import와 같은 의미
	   </pre>
	   <h3>include 지시어</h3>
	   <pre>
	   	include 지시어 : 현재 JSP에, 또 다른 JSP를 포함시키고자 할 때 사용하는 지시어
	   		- file : 포함하고자 하는 JSP 파일의 경로
	   </pre>
	   <%@ include file="/views/includeTest.jsp" %>
	   <button id="testBtn">버튼</button>
	   <script>
		document.getElementById("testBtn").onclick = function(){
			test();
		}
	   </script>	   
	   <h3>taglib 지시어</h3>
	   <pre>
	   	taglib 지시어 : JSP 기능을 좀 더 확장시킬 수 있는, 추가적인 라이브러리를 등록할 떄 사용하는 지시어
	   </pre>
</body>
</html>