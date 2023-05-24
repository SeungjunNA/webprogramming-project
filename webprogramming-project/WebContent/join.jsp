<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menubar.jsp"></jsp:include>

	<form method="post" action="joinAction.jsp"
		style="padding: 150px 500px 0px 500px;">
		<h3 style="text-align: center;">회원가입 화면</h3>
		<div class="mb-3">
			<label class="form-label">ID</label> <input type="text"
				class="form-control" placeholder="아이디" name="userID" maxlength="20">
		</div>
		<div class="mb-3">
			<label class="form-label">Password</label> <input type="password"
				class="form-control" placeholder="비밀번호" name="userPassword"
				maxlength="20">
		</div>
		<div class="mb-3">
			<label class="form-label">E-mail</label> <input type="text"
				class="form-control" placeholder="이메일" name="userEmail"
				maxlength="40">
		</div>
		<div class="mb-3">
			<div class="row">
				<div class="col">
					<label class="form-label">Name</label> <input type="text"
						class="form-control" placeholder="이름" name="userName">
				</div>
				<div class="col">
					<label class="form-label">Nickname</label> <input type="text"
						class="form-control" placeholder="닉네임" name="userNickname">
				</div>
			</div>
		</div>
		<div class="mb-3">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="userGender" id="inlineRadio1" value="남자"> 
				<label class="form-check-label" for="inlineRadio1">남자</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio"
					name="userGender" id="inlineRadio2" value="여자"> 
				<label class="form-check-label" for="inlineRadio2">여자</label>
			</div>
		</div>
		<button class="btn btn-primary">회원가입</button>
	</form>

</body>
</html>