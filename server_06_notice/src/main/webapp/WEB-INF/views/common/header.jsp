<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/sweetalert.min.js"></script>

<header class="header">
	<div>
		<div class="logo">
			<a href="/">DJ'S WEB</a>
		</div>
		<nav class="nav">
			<ul>
				<li>
					<a href="/notice/getList?reqPage=1">게시판</a>					
				</li>
				<%--
				APi
				- 소프트웨어의 응용프로그램에서 다른 소프트웨어 구성요소 또는 서비스와 상호작용하기 위한 인터페이스
				 --%>
				<li>
					<a href="#">API</a>
					<ul class="sub-menu">
						<li><a href="/api/naverMap">네이버지도</a></li>
						<li><a href="/api/emailSendFrm">이메일</a></li>
						<li><a href="/api/busanPlace">공공API</a></li>
					</ul>
				</li>
				<li>
					<a href="#">메뉴3</a>
				</li>
				<li>
					<a href="#">메뉴4</a>
				</li>			
			</ul>
		</nav>
		<ul class="user-menu">
			<%-- 세션에 로그인 회원 정보 등록 여부에 따라 다른 메뉴 출력 --%>
			<c:choose>
				<c:when test="${empty sessionScope.loginMember}">
					<li>
						<a href="/member/joinFrm">회원가입</a>
					</li>
					<li>
						<a href="/member/loginFrm">로그인</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="/member/myPage">마이페이지</a>
					</li>
					<li>
						<a href="/member/logout">로그아웃</a>
					</li>
				</c:otherwise>				
			</c:choose>		
		</ul>
	</div>
</header>