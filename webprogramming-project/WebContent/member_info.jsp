<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<style>
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

form h2 {
	text-align: center;
}

form input {
	width: 100%;
	padding: 8px;
	margin-bottom: 15px;
	border-radius: 3px;
	border: 1px solid #ccc;
}
</style>
</head>
<body>

	<jsp:include page="menubar.jsp"></jsp:include>
	<div class="container">
		<%
			String userID = null;
			String userName = null;
			String userNickname = null;
			String userEmail = null;
			String userGender = null;
			String userPassword = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
				User user = new UserDAO().getUser(userID);
				userPassword = user.getUserPassword();
				userName = user.getUserName();
				userEmail = user.getUserEmail();
				userNickname = user.getUserNickname();
				userGender = user.getUserGender();
			}
		%>
		<%-- 회원 정보 수정 폼 --%>
		<form action="updateMemberAction.jsp" method="POST">
			<h2>회원 정보 수정</h2>
			<label for="name">이름:</label> 
			<input type="text" name="userName" value="<%=userName%>" disabled><br> 
			<label for="email">이메일:</label> <input type="email" name="userEmail" value="<%=userEmail%>"><br>
			<label for="id">아이디:</label> <input type="text" name="userID" value="<%=userID%>" disabled><br> 
			<label for="password">비밀번호:</label> <input type="password" name="userPassword" value="<%=userPassword%>"><br>
			<label for="nickname">닉네임:</label> <input type="text" name="userNickname" value="<%=userNickname%>"><br> 
			<label for="gender">성별:</label> <input type="text" name="userGender" value="<%=userGender%>" disabled><br> 
			<input class="btn btn-primary" type="submit" value="수정">
		</form>
	</div>

</body>
</html>
