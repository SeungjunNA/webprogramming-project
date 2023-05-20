<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>자유게시판</h1>
	<jsp:include page="menubar.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<%
				String userID = null;
				if (session.getAttribute("userID") != null) {
					userID = (String) session.getAttribute("userID");
				}
				if (userID != null) {
			%>
			<div>
				<a style="float: right" class="btn btn-primary" href="write.jsp">글쓰기</a>
			</div>
			<%
				}
			%>
			<table class="table">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>tto</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>