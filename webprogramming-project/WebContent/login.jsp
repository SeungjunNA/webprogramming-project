<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js">
		
	</script>
	<h1>로그인 화면</h1>
	<jsp:include page="menubar.jsp"></jsp:include>

	<form method="post" action="loginAction.jsp" style="padding: 150px 500px 0px 500px;">
		<h3 style="text-align: center;">로그인 화면</h3>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">ID</label> 
			<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">Password</label>
			<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
		</div>
		<button type="login" class="btn btn-primary">로그인</button>
		<button type="join" class="btn btn-primary" href="join.jsp"">회원가입</button>
	</form>		
</body>
</html>