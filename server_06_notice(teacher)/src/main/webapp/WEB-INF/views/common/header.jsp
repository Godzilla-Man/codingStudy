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
			<a href="/">BAE'S WEB</a>
		</div>
		<nav class="nav">
			<ul>
				<li>
					<a href="/notice/getList?reqPage=1">게시판</a>
				</li>
				<li>
					<a href="#">메뉴2</a>
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