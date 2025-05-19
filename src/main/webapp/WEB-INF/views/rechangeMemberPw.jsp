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
	<h1>rechangeMemberPw</h1>
	<form method="post" action="/rechangeMemberPw">
		<div>
			memberId : <input type="text" name="memberId">
		</div>
		<div>
			메일로 받은 Pw : <input type="password" name="memberPw">
		</div>
		<div>
			변경할 Pw : <input type="password" name="reMemberPw">
		</div>
		<button type="submit">패스워드 변경</button>
	</form>
</body>
</html>