<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% Member m = (Member) request.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	
	<hr>
	
	<%if(m == null) {%>
		<h3>일치하는 회원 정보가 존재하지 않습니다.</h3>
	<%}else { %>
		<form action='/UpdateServlet' method='post'>
		<input type='hidden' name='memberNo' value='<%=m.getMemberNo()%>'>
		<!-- 아래 아이디는 리다이렉트용!! -->
		<input type='hidden' name='memberId' value='<%=m.getMemberId()%>'>
		<table border=1>
			<tr><td>아이디(수정X)</td><td><%=m.getMemberId() %></td></tr>
			<tr><td>비밀번호</td><td><input type='password' name='memberPw' value='<%=m.getMemberPw()%>'></td></tr>
			<tr><td>이름</td><td><input type='text' name='memberName' value='<%=m.getMemberName()%>'></td></tr>
			<tr><td>주소</td><td><input type='text' name='memberAddr' value='<%=m.getMemberAddr()%>'></td></tr>
			<tr><td colspan=2 align='center'><input type='submit' value='수정하기' style='width:300px'></td></tr>			
		</table>	
		</form>
	<%} %>
</body>
</html>