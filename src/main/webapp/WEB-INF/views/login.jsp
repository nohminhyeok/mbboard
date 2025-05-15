<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${loginMember == null}">
		<!-- 로그인이 안 되어 있다면 -->
		<form method="post" action="/login">
			<div>
				<div>memberId:</div>
				<div><input type="text" name="memberId"></div>
				<div>memberPw:</div>
				<div><input type="password" name="memberPw"></div>
				<div><button type="submit">로그인</button></div>
			</div>
		</form>
		<a href="/joinMember">회원가입</a>
	</c:if>
	
	<!-- 로그인 되어 있다면 -->
	<c:if test="${loginMember != null && loginMember.memberRole != 'ADMIN'}">
		<div>
			${loginMember.memberId}님 <a href="/member/memberHome">Home</a>으로 이동
		</div>
		<div>
			<a href="/logout">로그아웃</a>
		</div>
	</c:if>
	<c:if test="${loginMember.memberRole == 'ADMIN'}">
		<div>
			${loginMember.memberId}님 <a href="/admin/adminHome">관리자 사이트</a>로 이동
		</div>
		<div>
			<a href="/logout">로그아웃</a>
		</div>
	</c:if>
</body>
</html>