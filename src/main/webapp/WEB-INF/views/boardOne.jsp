<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h1>게시글</h1>
	<form>
		<button type="button" id="goBoard">게시판 이동</button>
		<table border="1">
			<tr>
				<th>번호</th>
				<td>${board.boardNo}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${board.boardTitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${board.boardContent}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board.boardUser}</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${board.updatedate}</td>
			</tr>
			<tr>
				<th>생성일</th>
				<td>${board.createdate}</td>
			</tr>
		</table>
		<button type="button" id="goUpdateBtn">수정</button>
		<button type="button" id="removeBtn">삭제</button>
	</form>
		
	<script>
	    $(function() {
	        $('#goBoard').click(function() {
	            window.location.href = '/boardList';
	        });
	        
	        $('#goUpdateBtn').click(function() {
	            var boardNo = '${board.boardNo}';
	            window.location.href = '/updateBoard/' + boardNo;
	        });
	        
	        $('#removeBtn').click(function(){
	            var boardNo = '${board.boardNo}';
	            if (confirm('정말 삭제하겠습니까?')) {
	                $.post('/deleteBoard', { boardNo: boardNo }, function(response) {
	                    if (response === 'SUCCESS') {
	                        alert('삭제 완료!');
	                        window.location.href = '/boardList';
	                    } else {
	                        alert('삭제 실패!');
	                    }
	                }).fail(function() {
	                    alert('삭제 중 오류가 발생했습니다.');
	                });
	            }
	        });
        });
	</script>
</body>
</html>