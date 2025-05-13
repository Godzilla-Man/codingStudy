<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 인코딩
	request.setCharacterEncoding("utf-8");

	//2. 값추출
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	String memberPhone = request.getParameter("memberPhone");
	String memberAddr = request.getParameter("memberAddr");
	
	//3. 로직 - 회원 가입
	Member m = new Member();
	m.setMemberId(memberId);
	m.setMemberPw(memberPw);
	m.setMemberName(memberName);
	m.setMemberPhone(memberPhone);
	m.setMemberAddr(memberAddr);
	
	MemberService service = new MemberService();
	int result = service.joinMember(m);
	
	//4. 결과 처리
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입 결과</h1>
	
	<hr>
	
	<%if(result > 0) {%>
	<h3>회원 가입 완료!</h3>
	<%}else if(result == 0){ %>
	<h3>회원 가입 실패..</h3>
	<%}else { %>
	<h3>등록하려는 아이디와 일치하는 회원이 이미 존재합니다..</h3>
	<%} %>
</body>
</html>