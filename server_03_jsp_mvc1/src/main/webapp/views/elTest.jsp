<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL 테스트 페이지</h1>
	
	<hr>
	
	<h3>스크립틀릿과 출력 표현식을 이용하여 스코프별 데이터 출력하기</h3>
	
	<h4>reqData : <%=request.getAttribute("reqData") %></h4>
	<h4>sesData : <%=session.getAttribute("sesData") %></h4>
	<h4>appData : <%=application.getAttribute("appData") %></h4>
	
	<hr>
	
	<h3>EL을 사용하여 스코프별 데이터 출력하기</h3>
	
	<%--
	범위가 좁은 스코프부터 순차적으로 탐색한다.
	page -> request -> session -> application
	 --%>
	<h4>reqData : ${reqData}</h4>
	<h4>sesData : ${sesData}</h4>
	<h4>appData : ${appData}</h4>
	
	<h3>동일한 명칭으로 다른 스코프에 등록된 데이터 출력하기</h3>
	
	<h4>${sameKey}</h4><!-- 범위가 좁은 순서대로 탐색하고, 찾으면 출력하고 멈춤. request에 등록된 데이터가 출력됨. -->
	<h4>${sessionScope.sameKey}</h4><!-- 앞에 스코프를 명시적으로 작성하여 session에 등록된 데이터 출력. -->
	
	<h3>스코프에 등록된 Member 객체의 변수 값 출력하기</h3>
	
	<h4>아이디 : ${requestScope.member.memberId}</h4> <!--  request 스코프를 명시적으로 작성할 수 있음. --> 
	<h4>비밀번호 : ${member.memberPw}</h4>
	<h4>이름 : ${member.memberName}</h4>
	
	<hr>
	
	<h3>EL 연산자</h3>
	<pre>
		Java		EL
		---------------
		+,-			+,-
		*,/			*,div
		%			mod
		&&,||		and,or
		!			not
		<			lt
		>			gt
		<=			le
		>=			ge
		==			eq
		!=			ne
		null		empty				
	</pre>
	
	<br>
	
	<span>3 + 5 : ${3 + 5}</span> <br>
	<span>5 div 2 : ${5 div 2 }</span> <br>
	<span>10 mod 3 : ${10 mod 3}</span> <br>
	<span>true and false : ${true and false}</span> <br>
	<span>not false : ${not false}</span> <br>
	<span>4 lt 2 : ${4 lt 2}</span> <br>
	<span>3 le 4 : ${3 le 4}</span> <br>
	<span>10 eq 5 : ${10 eq 5}</span> <br>
	
	<% ArrayList<Integer> list = null; %>
	<span>list : ${list}</span> <br> <!-- EL 사용하여 없는 데이터 출력하면 null이 아니라, 빈문자열 출력됨. -->
	<span>empty list : ${empty list}</span> <br>
	<span>is null list : <%= list == null %></span>	<Br>
	
	<% list = new ArrayList<Integer>(); %> <!--  리스트 객체화 -->
	<span>list : ${list}</span> <Br>
	<span>empty list : ${empty list}</span> <br>
	<span>is null list : <%= list == null %></span>	<Br>
	
		
</body>
</html>