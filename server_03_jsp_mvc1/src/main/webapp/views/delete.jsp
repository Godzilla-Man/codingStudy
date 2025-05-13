<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 인코딩
	request.setCharacterEncoding("utf-8");

	//2. 값 추출	
	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	
	//3. 로직 - 회원 삭제
	MemberService service = new MemberService();
	int result = service.deleteMember(memberNo);	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 삭제 결과</h1>
	
	<hr>
	
	<%if(result > 0) {%>
	<h3>회원 삭제 완료</h3>
	<%}else {%>
	<h3>회원 삭제 실패</h3>
	<%} %>	

</body>
</html>