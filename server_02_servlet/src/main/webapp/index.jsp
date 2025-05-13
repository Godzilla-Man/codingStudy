<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>server_02</h1>
	
	<hr>
	
	<!-- (1) 전체 회원 조회
			- DB 작업이 필요한가? => O
			- 필요하다면 작성될 쿼리 : select * from tbl_member;
			- 쿼리에 사용자 입력값이 필요한가?
				-> 입력값이 필요하다면, 입력 양식이 존재하는 페이지로 이동
				-> 입력값이 필요없다면, Servlet에 요청   
	-->
	<h3>
		<a href='/allMember'>전체 회원 조회</a>
	</h3>
	
	
	<!-- (2) 아이디로 회원 조회
			- DB 작업이 필요한가? => O
			- 필요하다면 작성될 쿼리 : select * from tbl_member where member_id = 입력값;
			- 쿼리에 사용자 입력값이 필요한가? -> O
				-> 입력값이 필요하다면, 입력 양식이 존재하는 페이지로 이동
				-> 입력값이 필요없다면, Servlet에 요청 		
	 -->
	 <h3>
	 	<a href='/views/member/searchIdFrm.jsp'>회원 아이디로 조회</a>
	 </h3>
	 
	 
	 <!-- (3) 회원 이름으로 조회(포함)
	 		- DB 작업이 필요한가? => O	
	 		- select * from tbl_member where member_name like '%' || 입력값(위치홀더) || '%';
	 		- 쿼리에 사용자 입력값 필요? 		 
	 		 -> 입력값이 필요하다면, 입력 양식이 존재하는 페이지로 이동
	 		 -> 입력값이 필요없다면, Servlet에 요청	 
	  -->
	 <h3>
	 	<a href='/views/member/searchNameFrm.jsp'>회원 이름으로 조회</a>
	 </h3>	 
	 
	 
 	 <!-- (4) 신규 회원 가입
 	 		- DB 작업 -> O
 	 		- 쿼리 : insert into tbl_member values (seq_member.nextval, ?, ?, ?, ?, ?, 3, SYSDATE);
 	 		- 쿼리에 사용자 입력값 필요? -> O
 		     -> 입력값이 필요하다면, 입력 양식이 존재하는 페이지로 이동
	 		 -> 입력값이 필요없다면, Servlet에 요청 
 	  -->
	 <h3>
	 	<a href='/views/member/insertMemFrm.jsp'>신규 회원 가입</a>
	 </h3>	 
	 
	 <!-- (5) 회원삭제
	 		- 프로세스 : 모든 회원 조회 -> 화면에 모든 회원 정보를 테이블로 표기(첫번 째 열에 삭제 a 태그) -> a 태그를 클릭하면 해당 행의 회원 정보 DB에서 삭제
	 							  -> a 태그를 클릭하면 해당 행의 회원 정보 DB에서 삭제	 		
	  -->
	  <h3>
	  	<a href='/deleteMember'>기존 회원 삭제</a>
	  </h3> 
	  
  	<!-- (6) 회원 정보 수정 
  			
  			- 아래 a 태그 클릭 => 서블릿에서 전체 회원 조회
  			- 전체 회원 정보 표기 시, 첫번 째 열에 '수정' a 태그를 생성
  			- 수정 a 태그 클릭 => 서블릿(UpdateFrm2Servlet.java)에서 해당 회원 정보 조회(아이디로 회원 조회 메소드 재사용)
  			  조회 후, '비밀번호', '이름', '주소'를 수정할 수 있는 form 태그 제작.
 		    - form 태그 내에 submit 버튼 클릭 => 서블릿(UpdateServlet.java)에서 해당 회원에 대한 정보 수정  			 
  			
  	-->
  	
  	<h3>
  		<a href='/updateFrm1'>회원정보수정</a>
  	</h3>
	 
</body>
</html>