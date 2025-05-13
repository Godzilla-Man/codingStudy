<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.login-container {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.login-wrap {
		width: 500px; 
	}
	
	.login-wrap .input-wrap {
		padding : 15px 30px;
	}
	
	.login-wrap .login-button-box {
		padding : 20px 30px;
	}
	
	.login-wrap .login-button-box>button {
		width: 100%;
	}
	
	.member-link-box {
		display: flex;
		justify-content: center;
		gap : 10px;
	}
	
	.member-link-box>a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<main class="content login-container">
			<section class="section login-wrap">
				<div class="page-title">로그인</div>
				<form action="/member/login" method="post" autocomplete="off" onsubmit="return validateForm()">
					<div class="input-wrap">
						<div class="input-title">
							<label for="loginId">아이디</label>
						</div>
						<div class="input-item">
							<input type="text" id="loginId" name="loginId">
						</div>
					</div>
					
					<div class="input-wrap">
						<div class="input-title">
							<label for="loginPw">비밀번호</label>
						</div>
						<div class="input-item">
							<input type="password" id="loginPw" name="loginPw">
						</div>
					</div>
					
					<div class="login-button-box">
						<button type="submit" class="btn-primary lg">로그인</button>
					</div>
					
					<div class="member-link-box">
						<a href="/member/joinFrm">회원가입</a> |
						<a href="#">아이디 찾기</a> |
						<a href="#">비밀번호 찾기</a>
					</div>
				</form>
			</section>
		</main>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	<script>
	function validateForm(){
		if($('#loginId').val().length < 1){
			swal({
				title : "알림",
				text : "아이디를 입력하세요",
				icon : "warning"
			});
			
			return false;
		}
		
		if($('#loginPw').val().length < 1){
			swal({
				title : "알림",
				text : "비밀번호를 입력하세요",
				icon : "warning"
			});
			
			return false;
		}
	}
	</script>
</body>
</html>