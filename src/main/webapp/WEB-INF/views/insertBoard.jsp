<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
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
        input[type="text"] {
            width: 95%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>게시글 작성</h1>
    <form id="boardForm">
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="boardTitle" id="boardTitle"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><input type="text" name="boardContent" id="boardContent"></td>
            </tr>
            <tr>
                <th>사용자</th>
                <td><input type="text" name="boardUser" id="boardUser"></td>
            </tr>
        </table>
        <div style="text-align: center;">
            <button type="button" id="generBtn">작성하기</button>
        </div>
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
