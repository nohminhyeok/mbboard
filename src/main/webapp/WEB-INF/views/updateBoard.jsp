<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        body {
            font-family: 'SUIT', sans-serif;
            background-color: #f4f6f8;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        h1, h2 {
            text-align: center;
            margin: 20px 0;
        }
        table {
            width: 60%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        button {
            padding: 8px 16px;
            margin: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
        }
        button:hover {
            background-color: #45a049;
        }
        input[type="text"], textarea {
            width: 95%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h2>게시글 수정</h2>
    <form action="/updateBoard" method="post">
        <input type="hidden" name="boardNo" value="${board.boardNo}">
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea id="boardContent" name="boardContent" rows="5">${board.boardContent}</textarea></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" id="boardUser" name="boardUser" value="${board.boardUser}" readonly></td>
            </tr>
        </table>
        <div style="text-align: center;">
            <button type="button" id="updateBtn">수정하기</button>
            <button type="button" onclick="location.href='/boardOne?boardNo=${board.boardNo}'">취소</button>
        </div>
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
