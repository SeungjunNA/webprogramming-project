<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.SecretBoardDAO"%>
<%@ page import="board.SecretBoard"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀게시판</title>
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
	margin-bottom: 20px;
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
	<jsp:include page="secretMenubar.jsp" />
	<div class="post-list">
		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			int pageNumber = 1;
			if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
			if (userID != null) {
		%>
		<button class="btn btn-primary"
			onclick="location.href = 'secretWrite.jsp' " style="float: right">글작성</button>
		<%
			}
		%>
		<div class="post-item">
			<%
				SecretBoardDAO secretBoardDAO = new SecretBoardDAO();
				String searchText = request.getParameter("searchText");
				ArrayList<SecretBoard> list = secretBoardDAO.getSearchList(pageNumber, searchText);
				for (int i = 0; i < list.size(); i++) {
			%>
			<div>
				<div class="post-id">
					<%=list.get(i).getBoardID()%>
				</div>
				<div class="post-title"
					onclick="location.href='secretDetail.jsp?boardID=<%=list.get(i).getBoardID()%>'">
					<%=list.get(i).getBoardTitle()%>
				</div>
			</div>
			<div>
				<div class="post-date"><%=list.get(i).getBoardDate()%></div>
			</div>
			<%
				}
			%>

		</div>
		<%
			if (pageNumber != 1) {
		%>
		<a href="secretBoard.jsp?pageNumber=<%=pageNumber - 1%>"
			class="btn btn-primary">이전</a>
		<%
			}
			if (list.size() / 10 > 0 && list.size() % 10 > 0) {
		%>
		<a href="secretBoard.jsp?pageNumber=<%=pageNumber + 1%>"
			class="btn btn-primary">다음</a>
		<%
			}
		%>
	</div>
</body>
</html>