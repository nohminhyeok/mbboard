<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div>${loginMember.memberId}관리자</div>
	
	<div><a href="/logout">로그아웃</a></div>
	<h2>멤버리스트</h2>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>사용자 권한</th>
			<th>사용자 정보 수정</th>
		</tr>
		<c:forEach var="member" items="${memberList}">
			<tr>
				<td>${member.memberId}</td>
				<td>${member.memberPw}</td>
				<td>${member.memberRole}</td>
				<td>
					<button type="button" class="updateBtn" 
					        data-id="${member.memberId}"
					        data-role="${member.memberRole}"
					        data-pw="${member.memberPw}">
					        사용자 정보 수정
					</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<h3>사용자 정보 수정</h3>
	<table border="1" id="updateForm" style="display: none;">
		<tr>
			<th>아이디</th>
			<td><input type="text" id="updateId" readonly></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" id="updatePw"></td>
		</tr>
		<tr>
			<th>권한</th>
			<td>
				<select id="updateRole">
					<option value="ADMIN">ADMIN</option>
					<option value="MEMBER">MEMBER</option>
				</select>
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
		$('.updateBtn').click(function(){
			const id = $(this).data('id');
			const pw = $(this).data('pw');
			const role = $(this).data('role');
				
			// 폼에 데이터 설정
			$('#updateId').val(id);
			$('#updatePw').val(pw);
			$('#updateRole').val(role);

			// 수정 폼 보이기
			$('#updateForm').show();
		});

		// 수정 완료 버튼 클릭 시
		$('#saveBtn').click(function() {
			const updatedId = $('#updateId').val();
			const updatedPw = $('#updatePw').val();
			const updatedRole = $('#updateRole').val();

			// AJAX로 수정 데이터 전송
			$.ajax({
				url: '/admin/adminHome',
				type: 'POST',
				data: {
					memberId: updatedId,
					memberPw: updatedPw,
					memberRole: updatedRole
				},
				success: function(response) {
					if (response === 'success') {
						alert('수정 완료');
						location.reload();
					} else {
						alert('수정 실패');
					}
				}
			});
		});

		// 취소 버튼 클릭 시 폼 숨기기
		$('#cancelBtn').click(function() {
			$('#updateForm').hide();
		});
	})
		
</script>
</body>
</html>