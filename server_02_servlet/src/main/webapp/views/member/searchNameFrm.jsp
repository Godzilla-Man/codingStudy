<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 이름으로 조회</h1>
	
	<hr>
	
	<form action='/searchName' method='get'>
		조회할 회원 이름 입력 : <input type='text' name='memberName'>
		<input type='submit' value='조회'>
	</form>
</body>
</html>