<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>수정할 회원 조회</h1>
	
	<hr>
	
	<form action='/updateId' method='get'>
		수정 대상 아이디 입력 : <input type='text' name='memberId'>
		<input type='submit' value='조회'>
	</form>

</body>
</html>