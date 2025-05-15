<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시판 목록</title>
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
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        button, input[type="submit"] {
            padding: 8px 12px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        button:hover, input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>게시판 목록</h2>
    <button type="button" id="insertBtn">게시글 작성</button>
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
        </tr>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.boardNo}</td>
                <td>
                    <a href="/boardOne?boardNo=${board.boardNo}">${board.boardTitle}</a>
                </td>
                <td>${board.boardContent}</td>
                <td>${board.boardUser}</td>
            </tr>
        </c:forEach>
    </table>
    <form action="/boardList" method="get">
        <select name="searchOption">
            <option value="all" ${searchOption == 'all' ? 'selected' : ''}>전체</option>
            <option value="title" ${searchOption == 'title' ? 'selected' : ''}>제목</option>
            <option value="content" ${searchOption == 'content' ? 'selected' : ''}>내용</option>
            <option value="user" ${searchOption == 'user' ? 'selected' : ''}>사용자</option>
        </select>
        <input type="text" name="searchWord" value="${searchWord}" placeholder="검색어">
        <input type="submit" value="검색">
    </form>
    <script>
        $(function(){
            $('#insertBtn').click(function(){
                window.location.href = '/insertBoard';
            });
        });
    </script>
</body>
</html>
