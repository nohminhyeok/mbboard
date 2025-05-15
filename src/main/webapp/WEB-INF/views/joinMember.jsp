<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	$(function(){
		$('#idckBtn').click(function(){
			$.ajax({
				url:'/isId/'+$('#idck').val()
				, type: 'get'
				, success: function(data){
					if(data){
						alert('이미 사용중인 아이디 입니다.')
					} else {
						alert('사용 가능한 아이디 입니다.')
						$('#id').val($('#idck').val());
					}
				}
			})
		})
		
		$('#joinBtn').click(function(){
			$.ajax({
				url:'/joinMember'
				, type: 'post'
				, data:{
					id: $('#id').val(),
					pw: $('#pw').val()
				}, success: function(data){
					if(data == 'success'){
						alert('회원가입 성공');
						location.href = '/login';
					} else {
						alert('회원가입 실패 다시 확인해주세요');
					}
				}
				
			})
		})
	})
	</script>

</head>
<body>
	<h1>회원가입</h1>
	<form>
	<hr>
	<h2>ID 검색</h2>
		<table border="1">
			<tr>
				<th>ID 검색</th>
				<td>
					<input type="text" id="idck" placeholder="ID검색">
					<button type="button" id="idckBtn">ID검색</button>
				</td>
			</tr>
		</table>
	<hr>
	<table border="1">
		<tr>
			<th>ID</th>
			<td>
				<input type="text" name="memberId" id="id" placeholder="아이디">
			</td>
		</tr>
		<tr>
			<th>PW</th>
			<td>
			 	<input type="password" name="memberPw" id="pw" placeholder="비밀번호">
			</td>
		</tr>
	</table>
	<button type="button" id="joinBtn">가입하기</button>
	</form>
</body>
</html>