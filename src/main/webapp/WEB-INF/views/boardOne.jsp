<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시글</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        table {
            width: 60%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        button {
            margin: 10px;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>게시글</h1>
    <form>
        <table>
            <tr><th>번호</th><td>${board.boardNo}</td></tr>
            <tr><th>제목</th><td>${board.boardTitle}</td></tr>
            <tr><th>내용</th><td>${board.boardContent}</td></tr>
            <tr><th>작성자</th><td>${board.boardUser}</td></tr>
            <tr><th>수정일</th><td>${board.updatedate}</td></tr>
            <tr><th>생성일</th><td>${board.createdate}</td></tr>
        </table>
        <button type="button" id="goBoard">게시판 이동</button>
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
