<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("memberList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>삭제 회원 선택</h1>
	
	<hr>
	
	<table border='1'>
		<tr>
			<th>선택</th>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>등급</th>
			<th>가입일</th>						
		</tr>
		<%for(int i=0; i<list.size(); i++) {
			Member m = list.get(i);
		%>
		<tr>
			<td><a href='/delete?memberNo=<%=m.getMemberNo()%>'>삭제</a></td>
			<td><%=m.getMemberId() %></td>
			<td><%=m.getMemberName() %></td>
			<td><%=m.getMemberPhone() %></td>
			<Td><%=m.getMemberAddr() %></Td>
			
			<%if (m.getMemberLevel() == 1) { %>
			<td>관리자</td>
			<%}else if(m.getMemberLevel() == 2) {%>
			<td>정회원</td>
			<%}else { %>
			<td>준회원</td>
			<%} %>
			
			<td><%=m.getEnrollDate() %></td>
		<%} %>
	</table>
</body>
</html>