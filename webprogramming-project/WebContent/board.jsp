<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
/* 전체 페이지 스타일 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
	background-color: #f2f2f2;
}

/* 메뉴 바 스타일 */
.menu-bar {
	margin-bottom: 20px; /* menu.jsp와의 간격을 조절 */
}

/* 글목록 컨테이너 */
.post-list {
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
	max-width: 1000px; /* 최대 너비 설정 */
	margin: 100px 400px 0px 400px; /* 상단 간격 조절 */
}

/* 글목록 항목 스타일 */
.post-item {
	border-bottom: 1px solid #e5e5e5;
	padding: 10px 0;
}

/* 글목록 제목 */
.post-title {
	font-size: 18px;
	font-weight: bold;
}

/* 글목록 내용 */
.post-content {
	margin-top: 5px;
	color: #555555;
}

/* 글목록 날짜 */
.post-date {
	font-size: 12px;
	color: #999999;
}
/* 글작성자 */
.post-author {
	font-size: 12px;
	color: #999999;
}
/* 글작성 버튼 */
.write-button {
	float: right;
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
}
</style>
</head>
<body>
	<h1>자유게시판</h1>
	<jsp:include page="menubar.jsp" />

	<div class="post-list">
		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			if (userID != null) {
		%>
		<button class="btn btn-primary" onclick="location.href = 'write.jsp' "
			style="float: right">글작성</button>
		<%
			}
		%>
		<div class="post-item">
			<div>
				<div class="post-title">게시글 제목 1</div>
				<div class="post-content">게시글 내용 1</div>
				<div class="post-author">작성자: John Doe</div>
			</div>
			<div>
				<div class="post-date">작성일: 2023-05-23</div>
			</div>
		</div>
		<div class="post-item">
			<div>
				<div class="post-title">게시글 제목 1</div>
				<div class="post-content">게시글 내용 1</div>
				<div class="post-author">작성자: John Doe</div>
			</div>
			<div>
				<div class="post-date">작성일: 2023-05-23</div>
			</div>
		</div>
		<div class="post-item">
			<div>
				<div class="post-title">게시글 제목 1</div>
				<div class="post-content">게시글 내용 1</div>
				<div class="post-author">작성자: John Doe</div>
			</div>
			<div>
				<div class="post-date">작성일: 2023-05-23</div>
			</div>
		</div>
	</div>
</body>
</html>