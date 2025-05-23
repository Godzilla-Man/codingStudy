<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 정보</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<main class="content">
			<section class="section notice-view-wrap">
				<div class="page-title">게시글 상세 정보</div>
				<table class="tbl notice-view">
					<tr>
						<th colspan="6">${notice.noticeTitle}</th>
					</tr>
					<tr>
						<th style="width:20%;">작성자</th>
						<td style="width:20%;">${notice.noticeWriter}</td>
						<th style="width:15%;">작성일</th>
						<td style="width:15%;">${notice.noticeDate}</td>
						<th style="width:15%;">조회수</th>
						<td style="width:15%;">${notice.readCount}</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="5">
							<c:forEach var="file" items="${notice.fileList}">
								<a href="javascript:fileDown('${file.fileName}', '${file.filePath}')">${file.fileName}</a><br>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td class="left" colspan="6">
							<div class="noticeContent">${notice.noticeContent}</div>
						</td>
					</tr>
					<c:if test="${not empty loginMember and loginMember.memberId eq notice.noticeWriter}">
					<tr>
						<td colspan="6">
							<a href="/notice/updateFrm?noticeNo=${notice.noticeNo}" class="btn-primary">수정</a>
							<button class="btn-secondary" onclick="deleteNotice(${notice.noticeNo})">삭제</button>
						</td>
					</tr>
					</c:if>
				</table>
			</section>
		</main>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
	<script>
	function fileDown(fileName, filePath){
		location.href = '/notice/fileDown?fileName=' + encodeURIComponent(fileName) + '&filePath=' + filePath;
	}
	function deleteNotice(noticeNo){
		swal({
			title : "삭제",
			text : "게시글을 삭제하시겠습니까?",
			icon : "warning",
			buttons : {
				cancel : {
					text : "취소",
					value : false,
					visible : true,
					closeModal : true
				},
				confirm : {
					text : "삭제",
					value : true,
					visible : true,
					closeModal : true
				}
			}
		}).then(function(val){
			if(val){
				location.href = '/notice/delete?noticeNo=' + noticeNo;
			}
		});
	}
	</script>
</body>
</html>