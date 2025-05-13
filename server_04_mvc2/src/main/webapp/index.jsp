<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>04_MVC2</h1>
	<pre>
		MVC1의 단점
			- 유지보수의 어려움 : MVC1 패턴에서는 JSP가 Controller(요청 처리 및 비지니스 로직) 역할과, View (사용자 인터페이스) 역할을 같이 수행함으로써,
							 코드가 복잡해지고, 수정하거나 확장하는 작업에 어려움이 존재.
		    - 재사용성 부족 : 비지니스 로직이 여러 JSP에 중복되어 작성되는 경우가 많아, 코드의 재사용성이 낮음.
	    MVC2
	    	- JSP는 오직 View 역할만을 담당하고, 서블릿이 Controller 역할을 담당하고, 데이터 처리는 Model 담당하는 디자인 패턴
	</pre>
	
	<hr>
	
	<%--
	1. 전체 회원 조회
		- DB 작업이 필요한가? -> O
		- 쿼리 : select * from tbl_member
		- 쿼리에 사용자 입력값이 필요한가? -> X
			- 필요하다면, 입력 양식 페이지로 이동(JSP)
			- 필요없다면, Controller에 요청(Servlet)
	 --%>
	 <h3>
	 	<a href='/allMember?pageGb=sel'>전체 회원 조회</a>
	 </h3>
	 
	 <%--
	 2. 아이디로 회원 조회
	 	- DB 작업 필요? -> O
	 	- 쿼리 : select * from tbl_member where member_id = ?
	 	- 쿼리에 사용자 입력값이 필요한가? -> O
	 		- 필요하다면, 입력 양식 페이지로 이동(JSP)
	 		- 필요없다면, Controller에 요청(Servlet)
	  --%>
	  <h3>
	  	<a href='/searchIdFrm?pageGb=srh'>아이디로 회원 조회</a>
	  </h3>
	  
	 <%--
	 3. 회원 가입
	 	- DB 작업 필요? -> O
	 	- 쿼리 : insert into tbl_member values (seq_member.nextval,? ,? ,? ,? ,?, 3, SYSDATE) 
	 	- 쿼리에 사용자 입력값이 필요한가? -> O
	  		- 필요하다면, 입력 양식 페이지로 이동(JSP)
	  		- 필요없다면, Controller에 요청(Servlet)
  		- 회원 가입 성공 시 -> allMember.jsp로 이동하여, 가입된 회원까지 출력
  		- 회원 가입 실패 시 -> insertFail.jsp로 이동하여 실패 메시지 출력	 
	  --%> 
	  <h3>
	  	<a href='/joinFrm'>회원가입</a>
	  </h3> 
	  
	  <%--
	  4. 회원 삭제
	  	- DB 작업 필요? -> O
	  	- 쿼리 : delete from tbl_member where member_no = ?
	  	- 쿼리에 사용자 입력값이 필요한가? -> X
	  		전체회원조회 -> 테이블 형식으로 전체 회원 리스트를 출력하며, 첫번 쨰 열에 삭제 A 태그 생성 -> A태그 클릭 시 DB에서 삭제
	   --%>
	   <h3>
	   	<a href='/allMember?pageGb=del'>회원 삭제</a>
	   </h3>
	   
   	  <%--
   	  5. 회원 수정(실습)
   	  
   	  수정 대상 정보 : 비밀번호, 이름, 주소
   	  
   	  1. 사용자에게 수정할 아이디를 입력받기
   	  2. 입력받은 아이디와 일치하는 회원
   	  	-> 존재 : 수정 입력 양식이 있는 updateFrm.jsp
   	  		-> 비밀번호, 이름, 주소 수정 정보 입력받아 수정 처리
   	  		-> 수정 정상 처리 -> 수정된 회원 정보 출력
   	  		-> 수정 실패 시 -> updateFail.jsp로 이동하여 "수정 실패" 메시지 출력
   	  	-> 존재X : searchIdFail.jsp로 이동하여 "대상 회원이 존재하지 않습니다" 출력 	  
 	  --%>
 	  <h3>
 	  	<a href='/searchIdFrm?pageGb=upd'>회원 수정</a>
 	  </h3>
	 
</body>
</html>