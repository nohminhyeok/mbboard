<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieLogin</h1>
		<form method="post" action="/cookieLogin">
			<div>
				<div>memberId:</div>
				<div>
					<input type="text" name="memberId" value="${cookie.saveId.value}"> <!-- cookie.getSaveId() -->
					<input type="checkbox" value="yes" name="saveIdCk">아이디 저장
				</div>
				<div>memberPw:</div>
				<div><input type="password" name="memberPw"></div>
				<div><button type="submit">로그인</button></div>
			</div>
		</form>
		<a href="/joinMember">회원가입</a>
</body>
</html>