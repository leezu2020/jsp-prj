<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>첫번째 페이지</title>
</head>
<body>
	Hello World!
	<form action="./userJoinAction.jsp" method="post"> <!-- post는 외부에 보이지않게 전달 약간의 보안성 -->
		<input type="text" name="userID">
		<input type="password" name="userPassword">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>