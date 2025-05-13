<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style>
	.join-wrap {
		width : 500px;
		margin : 0 auto;
	}
	.join-wrap .input-wrap {
		padding : 15px 30px;
	}
	.join-wrap .join-button-box {
		padding : 20px 30px;
		display : flex;
		justify-content: center;
	}
	.join-wrap .join-button-box>button {
	width: 100%;
	}
</style>

</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<main class="content">
			<section class="section join-wrap">
				<div class="page-title">회원가입</div>
				<form action='/member/join' method='post' autocomplete="off" onsubmit="return validateForm()"> <%-- 요청 URL / 전송 방식 / 자동 완성 기능 해제 --%>
				
					
					<div class="input-wrap">
						<div class="input-title">
							<label for="memberId">아이디</label>
						</div>
						<div class="input-item">
							<input type="text" id="memberId" name="memberId" placeholder="영어, 숫자 8~20글자" maxlength="20">
							<%-- 아이디 중복체크 버튼! form 태그 내에서 button 태그 타입 미지정시, submit 기능을 가짐. --%>
							<button type="button" class="btn-primary" id="idDuplChkBtn">중복체크</button>
						</div>
						<p id="idMessage" class="input-msg"></p>
					</div>
					
					<div class="input-wrap">
						<div class="input-title">
							<label for="memberPw">비밀번호</label>							
						</div>
						<div class="input-item">
							<input type="password" id="memberPw" name="memberPw" placeholder="영어, 숫자, 특수문자(!,@,#,$) 6~30글자" maxlength="30">
						</div>
					</div>
					
					<div class="input-wrap">
						<div class="input-title">
							<label for="memberPwRe">비밀번호 확인</label>							
						</div>
						<div class="input-item">
							<input type="password" id="memberPwRe" maxlength="30">
						</div>
						<p id="pwMessage" class="input-msg"></p>
					</div>														
					
					<div class="input-wrap">
						<div class="input-title">
							<label for="memberEmail">이메일</label>							
						</div>
						<div class="input-item">
							<input type="email" id="memberEmail" name="memberEmail">
						</div>
						<p id="emailMessage" class="input-msg"></p>
					</div>
					
					<div class="input-wrap">
						<div class="input-title">
							<label for="memberName">이름</label>
						</div>
						<div class="input-item">
							<input type="text" id="memberName" name="memberName" placeholder="한글 2~10글자" maxlength="10">
						</div>
						<p id="nameMessage" class="input-msg"></p>
					</div>
					
					<div class="input-wrap">
						<div class="input-title">
							<label for="memberPhone">전화번호</label>
						</div>
						<div class="input-item">
							<input type="text" id="memberPhone" name="memberPhone" placeholder="전화번호(010-0000-0000)" maxlength="13">
						</div>
						<p id="phoneMessage" class="input-msg"></p>
					</div>
					
					<div class="input-wrap">
						<div class="input-title">
							<label for="memberAddr">주소</label>
						</div>
						<div class="input-item">
							<input type="text" id="memberAddr" name="memberAddr">
						</div>
					</div>
					
					<div class="join-button-box">
						<button type="submit" class="btn-primary lg">회원가입</button>
					</div>
					
				</form>
			</section>
		</main>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	<script>
		//브라우저에 html, css가 모두 로드되고 난 이후에 자동으로 실행되는 함수
	
			
			//사용자 입력값 유효성 검증 결과를 저장할 객체
			//사용자가 값을 입력할때마다 검증하여, 만족할 경우 true로 만족하지 못할 경우 false로 변경
			//최종적으로 회원가입 버튼 클릭 시, 아래 객체의 모든 속성이 true인지 검사할 것임.
			const checkObj = {
				"memberId" : false,
				"memberPw" : false,
				"memberPwRe" : false,
				"memberName" : false,
				"memberPhone" : false,
				"memberEmail" : false,
				"idDuplChk" : false // 아이디 중복체크 여부(true면 중복X, false면 중복O 또는 중복체크 진행하지 않음.)
			};
			
			const memberId = $('#memberId'); //jQuery 방식으로 HTML 요소 선택(id 속성 값이 'memberId'인 요소)
			const idMessage = $('#idMessage'); //입력 ID 유효성 검증 결과 메세지를 보여줄 요소
			
			//id를 입력할 수 있는 요소에, input (key 관련, mouse 관련, 붙여넣기) 이벤트 발생 시 동작할 핸들러 함수 작성
			$(memberId).on('input', function(){
				checkObj.idDuplChk = false; //아이디 입력시마다, 중복체크 값 false로 변경하여 다시 중복체크 할 수 있도록
				
				//아래 코드 작성하지 않으면, 클래스를 추가해주기만 하기 때문에 두 클래스가 공존할 수 있음.
				$(idMessage).removeClass('valid');
				$(idMessage).removeClass('invalid');
				
				//아이디 정규 표현식 = 영어, 숫자 8~20글자
				const regExp = /^[a-zA-Z0-9]{8,20}$/;
				
				//정규표현식.test(검사할 문자열) => 만족하면 true, 만족하지 않으면 false 반환
				/* 이벤트 핸들러 함수 내부에서, 이벤트가 발생한 요소 객체 == this == 이 this는 자바스크립트 객체!!
				   val()은 jQuery 메소드!
				   자바스크립트 객체를 jQuery화 하는 방법 ==> $(자바스크립트객체)
				   
				   val() ==> value 속성값 가져오기
				   val('값') ==> value 속성값 변경하기
				*/
				if(regExp.test($(this).val())){
					//사용자가 입력한 ID가 정규표현식에 만족하는 경우
					$(idMessage).text('good!');
					checkObj.memberId = true;
					$(idMessage).addClass('valid');
				}else{
					//사용자가 입력한 ID가 정규표현식에 만족하지 않는 경우
					$(idMessage).text("영어, 숫자 8~20글자 사이로 입력하세요.");
					
					/* 객체의 속성에 접근하는 방법
					1) 객체명.속성명		  ==> 속성의 값을 get!! 가져옴
					   객체명.속성명 = 값;    ==> 속성의 값을 set!! 변경함
					   
					2) 객체명['속성명']       ==> 속성의 값을 get!! 가져옴
					   객체명['속성명'] = 값;  ==> 속성의 값을 set!! 변경함
					*/
					checkObj.memberId = false;
					$(idMessage).addClass('invalid');
				}
			});
			
			
			//아이디 중복체크
			const idDuplChkBtn = $('#idDuplChkBtn'); //중복체크 버튼 요소
			$(idDuplChkBtn).on('click', function(){
				$(idMessage).removeClass('valid');
				$(idMessage).removeClass('invalid');
				
				if(!checkObj.memberId){ //아이디 유효성 검증 결과가 false일 때
					swal({
						title : "알림",
						text : "유효한 ID를 입력하고, 중복체크를 진행하세요.",
						icon : "warning"
					});
				
					return;
				}
				
				//중복체크 코드
				
				/* (1) 스크립트 태그 내부에서, 서버에 요청 보내기 => location.href 사용				
				*/
				//location.href = '/idDuplChk?memberId=' + $(memberId).val();
				
				/* 위 방식대로 요청 및 서블릿에서 기존 서블릿과 동일하게 4. 결과 처리 진행화면
				   join.jsp를 브라우저에 다시 그림. 즉, 입력값들이 초기화 되어진다.
				   
				   - 비동기 통신 기술 중, ajax라는 기술을 이용하면 페이지 전환 없이 데이터만
				     서버로부터 응답받아, 동적으로 페이지의 일부분을 업데이트 해줄 수 있음.
				     
				     아래는 jQuery로 작성한 ajax
				*/
				$.ajax({
					url : "/idDuplChk",		 					// 요청 URL
					data : { 'memberId' : $(memberId).val() },	// 서버로 전송할 데이터
					type : "get",								// 데이터 전송 방식
					success : function(res){					// 비동기 통신 성공 시, 호출 함수
						if(res == 0){ //중복 X == 회원가입 가능
							swal({
								title : "알림",
								text : "사용 가능한 ID 입니다.",
								icon : "success"								
							});
							
							checkObj.idDuplChk = true;
						}else {
							swal({
								title : "알림",
								text : "이미 사용중인 ID 입니다.",
								icon : "warning"
							});
							
							checkObj.idDuplChk = false;
						}
					},
					error : function(){							// 비동기 통신 에러 시, 호출 함수
						
					}
				});				
			});
			
			
			//비밀번호 유효성 검사
			const memberPw = $('#memberPw');
			const pwMessage = $('#pwMessage');
			const memberPwRe = $('#memberPwRe');
			
			$(memberPw).on('input', function(){
				$(pwMessage).removeClass('invalid');
				$(pwMessage).removeClass('valid');
				
				const regExp = /^[a-zA-Z0-9!@#$]{6,30}$/; //영어, 숫자, 특수문자 (!@#$) 6~30글자
				
				if(regExp.test($(memberPw).val())){
					checkObj.memberPw = true;
					
					//비밀번호 확인값이 입력이 되었을 때
					if($(memberPwRe).val().length > 0) {
						checkPw(); //비밀번호와 확인값 일치하는지 체크
					}else{
						$(pwMessage).text('good!');
						$(pwMessage).addClass('valid');
					}
					
				}else{
					checkObj.memberPw = false;
					$(pwMessage).text('비밀번호 형식이 유효하지 않습니다.');
					$(pwMessage).addClass('invalid');					
				}
			});
			
			//비밀번호 확인 유효성 검사
			$(memberPwRe).on('input', checkPw);
			
			function checkPw(){
				$(pwMessage).removeClass('invalid');
				$(pwMessage).removeClass('valid');
				
				//입력한 비밀번호와 값이 같은지만 검증
				if($(memberPw).val() == $(memberPwRe).val()){
					$(pwMessage).text('good!');
					$(pwMessage).addClass('valid');
					checkObj.memberPwRe = true;
				}else{
					$(pwMessage).text('비밀번호가 일치하지 않습니다.');
					$(pwMessage).addClass('invalid');
					checkObj.memberPwRe = false;					
				}
			}
			
			
			//이메일 유효성 검사
			const memberEmail = $('#memberEmail');
			const emailMessage = $('#emailMessage');
			
			$(memberEmail).on('input', function(){
				$(emailMessage).removeClass('invalid');
				$(emailMessage).removeClass('valid');
				
				const regExp = /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*@[a-zA-Z]([-_.]?[0-9a-zA-Z])+(\.[a-z]{2,3})$/;
				
				if(regExp.test($(this).val())){
					$(emailMessage).text('good!');
					$(emailMessage).addClass('valid');
					checkObj.memberEmail = true;
				}else{
					$(emailMessage).text('이메일 형식이 올바르지 않습니다.');
					$(emailMessage).addClass('invalid');
					checkObj.memberEmail = false;					
				}
			});
			
			
			//전화번호 유효성 검사
			const memberPhone = $('#memberPhone');
			const phoneMessage = $('#phoneMessage');
			
			$(memberPhone).on('input', function(){
				$(phoneMessage).removeClass('invalid');
				$(phoneMessage).removeClass('valid');
				
				const regExp = /^010-\d{3,4}-\d{4}/;
				
				if(regExp.test($(this).val())){
					$(phoneMessage).text('good!');
					$(phoneMessage).addClass('valid');
					checkObj.memberPhone = true;
				}else{
					$(phoneMessage).text('전화번호 형식이 올바르지 않습니다.');
					$(phoneMessgae).addClass('invalid');
					checkObj.memberPhone = false;
				}
			})
			
			
			//이름 유효성 검사
			const memberName = $('#memberName');
			const nameMessage = $('#nameMessage');
			
			$(memberName).on('input', function(){
				$(nameMessage).removeClass('invalid');
				$(nameMessage).removeClass('valid');
				
				const regExp = /^[가-힣]{2,10}$/;
				
				if(regExp.test($(this).val())){
					$(nameMessage).text('good!');
					$(nameMessage).addClass('valid');
					checkObj.memberName = true;
				}else{
					$(nameMessage).text('이름 형식이 유효하지 않습니다.');
					$(nameMessage).addClass('invalid');
					checkObj.memberName = false;
				}
			})
			
			function validateForm(){
				/*
				회원 가입 버튼 클릭 시, checkObj의 모든 속성에 접근하여
				true인지 검증
				*/			
				
				let str = "";
				
				for(let key in checkObj){ //key 변수에 객체의 각 속성명이 순차적으로 할당됨.
					//checkObj.key //checkObj에서 key라는 속성을 찾으려고 함.
					
					if(!checkObj[key]){ //반복 접근중인 속성의 값이 하나라도 false이면, submit 제어 
						switch(key){
							case "memberId" : str = "아이디 형식"; break;
							case "memberPw" : str = "비밀번호 형식"; break;
							case "memberPwRe" : str = "비밀번호 확인 형식"; break;
							case "memberName" : str = "이름 형식"; break;
							case "memberEmail" : str = "이메일 형식"; break;
							case "memberPhone" : str = "전화번호 형식"; break;
						}
					
						if(key != 'idDupleChk'){
							str += "이 유효하지 않습니다.";							
						}else{
							str = "아이디 중복체크를 진행하세요.";
						}	
						
						swal({
							title : '회원가입 실패',
							text : str,
							icon : 'warning'							
						});
						
						return false; //submit 동작 제어						
					}
				}
			}		
		
	</script>
</body>
</html>