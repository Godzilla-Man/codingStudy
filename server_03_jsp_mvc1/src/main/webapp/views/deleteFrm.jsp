<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 인코딩
	request.setCharacterEncoding("utf-8");

	//2. 값추출 -> X
	
	//3. 로직 -> 전체 회원 조회
	MemberService service = new MemberService();
	ArrayList<Member> list = service.selectAllMember();	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>삭제 회원 조회</h1>
	
	<hr>
	
	<table border='1'>
		<tr>
			<th>선택</th>
			<th>회원 아이디</th>
			<th>회원 이름</th>
			<th>회원 전화번호</th>
			<th>회원 등급</th>
			<th>회원 가입일</th>
		</tr>
		
		<% for(int i=0; i<list.size(); i++){
			Member m = list.get(i);
		%>
		<tr>
			<td>
				<a href='/views/delete.jsp?memberNo=<%=m.getMemberNo()%>'>삭제</a>
			</td>
			<td>
				<%=m.getMemberId()%>
			</td>
			<td>
				<%=m.getMemberName()%>
			</td>
			<td>
				<%=m.getMemberPhone()%>
			</td>
			<td>
				<%if(m.getMemberLevel() == 1) {%>
				관리자
				<%} else if(m.getMemberLevel() == 2) {%>
				정회원
				<%} else {%>
				준회원
				<%} %>
			</td>
			<td>
				<%=m.getEnrollDate() %>
			</td>
		</tr>
		<%} %>
			
	</table>
</body>
</html>