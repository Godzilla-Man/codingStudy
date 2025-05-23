<%@page import="kr.or.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>
	.mypage-container {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.mypage-wrap {
		width: 800px;
	}
	.my-info-wrap {
		width : 80%;
		margin: 0 auto;
	}
	.mypage-btn {
		margin : 20px 0px;
		text-align: center;
	}
	.mypage-btn>button {
		width: 25%;
		margin : 10px 10px;
	}
</style>

</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<main class="content mypage-container">
			<section class="section mypage-wrap">
				<div class="page-title">마이페이지</div>
				<div class="my-info-wrap">
					<form id="updateForm" action="/member/update" method="post">
					
					<!-- 사용자에게 보이지는 않지만, SQL 수행 시 필요한 회원번호 hidden으로 보내기 -->
					<input type="hidden" name="memberNo" value="${loginMember.memberNo}">
						<table class="tbl">
							
							<tr>
								<th width="30%">아이디</th>
								<td width="70%" class="left">
								${loginMember.memberId }
								</td>
							</tr>
							
							<tr>
								<th>비밀번호</th>
								<td class="left">
									<div class="input-wrap">
										<div class="input-item">										
											<button type="button" class="btn-primary sm" onclick="chgPassword()">비밀번호 변경</button>
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="memberName">이름</label>
								</th>
								<td class="left">
									<div class="input-wrap">
										<div class="input-item">
											<input type="text" id="memberName" name="memberName" value="${loginMember.memberName}" maxlength="10" placeholder="한글 2~10글자">
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="memberEmail">이메일</label>
								</th>
								<td class="left">
									<div class="input-wrap">
										<div class="input-item">
											<input type="email" id="memberEmail" name="memberEmail" value="${loginMember.memberEmail}">
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="memberPhone">전화번호</label>
								</th>
								<td class="left">
									<div class="input-wrap">
										<div class="input-item">
											<input type="text" id="memberPhone" name="memberPhone" value="${loginMember.memberPhone}" maxlength="13" placeholder="전화번호 (010-0000-0000)">
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>
									<label for="memberAddr">주소</label>
								</th>
								<td class="left">
									<div class="input=wrap">
										<div class="input-item">
											<input type="text" id="memberAddr" name="memberAddr" value="${loginMember.memberAddr}">
										</div>
									</div>
								</td>							
							</tr>
							
							<tr>
								<th>등급</th>								
								<td class="left">
									<c:if test="${loginMember.memberLevel eq 1}">관리자</c:if>
									<c:if test="${loginMember.memberLevel eq 2 }">일반 회원</c:if>									
								</td>
							</tr>
							
							<tr>
								<th>가입일</th>
								<td class="left">${loginMember.enrollDate}</td>
							</tr>	
											
						</table>
						
						<div class="mypage-btn">
							<button type="button" onclick="updateValidate()" class="btn-primary lg">정보 수정</button>
							<c:if test="${loginMember.memberLevel ne 1}">
							<button type="button" onclick="deleteMember()" class="btn-secondary lg">회원 탈퇴</button>
							</c:if>
							<c:if test="${loginMember.memberLevel eq 1 }">
							<button type="button" class="btn-point lg" onclick="moveAdminPage()">관리자 페이지</button>
							</c:if>
						</div>
												
					</form>
				</div>
			</section>
		</main>
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
	//정보 수정 버튼 클릭 시, 동작 함수
	function updateValidate(){
		
		//이메일, 전화번호, 이름 정규표현식 패턴(회원가입 때와 동일)
		const emailRegExp = /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*@[a-zA-Z]([-_.]?[0-9a-zA-Z])+(\.[a-z]{2,3})$/;
		const phoneRegExp = /^010-\d{3,4}-\d{4}/;
		const nameRegExp = /^[가-힣]{2,10}$/;
		
		//이메일, 전화번호, 이름 요소
		const memberEmail = $('#memberEmail');
		const memberPhone = $('#memberPhone');
		const memberName = $('#memberName');
		
		//입력값 검증
		
		//$(memberEmail).val() == get
		//$(memberEmail).val('값') == set
		
		if(!emailRegExp.test($(memberEmail).val())){
			swal({
				title : "알림",
				text : "이메일 형식에 맞게 입력하세요.",
				icon : "warning"
			});
			
			return;
		}
		
		if(!phoneRegExp.test($(memberPhone).val())){
			swal({
				title : "알림",
				text : "전화번호는 - 포함 13자리로 입력해주세요.",
				icon : "warning"
			});
			
			return;
		}	
		
		if(!nameRegExp.test($(memberName).val())){
			swal({
				title : "알림",
				text : "이름은 한글 2~10글자로 입력하세요.",
				icon : "warning"
			});
			
			return;
		}
		
		swal({
			title : "수정",
			text : "회원 정보를 수정하시겠습니까?",
			icon : "warning",
			buttons : {
				cancel : {
					text : "취소",
					value : false,
					visible : true,
					closeModal : true
				},
				confirm : {
					text : "수정",
					value : true,
					visible : true,
					closeModal : true
				}
			}
		}).then(function(val){
			//val 매개변수에, 클릭한 버튼의 value 속성값이 전달된다. true or false
			
			if(val){
				$('#updateForm').submit(); //동적으로 form태그 submit!				
			}
		});
	}
	
	
	//회원 탈퇴 버튼 클릭 시, 동작 함수
	function deleteMember(){
		swal({
			title : "탈퇴",
			text : "정말 회원 탈퇴를 하시겠습니까?",
			icon : "warning",
			buttons : {
				cancel : {
					text : "취소",
					value : false,
					visible : true,
					closeModal : true
				},
				confirm : {
					text : "탈퇴",
					value : true,
					visible : true,
					closeModal : true
				}
			}
		}).then(function(val){
			if(val){ //탈퇴 버튼 클릭 시 동작
				/*
				$('#updateForm').attr('action', '/member/delete');
				$('#updateForm').submit();
				*/
				
				//console.log($('input[name=memberNo]').val());
				location.href = '/member/delete?memberNo=' + $('input[name=memberNo]').val();
			}
		});
	}
	
	
	//비밀번호 변경 시, 동작 함수
	function chgPassword(){
		//console.log('chgPassword');
		
		let width = 500; //팝업 넓이
		let height = 450; //팝업 높이
		
		//top : 상단에서 몇 픽셀 떨어진 위치에서 팝업을 띄울건지
		//left : 좌측에서 몇 픽셀 떨어진 위치에서 팝업을 띄울건지
		let top = screen.availHeight / 2 - height / 2; // 사용 가능 높이(주소창, 작업표시줄 제외) / 2 - 팝업 높이 / 2
		let left = screen.availWidth / 2 - height / 2;
		
		let attr = "width=" + width + ", height=" + height + ", top=" + top + ", left=" + left; 
		
		//URL, 창 이름 또는 열리는 지점, 속성 -> '팝업창' 같은 형식으로 띄어주는 기능
		window.open("/member/pwChgFrm", "chgPw", attr);
	}
	
	
	//관리자 페이지 버튼 클릭 시, 동작 함수
	<%if(((Member)session.getAttribute("loginMember")).getMemberLevel() == 1){%>
	function moveAdminPage(){
		location.href = '/member/admin';
	}
	<%}%>
	</script>

</body>
</html>