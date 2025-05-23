<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	input[type=checkbox].chk + label {
		height : 24px;
	}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<main class="content">
			<section class="section admin-wrap">
				<div class="page-title">회원 관리 페이지</div>
				<table class="tbl tbl-hover">
					<tr>
						<th style="width:5%;">선택</th>
						<th style="width:5%;">번호</th>
						<th style="width:10%;">아이디</th>
						<th style="width:10%;">이름</th>
						<th style="width:15%;">이메일</th>
						<th style="width:15%;">전화번호</th>
						<th style="width:10%;">주소</th>
						<th style="width:10%;">가입일</th>
						<th style="width:10%;">등급</th>
						<th style="width:10%;">변경</th>
					</tr>
					<c:forEach var="m" items="${memberList}">
					<tr>
						<td>
							<div class="input-wrap">
								<input type="checkbox" class="chk">
								<label onclick="chkLabel(this)"></label>								
							</div>
						</td>
						<td class="memberNo">${m.memberNo}</td>
						<td>${m.memberId}</td>
						<td>${m.memberName}</td>
						<td>${m.memberEmail}</td>
						<td>${m.memberPhone}</td>
						<td>${m.memberAddr}</td>
						<td>${m.enrollDate}</td>
						<td>
							<div class="select">
								<select>
									<c:if test="${m.memberLevel eq 2}">
									<option value="2" selected>정회원</option>
									<option value="3">준회원</option>
									</c:if>
									<c:if test="${m.memberLevel eq 3}">
									<option value="2">정회원</option>
									<option value="3" selected>준회원</option>
									</c:if>
								</select>
							</div>
						</td>
						<td>
							<button class="btn-primary sm" onclick="chgLevel(this)">등급변경</button>
						</td>
					</tr>
					</c:forEach>
					
					<tr>
						<td colspan="10">
							<button class="btn-point lg" onclick="chgAllLevel()">선택 회원 등급 변경</button>
						</td>
					</tr>
					
				</table>
			</section>
		</main>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	<script>
	function chkLabel(labelObj){
		$(labelObj).prev().click(); //label 태그 이전 요소(체크박스)클릭
	}
	
	
	//각 행마다 생성된 '등급변경' 버튼 클릭 시, 동작 함수
	function chgLevel(btnObj){
		/*
		DAO에서 수행할 SQL : update tbl_member set member_level = ? where member_no = ?
		클라이언트가 서버로 전송해야 하는 값은 회원번호, 변경할 등급
		
		btnObj는 클릭한 버튼 요소 자바스크립트 객체		
		*/
		
		//let memberNo = $(btnObj).parent().parent().children().first().next().html();
		let memberNo = $(btnObj).parents('tr').find('.memberNo').html();
		let chgLevel = $(btnObj).parents('tr').find('select option:selected').val();
		
		swal({
			title : "변경",
			text : "등급을 변경하시겠습니까?",
			icon : "warning",
			buttons : {
				cancel : {
					text : "취소",
					value : false,
					visible : true,
					closeModal : true
				},
				confirm : {
					text : "변경",
					value : true,
					visible : true,
					closeModal : true
				}
			}
		}).then(function(val){
			if(val){ //변경 버튼 클릭 시
				
				$.ajax({
					url : "/member/chgLevel",
					data : {"memberNo" : memberNo, "chgLevel" : chgLevel},
					type : "get",
					success : function(res){
						console.log(res);
						//res : 서블릿에서 응답스트림을 통해, 전달한 값(업데이트 결과 값)
						if(res > 0){
							swal({
								title : "성공",
								text : "등급 변경이 완료되었습니다.",
								icon : "success"
							});
						}else{
							swal({
								title : "실패",
								text : "등급 변경 중, 오류가 발생하였습니다.",
								icon : "error"
							});
						}
					},
					error : function(){
						console.log('ajax 통신 오류');
					}
				})	
			}
		});			
	}
	
	//선택 회원 등급 변경 버튼 클릭 시, 동작 함수
	function chgAllLevel(){
		/* 서블릿으로 등급 변경 요청 시, 전달 데이터 형식
		   
		   회원 번호 : '2505070021/2505080022'
		   등급 변경 : '2/3'		   
		*/
		
		//체크된 행의 회원번호와, 변경 등급값을 각각의 배열에 삽입
		let chkMember = $('.chk:checked'); //체크된 체크박스
		
		if(chkMember.length < 1){
			swal({
				title : "경고",
				text : "등급을 변경할 회원을 선택하세요.",
				icon : "warning"
			});
			return;
		}
		
		//체크된 체크박스 순회하며, 배열에 회원번호와 변경 등급값 삽입
		let memberNo = [];
		let chgLevel = [];
		
		$.each(chkMember, function(index, item){ 
			//체크박스 순회하며, 함수를 실행시킴. 첫번 째 매개변수로 인덱스, 두번 째 매개변수로 요소(체크박스) 전달
			
			//체크박스 기준으로, 같은 행의 회원번호와 변경 등급값을 배열에 삽입
			memberNo.push($(item).parents('tr').find('.memberNo').html());
			chgLevel.push($(item).parents('tr').find('select option:selected').val());
		});
		
		console.log(memberNo);
		console.log(chgLevel);
		
		swal({
			title : "등급변경",
			text : "등급을 변경하시겠습니까?",
			icon : "warning",
			buttons : {
				cancel : {
					text : "취소",
					value : false,
					visible : true,
					closeModal : true
				},
				confirm : {
					text : "변경",
					value : true,
					visible : true,
					closeModal : true
				}
			}
		}).then(function(val){
			if(val){
				$.ajax({
					url : "/member/chgAllLevel",
					data : {"memberNo" : memberNo.join('/'), "chgLevel" : chgLevel.join('/')},
					type : 'get',
					success : function(res){
						console.log('서버 응답 (res):', res);
					    console.log('서버 응답 타입 (typeof res):', typeof res);
					    
						if(res){
							swal({
								title : "성공",
								text : "등급 변경이 완료되었습니다.",
								icon : "success"
							});
						}else{
							swal({
								title : "실패",
								text : "등급 변경 중, 오류가 발생하였습니다.",
								icon : "error"
							});
						}					
					},
					error : function(){
						console.log('ajax 통신 오류');
					}
				})
			}
		});
	}
	</script>
</body>
</html>