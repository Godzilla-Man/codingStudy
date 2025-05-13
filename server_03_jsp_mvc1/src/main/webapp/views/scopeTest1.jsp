<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스코프 테스트 1번 페이지</h1>
	
	<hr>
	
	<h3>ScopeTestServlet.java에서 request에 등록한 데이터 추출하여 화면에 출력하기</h3>
	<h4>request : <%=request.getAttribute("reqData")%></h4>
	
	<h3>ScopeTestServlet.java에서 session에 등록한 데이터 추출하여 화면에 출력하기</h3>
	<h4>session : <%=session.getAttribute("sesData")%></h4>
	
	<h3>ScopeTestServlet.java에서 application에 등록한 데이터 추출하여 화면에 출력하기</h3>
	<h4>application : <%=application.getAttribute("appData")%></h4>
	
	<hr>
	
	<h3>
		<a href='/views/scopeTest2.jsp'>스코프 테스트 2번 페이지로 이동</a>
	</h3>
</body>
</html>