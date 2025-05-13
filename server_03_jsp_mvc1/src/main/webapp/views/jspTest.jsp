<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSP에서 자바 코드 기술하기</h2>
	
	<hr>
	
	<h3>1. 스크립틀릿 사용</h3>
	<%
	//자바 코드 영역이므로, 자바에서 사용한 주석과 동일하게 작성 가능
	/*
	다중 라인 주석
	*/
	
	int num1 = 10;
	int num2 = 20;
	int sum = num1 + num2;
	%>
	<%if(num1 > num2) { %>
		<!-- html 영역이므로 html에서 작성하는 주석 -->
		<%-- JSP 주석 : 화면에 노출되지 않음. --%>
		<h4>num1이 num2보다 큽니다.</h4>		
	<%}else{%>
		<!-- html 영역이므로 html에서 작성하는 주석 -->
		<%-- JSP 주석 : 화면에 노출되지 않음. --%>
		<h4>num2가 num1보다 큽니다.</h4>
	<%}%>
	
	<% for(int i=0; i<3; i++) { %>
		<h4>for문을 이용한 h4 태그 생성</h4>		
	<%}%>
	
	<h3>2. 표현식(출력식) 사용</h3>
	<h4><%=num1%></h4>
	<h4><%=num2%></h4>
	<h4><%=num1%> + <%=num2%> = <%=sum%></h4>
	<h4><%=String.valueOf(num1)%></h4>
</body>
</html>