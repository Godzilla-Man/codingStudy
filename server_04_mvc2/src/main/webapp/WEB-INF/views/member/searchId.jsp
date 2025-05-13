<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member) request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디로 회원 조회</h1>
	
	<hr>
	
	<%if(m == null) {%>
		<h3>일치하는 회원 정보가 존재하지 않습니다.</h3>
	<%}else { %>
		<ul>
			<li>회원번호 : <%=m.getMemberNo() %></li>
			<li>아이디 : <%=m.getMemberId() %></li>
			<li>이름 : <%=m.getMemberName() %></li>
			<li>전화번호 : <%=m.getMemberPhone() %></li>
			<li>주소 : <%=m.getMemberAddr() %></li>
			<%if(m.getMemberLevel() == 1) {%>
			<li>관리자</li>
			<%}else if(m.getMemberLevel() == 2) {%>
			<li>정회원</li>
			<%}else { %>
			<li>준회원</li>
			<%} %>
			<li>가입일 : <%=m.getEnrollDate() %> </li>
		</ul>
	<%} %>

</body>
</html>