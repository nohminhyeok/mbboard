<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <h2>게시글 수정</h2>
    <form action="/updateBoard" method="post">
        <input type="hidden" name="boardNo" value="${board.boardNo}">
        <table border="1">
            <tr>
                <th>제목</th>
                <td><input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea id="boardContent" name="boardContent">${board.boardContent}</textarea></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" id="boardUser" name="boardUser" value="${board.boardUser}" readonly></td>
            </tr>
        </table>
        <button type="button" id="updateBtn">수정하기</button>
        <button type="button" onclick="location.href='/boardOne?boardNo=${board.boardNo}'">취소</button>
    </form>

<script>
    $(function() {
        $('#updateBtn').click(function() {
            $('form').submit();
        });
    });
</script>
</body>
</html>