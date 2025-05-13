<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디로 회원 조회</h1>
	
	<hr>
	
	<!-- MVC1에서는 Controller역할을 jsp가 수행함.
		 action 속성에 작성되는 값은 jsp의 경로!!
	 -->
	<form action='/views/searchId.jsp' method='get'>
		조회할 아이디 입력 : <input type='text' name='memberId'>
		<input type='submit' value='조회'>		
	</form>
</body>
</html>