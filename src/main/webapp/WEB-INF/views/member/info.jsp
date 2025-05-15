<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h1>${loginMember.memberId}님 상세정보</h1>
	<div><a href="/logout">로그아웃</a></div>
	<div>MEMBER_ROLE : ${loginMember.memberRole}</div>
	<button type="button" id="updateBtn">비밀번호 수정</button>
	
	<h2>비밀번호 수정</h2>
	<table border="1" id="updateForm" style="display: none;">
		<tr>
			<td>
				<input type="text" id="memberId" value="${loginMember.memberId}" readonly>
			</td>
		</tr>
		<tr>
			<td>
				수정할 비밀번호
				<input type="password" id="pw1">
			</td>
		</tr>
		<tr>
			<td>
				비밀번호 확인
				<input type="password" id="pw2">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" id="saveBtn">수정 완료</button>
				<button type="button" id="cancelBtn">취소</button>
			</td>
		</tr>
	</table>
<script>
	$(function(){
		$('#updateBtn').click(function(){
			$('#updateForm').show();
		})
		
		$('#cancelBtn').click(function() {
			$('#updateForm').hide();
		});
		
		$('#saveBtn').click(function(){
			const memberId = $('#memberId').val();
			const updatePw = $('#pw1').val();
			const confirmPw = $('#pw2').val();
			
			// 비밀번호 일치 여부 확인
			if (updatePw == '' || confirmPw == '') {
				alert('비밀번호를 입력해주세요.');
				return;
			}

			if (updatePw != confirmPw) {
				alert('비밀번호가 일치하지 않습니다.');
				return;
			}
			
			$.ajax({
				url: '/member/memberHome'
				, type: 'POST'
				, data: {
					memberId: memberId
					,memberPw: updatePw
				},
				success: function(response){
					if(response == 'success'){
						alert('수정 완료');
						location.reload();
					} else {
						alert('수정 실패');
					}
				}
			})
		})
	})
</script>
</body>
</html>