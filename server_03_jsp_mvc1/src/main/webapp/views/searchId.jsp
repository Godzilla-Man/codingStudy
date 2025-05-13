<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 인코딩
	request.setCharacterEncoding("utf-8");

	//2. 값 추출
	String memberId = request.getParameter("memberId");
	
	//3. 로직 - 아이디로 회원 조회
	MemberService service = new MemberService();
	Member m = service.selectOneMember(memberId);
	
	//4. 결과 처리
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디로 회원 조회 결과</h1>
	
	<hr>
	
	<%if(m == null){ %>
	<h3>회원 정보가 존재하지 않습니다.</h3>
	<%}else { %>
	<ul>
		<li>회원번호 : <%=m.getMemberNo() %> </li>
		<li>아이디 : <%=m.getMemberId() %> </li>
		<li>비밀번호 : <%=m.getMemberPw() %> </li>
		<li>이름 : <%=m.getMemberName() %> </li>
		<li>전화번호 : <%=m.getMemberPhone() %> </li>
		<li>주소 : <%=m.getMemberAddr() %> </li>
		<%if(m.getMemberLevel() == 1) {%>
		<li>관리자</li>
		<%}else if(m.getMemberLevel() == 2) {%>
		<li>정회원</li>
		<%}else {%>
		<li>준회원</li>
		<%}%>
		<li>가입일 : <%=m.getEnrollDate()%></li>
	</ul>
	<%} %>
</body>
</html>