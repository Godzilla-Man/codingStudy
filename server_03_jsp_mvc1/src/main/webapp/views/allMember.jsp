<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.iei.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 인코딩
	request.setCharacterEncoding("utf-8"); //JSP 내장 객체 중, 한가지로 별도 선언 없이 사용 가능
	
	//2. 값 추출 -> 없음
	
	//3. 비즈니스 로직 -> 전체회원조회
	MemberService service = new MemberService();
	ArrayList<Member> list =  service.selectAllMember();
	
	//4. 결과처리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 회원 조회 결과</h1>
	<hr>
	
	<table border='1'>
		<tr>
			<th>회원 번호</th>
			<th>회원 아이디</th>
			<th>회원 비밀번호</th>
			<th>회원 이름</th>
			<th>회원 전화번호</th>
			<th>회원 주소</th>
			<th>회원 등급</th>
			<th>회원 가입일</th>			
		</tr>
		
		<% for(int i=0; i<list.size(); i++) { 
			Member m = list.get(i);
		%>
		<tr>
			<td><%=m.getMemberNo() %></td>
			<td><%=m.getMemberId() %></td>
			<td><%=m.getMemberPw() %></td>
			<td><%=m.getMemberName() %></td>
			<td><%=m.getMemberPhone() %></td>
			<td><%=m.getMemberAddr() %></td>
			<%if(m.getMemberLevel() == 1) {%>
			<td>관리자</td>			
			<%}else if(m.getMemberLevel() ==2 ) {%>
			<td>정회원</td>
			<%}else{%>
			<td>준회원</td>
			<%}%>
			<td><%=m.getEnrollDate()%></td>
		</tr>
		<%}%>		
	</table>
</body>
</html>