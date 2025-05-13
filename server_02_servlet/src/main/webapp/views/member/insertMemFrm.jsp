<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>신규 회원 가입</h1>
	
	<hr>
	
	<form action='/insertMem' method='post'>
		<table border=0>
			<tr align='left'>
				<th>아이디</th><td><input type='text' name='insertId'></td>
			</tr>
			<tr align='left'>
				<th>비밀번호</th><td><input type='password' name='insertPw'></td>
			</tr>
			<tr align='left'>			
				<th>이름</th><td><input type='text' name='insertName'> </td>
			</tr>
			<tr align='left'>
				<th>전화번호</th><td><input type='text' name='insertPhone'></td>
			</tr>
			<tr align='left'>
				<th>주소</th><td><input type='text' name='insertAddr'></td>
			</tr>
			<tr align='center'>
				<td colspan=2><input type='submit' value='가입하기' style='width:200px'></td>
			</tr>		
		</table>
	</form>
</body>
</html>