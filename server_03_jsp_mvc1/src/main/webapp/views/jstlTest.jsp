<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL 테스트 페이지</h1>
	
	<hr>
	
	<h3>1. 변수</h3>
	<pre>
		* 선언
		- c:set 태그를 이용하여 선언 및 등록할 수 있다.
		- 내장 객체(page, request, session, application)에 데이터를 등록하는 태그
		- c:set 태그의 속성으로는 var(변수명), value(값), scope(범위)
	</pre>
	
	<c:set var="num" value="100" /> <!-- page 내장 객체에 데이터가 등록된다. -->
	<c:set var="num" value="200" scope="request" />
	
	${num} <!-- page에서 먼저 찾아서 100임 request보다 범위가 좁기 떄문에 --> <br>
	
	<%-- 범위가 좁은 내장 객체부터 순차적으로 탐색함. 명시적으로 스코프 작성 가능 --%>
	${num} + ${requestScope.num} = ${num + requestScope.num}
	
	<pre>
		* 삭제
		- c:remove 태그를 이용하여 내장 객체에 등록된 데이터 삭제
		- 변수 선언 시, var 속성에 작성한 명칭으로 삭제
		- c:remove 태그의 속성으로는 var(삭제할 변수명), scope(범위)
		- c:remove를 사용하는데 scope 속성을 작성하지 않으면, 모든 내장 객체에서 일치하는 변수 데이터를 삭제한다.
	</pre>
	
	<c:set var="num" value="300" scope="session" />
	
	page에 등록된 num : ${num} <br>
	request에 등록된 num : ${requestScope.num} <br>
	session에 등록된 num : ${sessionScope.num} <br>
	
	<br>
	
	request에 등록된 num을 삭제 <br>
	<c:remove var="num" scope="request" />
	<hr>
	
	page에 등록된 num : ${num} <br>
	request에 등록된 num : ${requestScope.num} <br>
	session에 등록된 num : ${sessionScope.num} <br>
	
	<br>
	
	모든 스코프에 등록된 num을 삭제 <br>
	<c:remove var="num" />
	<hr>
	page에 등록된 num : ${num} <br>
	request에 등록된 num : ${requestScope.num} <br>
	session에 등록된 num : ${sessionScope.num} <br>
	
	<br>
	
	<h3>2. 조건문 - if</h3>
	<pre>
		- c:if 태그를 사용하여 작성이 가능하다.
		- if문만 작성 가능하고, else문은 불가능.
		- c:if 태그의 속성으로는 test(조건식)을 가지며, EL로 작성.
	</pre>	
	
	<!--  page 스코프에, num1과 num2 등록 -->
	<c:set var="num1" value="10" />
	<c:set var="num2" value="20" />
	
	<c:if test="${num1 > num2}">
		<h4>num1이 num2보다 큽니다.</h4>
	</c:if>	
	<c:if test="${num1 < num2}">
		<h4>num2가 num1보다 큽니다.</h4>
	</c:if>
	<c:if test="${num1 eq num2}">
		<h4>num1과 num2가 같습니다.</h4>
	</c:if>	
	
	<br>
	
	<h3>3. 조건문 - choose ~ when ~ otherwise</h3>
	<pre>
		- c:choose, c:when, c:otherwise 태그를 사용하여 작성한다.
		- c:if와 동일하게 test 속성에 조건식을 작성하고, test 속성은 c:when 태그에 작성.
		- java의 switch, Oracle의 case ~ when 문과 유사하다.
	</pre>
	
	<c:set var="num3" value="10" />
	
	<c:choose>
		<c:when test="${num3 > 10}">
			<h4>num3은 10보다 큽니다.</h4>
		</c:when>
		<c:when test="${num3 < 10}">
			<h4>num3은 10보다 작습니다.</h4>
		</c:when>
		<c:otherwise>
			<h4>num3은 10입니다.</h4>
		</c:otherwise>		
	</c:choose>
	
	<br>
	
	<h3>4. 반복문</h3>
	<pre>
		- c:forEach 태그를 이용하여 작성한다.
		- c:forEach 태그의 속성으로는 var(현재 반복 회차를 저장할 변수),
								 begin(시작값),
								 end(종료값),
								 step(반복시마다 증감할 값[기본값 1]),
								 items(반복 접근할 객체)
								 varStatus(부가적인 기능)
	</pre>
	
	<c:forEach var="i" begin="1" end="6" step="1">
		<h${i}> ${i}번째 반복중입니다..</h${i}>
	</c:forEach>
	
	<table border='1'>
		<c:forEach var="i" begin="1" end="10" step="1" varStatus="vs">
			<tr>
				<th>${i}</th>
				<td>${i}번째 게시글입니다.</td>
				<td>vs-index : ${vs.index}</td>
				<td>vs-count : ${vs.count}</td>
				<td>vs-first : ${vs.first}</td>
				<td>vs-last : ${vs.last}</td> 
			</tr>
		</c:forEach>
	</table>
	
	<br>
	
	<%
	//DB에서 조회한 회원 리스트 화면에 JSTL을 이용하여 출력하기
	ArrayList<Member> list = new ArrayList<Member>();
	list.add(new Member(1, "userr01", "1234", "유저1", "010-1234-1354", "부천", 1, "2025-04-24"));
	list.add(new Member(2, "userr02", "1234", "유저2", "010-1234-1354", "서울", 2, "2025-04-21"));
	list.add(new Member(3, "userr03", "1234", "유저3", "010-1234-1354", "부산", 3, "2025-04-22"));
	%>
	
	<table border='1'>
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>등급</th>
			<th>가입일</th>
		</tr>
		<c:forEach var="m" items="<%=list%>">
			<tr>
				<td>${m.memberNo}</td>
				<td>${m.memberId}</td>
				<td>${m.memberPw}</td>
				<td>${m.memberName}</td>
				<td>${m.memberPhone}</td>
				<td>${m.memberAddr}</td>				
				<c:choose>
					<c:when test="${m.memberLevel eq 1}">
						<td>관리자</td>
					</c:when>
					<c:when test="${m.memberLevel eq 2}">
						<td>정회원</td>
					</c:when>
					<c:otherwise>
						<td>준회원</td>
					</c:otherwise>					
				</c:choose>
				<td>${m.enrollDate}</td>								
			</tr>
		</c:forEach>
	</table>
</body>
</html>