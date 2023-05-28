<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	padding: 0;
	background-color: #f2f2f2;
}

.container {
	max-width: 800px;
	margin: 80px auto 0;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}

.post-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #333;
}

.post-details {
	font-size: 14px;
	color: #888;
	margin-bottom: 20px;
}

.post-content {
	margin-bottom: 20px;
	color: #555;
	line-height: 1.5;
}

.back-link {
	display: inline-block;
	margin-top: 10px;
	color: #888;
	text-decoration: none;
}

.back-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<jsp:include page="menubar.jsp"></jsp:include>
	<div class="container">
		<h1 class="post-title">게시판 상세 페이지</h1>
		<div class="post-details">
			<span class="post-date">작성일: </span> <span class="post-author">작성자:
			</span>
		</div>
		<div class="post-content">내용</div>
		<a href="javascript:history.back();" class="back-link">뒤로 가기</a>
	</div>
</body>
</html>