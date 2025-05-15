<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <h1>게시글 작성</h1>
    <form id="boardForm">
        <table border="1">
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" name="boardTitle" id="boardTitle">
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <input type="text" name="boardContent" id="boardContent">
                </td>
            </tr>
            <tr>
                <th>사용자</th>
                <td>
                    <input type="text" name="boardUser" id="boardUser">
                </td>
            </tr>
        </table>
        <button type="button" id="generBtn">작성하기</button>
    </form>

<script>
    $('#generBtn').click(function() {
        var boardTitle = $('#boardTitle').val();
        var boardContent = $('#boardContent').val();
        var boardUser = $('#boardUser').val();
	    $.ajax({
	        type: 'POST',
	        url: '/insertBoard',
	        data: {
	            boardTitle: boardTitle,
	            boardContent: boardContent,
	            boardUser: boardUser
	        },
	        success: function(response) {
	            if (response === 'SUCCESS') {
	                alert('게시글이 성공적으로 등록되었습니다.');
	                window.location.href = '/boardList';
	            } else {
	                alert('게시글 등록에 실패했습니다.');
	            }
	        }
	    });
    });
</script>
</body>
</html>
