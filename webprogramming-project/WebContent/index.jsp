<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>심희스토리</title>
<style>
/* 전체 페이지 스타일 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
	background-color: #f2f2f2;
}
.home-container{
	display:flex;
}
/* 회원정보칸 스타일 */
.member-info {
	flex-basis: 25%;
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-right: 20px;
	margin-top:150px;
}

/* 박스 컨테이너 스타일 */
.box-container {
	flex-basis: 75%;
	display: flex;
	justify-content: space-between;
	margin-top:100px;
}

/* 박스 스타일 */
.box {
	width: calc(50% - 10px);
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 20px;
}

/* 글목록 제목 스타일 */
.post-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<h1>홈 화면</h1>
	<jsp:include page="menubar.jsp"></jsp:include>

	<div class="home-container">
		<%-- 회원 정보칸 --%>
		<div class="member-info">
			<h2>회원 정보</h2>
			<%-- 회원 정보 내용을 여기에 추가 --%>
			<p>회원 이름: John Doe</p>
			<p>아이디: johndoe123</p>
			<p>닉네임: JD</p>
		</div>

		<%-- 박스 컨테이너 --%>
		<div class="box-container">
			<%-- 박스 1 --%>
			<div class="box">
				<h2 class="post-title">글목록 제목 1</h2>
			</div>

			<%-- 박스 2 --%>
			<div class="box">
				<h2 class="post-title">글목록 제목 2</h2>
			</div>
		</div>
	</div>
</body>
</html>