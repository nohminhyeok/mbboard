<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>비밀번호찾기</h1>
	<form method="post" action="findMemberPw">
		memberId : <input type="text" name="memberId">
		<br>
		email : <input type="email" name="email">
		<br>
		<button type="submit">비밀번호찾기</button>
		* 10분 안에 비밀번호 변경
	</form>
</body>
</html>